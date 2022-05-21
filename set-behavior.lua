include('texts')
include('ability-data')
include('utils')
res = require('resources')

---------------------------------------------------------
---- Configuration                                   ----
---------------------------------------------------------
lockstyleset = 1
text_settings = {
    pos = {
        x = 1775,
        y = 1290
    },
    text = {
        size = 14
    },
    padding = 1,
    flags = {
        bold = true,
        draggable = false
    }
}

---------------------------------------------------------
---- State                                           ----
---------------------------------------------------------
local buffs = S {}
local th_on_tag = false
local previousTarget = nil
local currentTarget = nil
local current_stances = {}

local is_debug = false
---------------------------------------------------------
---- Gearswap functions                              ----
---------------------------------------------------------
function get_sets()
    sets.TP = {}
    sets.TPMod = {}
    sets.mod = {}
    sets.DT = {}
    sets.Idle = {}
    sets.Idle_Avatar = {}
    sets.Idle_Spirit = {}
    sets.item = {}
    sets.precast = {}
    sets.midcast = {}
    sets.midcast.BlueMagic = {}
    sets.midcast.Ninja = {}
    sets.midcast.Songs = {}
    sets.midcast.mod = {}
    sets.aftercast = {}
    sets.pet_midcast = {}
    sets.WS = {}
    sets.JA = {}
    stances = {}

    no_shoot_ammo = S {}
    ammo_threshold = 10
    tool_threshold = 10
    pet_food_threshold = 5
    distance_threshold = 10

    Melee_Modes = T {}
    Idle_Modes = T {}
    Magic_Modes = T {}
    Melee_Mode = 1
    Idle_Mode = 1
    Magic_Mode = 1

    lock_gear = S {"Warp Ring", "Dim. Ring (Holla)", "Dim. Ring (Dem)", "Dim. Ring (Mea)", "Reraise Hairpin",
                   "Reraise Earring", "Echad Ring", "Endorsement Ring", "Trizek Ring", "Capacity Ring", "Facility Ring",
                   "Caliber Ring"}

    MB_Mode = false

    send_command('bind f9 gs c MeleeMode')
    send_command('bind ^f9 gs c THMode')
    send_command('bind f10 gs c IdleMode')
    send_command('bind ^f10 gs c clearStances')
    send_command('bind f11 gs c MagicMode')
    send_command('bind f12 gs c EquipGear')
    send_command('bind ^f12 gs c EquipGear override')

    define_sets()

    melee_settings = table.copy(text_settings)
    idle_settings = table.copy(text_settings)
    magic_settings = table.copy(text_settings)
    stance_settings = table.copy(text_settings)

    line_height = text_settings.text.size * 1.5 + text_settings.padding * 2 + 3
    idle_settings.pos.y = idle_settings.pos.y + line_height
    magic_settings.pos.y = magic_settings.pos.y + line_height * 2
    stance_settings.pos.y = stance_settings.pos.y + line_height * 3

    melee_display = texts.new('Melee: ${mode}${th_mod}', melee_settings)
    melee_display.mode = Melee_Modes[Melee_Mode]
    melee_display.th_mod = ''
    texts.show(melee_display)

    idle_display = texts.new('Idle: ${mode}', idle_settings)
    idle_display.mode = Idle_Modes[Idle_Mode]
    texts.show(idle_display)

    magic_display = texts.new('Magic: ${mode}', magic_settings)
    magic_display.mode = Magic_Modes[Magic_Mode]
    texts.show(magic_display)

    if next(stances) ~= nil then
        stance_display = texts.new('Stances: ${stances}', stance_settings)
        stance_display.stances = ''
        texts.show(stance_display)
    end

    enable("main", "sub", "range", "ammo", "head", "neck", "left_ear", "right_ear", "body", "hands", "left_ring",
        "right_ring", "back", "waist", "legs", "feet")
end

function file_unload(new_file)
    send_command('unbind f9')
    send_command('unbind f10')
    send_command('unbind ^f10')
    send_command('unbind f11')
    send_command('unbind f12')
    send_command('unbind ^f12')
    if melee_display ~= nil then
        texts.destroy(melee_display)
    end
    if idle_display ~= nil then
        texts.destroy(idle_display)
    end
    if magic_display ~= nil then
        texts.destroy(magic_display)
    end
    if stance_display ~= nil then
        texts.destroy(stance_display)
    end
    cleanup()
end

function precast(spell)
    log_debug("Precast: " .. spell.name)

    precast_set = nil

    -- Determine which mode to use for this ability
    if spell.cast_time == nil then
        log_debug("Using melee mode")
        mode = Melee_Modes[Melee_Mode]
    else
        log_debug("Using magic mode")
        mode = Magic_Modes[Magic_Mode]
    end

    if no_action_types:contains(spell.type) then
        if sets.item[spell.name] ~= nil then
            precast_set = get_set(sets.item[spell.name], mode)
        else
            log_debug("no action")
            return
        end
    end

    -- Check stances to see if we need to update
    for stance_set, abilities in pairs(stances) do
        for name in pairs(abilities) do
            if name == spell.name then
                log_debug("Setting " .. stance_set .. " to " .. name)
                current_stances[stance_set] = spell
            end
        end
        update_stance_display()
    end

    -- If a pet is mid-action, then don't swap sets
    if (pet.isvalid and pet_midaction() and not spell.type == 'SummonerPact') then
        log_debug("pet is mid-action. Not changing sets.")
        return
    end

    -- Spell-specific sets
    if sets.precast[spell.name] ~= nil then
        log_debug("spell-specific set")
        precast_set = get_set(sets.precast[spell.name], mode)
    elseif sets.JA[spell.name] ~= nil then
        log_debug("spell-specific set")
        precast_set = get_set(sets.JA[spell.name], mode)
    elseif sets.WS[spell.name] ~= nil then
        log_debug("spell-specific set")
        precast_set = get_set(sets.WS[spell.name], mode)
    end

    -- Ranged attack
    if spell.action_type == 'Ranged Attack' and sets.precast.RA ~= nil then
        log_debug("ranged attack")
        precast_set = get_set(sets.precast.RA, mode)
    end

    -- Phantom roll
    if precast_set == nil then
        if spell.type == "CorsairRoll" then
            if sets.precast["Phantom Roll"] ~= nil then
                log_debug("Phantom Roll")
                precast_set = get_set(sets.precast["Phantom Roll"], mode)
            elseif sets.JA["Phantom Roll"] ~= nil then
                log_debug("Phantom Roll")
                precast_set = get_set(sets.JA["Phantom Roll"], mode)
            end
        end
    end

    -- Quick Draw
    if precast_set == nil then
        if spell.type == "CorsairShot" then
            if sets.precast["Quick Draw"] ~= nil then
                log_debug("Quick Draw")
                precast_set = get_set(sets.precast["Quick Draw"], mode)
            elseif sets.JA["Quick Draw"] ~= nil then
                log_debug("Quick Draw")
                precast_set = get_set(sets.JA["Quick Draw"], mode)
            end
        end
    end

    -- Blood Pacts
    if precast_set == nil then
        if (spell.type == "BloodPactWard" or spell.type == "BloodPactRage") and not buffactive["Astral Conduit"] then
            if sets.precast["Blood Pact"] ~= nil then
                log_debug("Blood Pact")
                precast_set = get_set(sets.precast["Blood Pact"], mode)
            elseif sets.JA["Blood Pact"] ~= nil then
                log_debug("Blood Pact")
                precast_set = get_set(sets.JA["Blood Pact"], mode)
            end
        end
    end

    -- Ready Moves
    if precast_set == nil then
        if spell.type == "Monster" then
            if sets.precast.Ready ~= nil then
                log_debug("Ready Move")
                precast_set = get_set(sets.precast.Ready, mode)
            elseif sets.JA.Ready ~= nil then
                log_debug("Ready Move")
                precast_set = get_set(sets.JA.Ready, mode)
            end
        end
    end

    -- String-search-based sets
    if precast_set == nil then
        for name, set in pairs(sets.precast) do
            if string.find(spell.name, name) then
                -- Spell-family sets
                log_debug("Spell Family")
                precast_set = get_set(set, mode)
            elseif string.find(spell.type, name) then
                -- Spell-type sets
                log_debug("Spell Family")
                precast_set = get_set(set, mode)
            elseif spell.skill ~= nil and string.find(spell.skill, name) then
                -- Spell skill sets
                log_debug("Spell Family")
                precast_set = get_set(set, mode)
            end
        end
    end

    -- Partial JA matches
    if precast_set == nil then
        for name, set in pairs(sets.JA) do
            if string.find(spell.name, name) then
                log_debug("Partial JA match")
                precast_set = get_set(set, mode)
            end
        end
    end

    -- Generic sets
    if precast_set == nil then
        if spell.cast_time == nil then
            --------------------
            -- Instant Abilities
            --------------------
            if spell.type == "WeaponSkill" then
                if ElementalWS:contains(spell.name) then
                    if sets.WS.MAB ~= nil then
                        log_debug("Generic Magic WS")
                        precast_set = get_set(sets.WS.MAB, mode)
                    elseif sets.WS.Elemental ~= nil then
                        log_debug("Generic Magic WS")
                        precast_set = get_set(sets.WS.Elemental, mode)
                    end
                end
                if precast_set == nil then
                    if sets.WS.Generic ~= nil then
                        log_debug("Generic WS")
                        precast_set = get_set(sets.WS.Generic, mode)
                    end
                end
            end
        else
            ----------------------
            -- Cast-time abilities
            ----------------------
            -- Generic Fast Cast
            if sets.precast.FastCast ~= nil then
                log_debug("Generic Fast Cast")
                precast_set = get_set(sets.precast.FastCast, mode)
            end
        end
    end

    -- Only equip weather gear during precast for instant-cast abilities. Any others will equip it during midcast
    if spell.cast_time == nil and ElementalWS:contains(spell.name) and weather_match(spell) and sets.Weather ~= nil then
        log_debug("Equipping Weather Gear")
        precast_set = set_combine(precast_set, get_set(sets.Weather, mode))
    end

    -- If distance_threshold is set and the player is closer than the threshold, equip distance gear
    if distance_threshold ~= nil and spell.target.distance < distance_threshold and (ElementalWS:contains(spell.name)) and
        sets.Distance ~= nil then
        log_debug("Equipping Distance Gear")
        precast_set = set_combine(precast_set, get_set(sets.Distance, mode))
    end

    precast_set = mod_precast(spell, precast_set)

    -- Get ammo counts
    -- Ammo count for: Ranged Attack, Ranged Weaponskill, Quick Draw, Ranged JAs
    if spell.action_type == 'Ranged Attack' or
        (spell.type == 'WeaponSkill' and (spell.skill == 'Marksmanship' or spell.skill == 'Archery')) or
        RangedJAs:contains(spell.name) then
        -- find the ammo that we're using
        if precast_set ~= nil then
            ammo_to_check = precast_set.ammo or player.equipment.ammo
        else
            ammo_to_check = player.equipment.ammo
        end
        if ammo_to_check ~= nil and ammo_to_check ~= 'empty' then
            available_ammo = player.inventory[ammo_to_check] or player.wardrobe[ammo_to_check]

            if available_ammo == nil then
                notice('No ' .. ammo_to_check .. ' left!')
            elseif available_ammo.count < ammo_threshold then
                notice('***** Running low on ' .. ammo_to_check .. '! ' .. available_ammo.count .. ' left *****')
            end

            -- Check for no-shoot ammo
            if no_shoot_ammo:contains(player.equipment.ammo) and
                (spell.type ~= 'CorsairShot' or buffactive['Unlimited Shot'] == nil) and
                (available_ammo == nil or precast_set == nil or
                    (precast_set ~= nil and precast_set.ammo == player.equipment.ammo)) then
                notice('You\'re trying to shoot ' .. player.equipment.ammo .. '! Canceling')
                cancel_spell()
            end
        end
    end

    -- Get tool counts
    if spell.type == 'Ninjutsu' then
        pet_food_to_check = NinjutsuTools[spell.name]
        pet_food_available = player.inventory[pet_food_to_check]
        if (pet_food_available == nil or pet_food_available.count < tool_threshold) and player.main_job == 'NIN' then
            nin_tool_to_check = NinjutsuUniversalTools[spell.name]
            nin_tool_available = player.inventory[nin_tool_to_check]
            if nin_tool_available ~= nil and
                (pet_food_available == nil or nin_tool_available.count > pet_food_available.count) then
                pet_food_to_check = nin_tool_to_check
                pet_food_available = nin_tool_available
            end
        end
        if pet_food_available == nil then
            pet_food_count = 0
        else
            pet_food_count = pet_food_available.count
        end

        if pet_food_count < tool_threshold then
            notice('***** Running low on ' .. pet_food_to_check .. '! ' .. pet_food_count .. ' left *****')
        end
    elseif spell.name == 'Reward' then
        pet_food_to_check = precast_set.ammo
        pet_food_available = player.inventory[pet_food_to_check]
        if pet_food_available == nil then
            pet_food_count = 0
        else
            pet_food_count = pet_food_available.count
        end
        if pet_food_count < pet_food_threshold then
            notice('***** Running low on ' .. pet_food_to_check .. '! ' .. pet_food_count .. ' left *****')
        end
    end

    -- If a spell is being cast that will fail with a buff up, cancel the buff
    if spell.target.type == 'SELF' then
        for checkSpell, config in pairs(CancelSpells) do
            if spell.name == checkSpell then
                for cancelBuff, wait in pairs(config) do
                    if buffactive[cancelBuff] ~= nil then
                        log_debug("Canceling " .. cancelBuff)
                        if wait > 0 then
                            if fastcast ~= nil then
                                wait_time = wait * (1 - fastcast)
                            else
                                wait_time = wait
                            end
                            send_command('@wait ' .. wait_time .. ';cancel ' .. cancelBuff)
                        else
                            send_command('cancel ' .. cancelBuff)
                        end
                    end
                end
            end
        end
    end

    -- If the spell is a job ability, then add it to the list of buffs
    if BuffJAs:contains(spell.name) and spell.target.type == 'SELF' then
        buffs:add(spell.name)
    end

    equip(precast_set)
end

function midcast(spell)
    log_debug("Midcast: " .. spell.name)
    if no_action_types:contains(spell.type) then
        log_debug("no action")
        return
    end

    -- If a pet is mid-action, then don't swap sets
    if (pet.isvalid and pet_midaction()) then
        log_debug("Pet is mid-action. Not changing sets.")
        return
    end

    -- For spells without a cast time (like job abilities or weapon skills), gear swaps happen in the precast
    if spell.cast_time == nil and spell.action_type ~= 'Ranged Attack' then
        log_debug("This is an instant ability! Skipping midcast")
        return
    end

    midcast_set = nil
    mode = Magic_Modes[Magic_Mode]

    if MB_Mode and sets.midcast[spell.name .. 'MB'] then
        -- Spell-specific magic burst
        log_debug("Spell-specific magic burst")
        midcast_set = get_set(sets.midcast[spell.name .. 'MB'], mode)
    elseif spell.target.type == 'SELF' and sets.midcast[spell.name .. 'Self'] then
        -- Self-targeted spells
        log_debug("Self-targeted spell")
        midcast_set = get_set(sets.midcast[spell.name .. 'Self'], mode)
    elseif sets.midcast[spell.name] then
        -- Spell-specific sets
        log_debug("Spell-specific set")
        midcast_set = get_set(sets.midcast[spell.name], mode)
    end

    if spell.action_type == 'Ranged Attack' and sets.midcast.RA ~= nil then
        log_debug("Ranged attack")
        midcast_set = get_set(sets.midcast.RA, Melee_Modes[Melee_Mode])
    end

    ----------------------
    -- Spell name matching
    ----------------------
    if midcast_set == nil then
        for name, set in pairs(sets.midcast) do
            if MB_Mode and ends_with(name, 'MB') and string.find(spell.name, name:sub(1, -3)) then
                -- Partial name magic burst
                log_debug("Partial name magic burst")
                midcast_set = get_set(set, mode)
                break
            elseif spell.target.type == 'SELF' and ends_with(name, 'Self') and string.find(spell.name, name:sub(1, -5)) then
                -- Partial name self-targeted
                log_debug("Partial name self-targeted spell")
                midcast_set = get_set(set, mode)
                break
            elseif string.find(spell.name, name) then
                log_debug("Partial spell name match: " .. name)
                midcast_set = get_set(set, mode)
            end
        end
    end

    ------------------
    -- Magic-type sets
    ------------------
    if midcast_set == nil then
        if spell.skill == "Healing Magic" then
            if NaSpells:contains(spell.name) and sets.midcast.NaSpell ~= nil then
                log_debug("-na spell")
                midcast_set = get_set(sets.midcast.NaSpell, mode)
            elseif spell.target.type == 'SELF' and sets.midcast.CureSelf ~= nil then
                log_debug("Self-cure")
                midcast_set = get_set(sets.midcast.CureSelf, mode)
            elseif sets.midcast.Healing ~= nil then
                log_debug("Healing spell")
                midcast_set = get_set(sets.midcast.Healing, mode)
            end
        elseif spell.skill == "Enhancing Magic" then
            if EnhancingSpells:contains(spell.name) and spell.target.type == 'SELF' and sets.midcast.EnhancingSelf ~=
                nil then
                log_debug("Self-enhancing spell")
                midcast_set = get_set(sets.midcast.EnhancingSelf, mode)
            elseif EnhancingSpells:contains(spell.name) and sets.midcast.Enhancing ~= nil then
                log_debug("Enhancing spell")
                midcast_set = get_set(sets.midcast.Enhancing, mode)
            elseif spell.target.type == 'SELF' and sets.midcast.EnhancingDurationSelf ~= nil then
                log_debug("Enhancing duration self-targeted spell")
                midcast_set = get_set(sets.midcast.EnhancingDurationSelf, mode)
            elseif sets.midcast.EnhancingDuration ~= nil then
                log_debug("Enhancing duration spell")
                midcast_set = get_set(sets.midcast.EnhancingDuration, mode)
            elseif spell.target.type == 'SELF' and sets.midcast.EnhancingSelf ~= nil then
                log_debug("Self-enhancing spell")
                midcast_set = get_set(sets.midcast.EnhancingSelf, mode)
            elseif sets.midcast.Enhancing ~= nil then
                log_debug("Enhancing spell")
                midcast_set = get_set(sets.midcast.Enhancing, mode)
            end
        elseif spell.skill == "Enfeebling Magic" then
            if EnfeeblingMND:contains(spell.name) and sets.midcast.EnfeeblingMND ~= nil then
                log_debug("MND-based enfeebling spell")
                midcast_set = get_set(sets.midcast.EnfeeblingMND, mode)
            elseif EnfeeblingINT:contains(spell.name) and sets.midcast.EnfeeblingINT ~= nil then
                log_debug("INT-based enfeebling spell")
                midcast_set = get_set(sets.midcast.EnfeeblingINT, mode)
            elseif sets.midcast.Enfeebling ~= nil then
                log_debug("Enfeebling spell")
                midcast_set = get_set(sets.midcast.Enfeebling, mode)
            elseif sets.midcast.MAcc ~= nil then
                log_debug("Enfeebling spell - using MAcc set")
                midcast_set = get_set(sets.midcast.MAcc, mode)
            end
        elseif spell.skill == "Divine Magic" then
            if DivineEnfeebles:contains(spell.name) and sets.midcast.DivineEnfeeble ~= nil then
                log_debug("Divine enfeebling spell")
                midcast_set = get_set(sets.midcast.DivineEnfeeble, mode)
            elseif DivineEnhancing:contains(spell.name) and sets.midcast.DivineEnhancing ~= nil then
                log_debug("Diving enhancing spell")
                midcast_set = get_set(sets.midcast.DivineEnhancing, mode)
            elseif MB_Mode and sets.midcast.DivineMB ~= nil then
                log_debug("Divine magic burst")
                midcast_set = get_set(sets.midcast.DivineMB, mode)
            elseif sets.midcast.Divine ~= nil then
                log_debug("Divine spell")
                midcast_set = get_set(sets.midcast.Divine, mode)
            end
        elseif spell.skill == "Elemental Magic" then
            if MB_Mode and sets.midcast.ElementalMB ~= nil then
                log_debug("Elemental magic burst")
                midcast_set = get_set(sets.midcast.ElementalMB, mode)
            elseif sets.midcast.Elemental ~= nil then
                log_debug("Elemental magic")
                midcast_set = get_set(sets.midcast.Elemental, mode)
            end
        elseif spell.skill == "Dark Magic" then
            if sets.midcast.DarkMagic ~= nil then
                log_debug("Dark magic")
                midcast_set = get_set(sets.midcast.DarkMagic, mode)
            end
        elseif spell.type == "BlueMagic" then
            magic_type = BlueMagic[spell.english]
            log_debug("Blue magic type: " .. magic_type)
            if magic_type == 'static' and sets.midcast.BlueMagic.Static ~= nil then
                log_debug("Blue magic static buff")
                midcast_set = get_set(sets.midcast.BlueMagic.Static, mode)
            elseif magic_type == 'physical' and sets.midcast.BlueMagic.Physical ~= nil then
                log_debug("Blue magic physical")
                midcast_set = get_set(sets.midcast.BlueMagic.Physical, mode)
            elseif magic_type == 'addeffect' and sets.midcast.BlueMagic.AddEffect ~= nil then
                log_debug("Blue magic added effect")
                midcast_set = get_set(sets.midcast.BlueMagic.AddEffect, mode)
            elseif magic_type == 'magical' and sets.midcast.BlueMagic.MAB ~= nil then
                log_debug("Blue magic magical damage")
                midcast_set = get_set(sets.midcast.BlueMagic.MAB, mode)
            elseif magic_type == 'breath' and sets.midcast.BlueMagic.Breath ~= nil then
                log_debug("Blue magic breath")
                midcast_set = get_set(sets.midcast.BlueMagic.Breath, mode)
            elseif magic_type == 'cure' and spell.target.type == 'SELF' and sets.midcast.BlueMagic.CureSelf ~= nil then
                log_debug("Blue magic self-cure")
                midcast_set = get_set(sets.midcast.BlueMagic.CureSelf, mode)
            elseif magic_type == 'cure' and sets.midcast.BlueMagic.Cure ~= nil then
                log_debug("Blue magic cure")
                midcast_set = get_set(sets.midcast.BlueMagic.Cure, mode)
            elseif magic_type == 'buff' then
                if sets.midcast.BlueMagic.Buff ~= nil then
                    log_debug("Blue magic buff")
                    midcast_set = get_set(sets.midcast.BlueMagic.Buff, mode)
                elseif sets.midcast.BlueMagic.Skill ~= nil then
                    log_debug("Blue magic skill-based buff")
                    midcast_set = get_set(sets.midcast.BlueMagic.Skill, mode)
                end
            elseif magic_type == 'debuff' then
                if sets.midcast.BlueMagic.Debuff ~= nil then
                    log_debug("Blue magic debuff")
                    midcast_set = get_set(sets.midcast.BlueMagic.Debuff, mode)
                elseif sets.midcast.BlueMagic.Skill ~= nil then
                    log_debug("Blue magic skill-based debuff")
                    midcast_set = get_set(sets.midcast.BlueMagic.Skill, mode)
                end
            elseif sets.midcast.BlueMagic.Skill ~= nil then
                log_debug("Blue magic skill-based spell")
                midcast_set = get_set(sets.midcast.BlueMagic.Skill, mode)
            end
        elseif spell.type == "Ninjutsu" then
            magic_type = Ninjutsu[spell.english]
            log_debug("Ninjutsu Type: " .. magic_type)
            if magic_type == 'debuff' and sets.midcast.Ninja.Debuff ~= nil then
                log_debug("Ninjutsu debuff")
                midcast_set = get_set(sets.midcast.Ninja.Debuff, mode)
            elseif magic_type == 'nuke' and sets.midcast.Ninja.Nuke ~= nil then
                log_debug("Ninjutsu nuke")
                midcast_set = get_set(sets.midcast.Ninja.Nuke, mode)
            elseif sets.midcast.Ninja.Buff ~= nil then
                log_debug("Ninjutsu buff")
                midcast_set = get_set(sets.midcast.Ninja.Buff, mode)
            end
        elseif spell.skill == "Geomancy" and sets.midcast.Geomancy ~= nil then
            log_debug("Geomancy spell")
            midcast_set = get_set(sets.midcast.Geomancy, mode)
        elseif spell.skill == "Summoning Magic" and sets.midcast.Summon ~= nil then
            log_debug("Summoning magic")
            midcast_set = get_set(sets.midcast.Summon, mode)
        elseif spell.skill == "Singing" then
            if spell.targets['Enemy'] and sets.midcast.Songs.Debuff ~= nil then
                log_debug("Singing debuff")
                midcast_set = get_set(sets.midcast.Songs.Debuff, mode)
            elseif sets.midcast.Songs.Buff ~= nil then
                log_debug("Singing buff")
                midcast_set = get_set(sets.midcast.Songs.Buff, mode)
            end
        end
    end

    if midcast_set == nil then
        for name, set in pairs(sets.midcast) do
            if (not S {'BlueMagic', 'mod'}:contains(name)) and string.find(spell.type, name) then
                -- Spell-type sets
                log_debug("Spell type match")
                midcast_set = get_set(set, mode)
            end
        end
    end

    -- Look for a generic midcast set if none has been chosen yet
    if midcast_set == nil and sets.midcast.Generic ~= nil then
        log_debug("Generic midcast set")
        midcast_set = get_set(sets.midcast.Generic, mode)
    end

    -- If there's still no midcast set, just jump to the tp or idle set, as needed
    if midcast_set == nil then
        log_debug("Using steady-state set")
        midcast_set = steady_state()
    end

    if WeatherSpells:contains(spell.name) and weather_match(spell) and sets.Weather ~= nil then
        log_debug("Adding in weather gear")
        midcast_set = set_combine(midcast_set, get_set(sets.Weather, mode))
    end

    -- If distance_threshold is set and the player is closer than the threshold, equip distance gear
    if distance_threshold ~= nil and spell.target.distance < distance_threshold and WeatherSpells:contains(spell.name) and
        spell.skill ~= "Healing Magic" and sets.Distance ~= nil then
        log_debug("Adding in distance gear")
        midcast_set = set_combine(midcast_set, get_set(sets.Distance, mode))
    end

    -- Go through any buff-specific pieces
    for buff, buffset in pairs(sets.midcast.mod) do
        if buffactive[buff] ~= nil or buffs:contains(buff) then
            log_debug("Adding in gear for " .. buff)
            midcast_set = set_combine(midcast_set, get_set(buffset, mode))
        end
    end

    midcast_set = mod_midcast(spell, midcast_set)

    if MB_Mode then
        MB_Mode = false
        notice('Magic Burst mode is OFF')
    end

    equip(midcast_set)
end

function aftercast(spell)
    log_debug("Aftercast: " .. spell.name)

    -- If you or a pet is mid-action, then don't swap sets
    if midaction() or
        (pet.isvalid and (pet_midaction() or spell.type == 'Monster' or string.find(spell.type, 'BloodPact'))) then
        log_debug("Pet is mid-action. Not changing sets.")
        return
    end

    aftercast_set = steady_state()

    aftercast_set = mod_aftercast(spell, aftercast_set)

    equip(aftercast_set)
end

function pet_midcast(spell)
    log_debug("Pet midcast: " .. spell.name)
    pet_set = nil

    if S {PetAbilityTypes.healing, PetAbilityTypes.magic, PetAbilityTypes.magicTP, PetAbilityTypes.mnd}:contains(
        spell.name) then
        log_debug("Using magic mode")
        mode = Magic_Modes[Magic_Mode]
    else
        log_debug("Using melee mode")
        mode = Melee_Modes[Melee_Mode]
    end

    -- Spell-specific sets
    if sets.pet_midcast[spell.name] then
        log_debug("Spell-specific set")
        pet_set = get_set(sets.pet_midcast[spell.name], mode)
    end

    ----------------------
    -- Spell name matching
    ----------------------
    if pet_set == nil then
        for name, set in pairs(sets.pet_midcast) do
            if string.find(spell.name, name) then
                log_debug("Partial name match")
                pet_set = get_set(set, mode)
            end
        end
    end

    if pet_set == nil then
        pet_ability_type = PetAbilities[spell.name]
        log_debug("Pet ability type: " .. tostring(pet_ability_type))
        if pet_ability_type == PetAbilityTypes.buff and sets.pet_midcast.Buff ~= nil then
            log_debug("Pet buff")
            pet_set = get_set(sets.pet_midcast.Buff, mode)
        elseif pet_ability_type == PetAbilityTypes.mnd and sets.pet_midcast.BuffMND ~= nil then
            log_debug("Pet MND-based buff")
            pet_set = get_set(sets.pet_midcast.BuffMND, mode)
        elseif pet_ability_type == PetAbilityTypes.debuff and sets.pet_midcast.MAcc ~= nil then
            log_debug("Pet debuff")
            pet_set = get_set(sets.pet_midcast.MAcc, mode)
        elseif pet_ability_type == PetAbilityTypes.healing and sets.pet_midcast.Healing ~= nil then
            log_debug("Pet healing")
            pet_set = get_set(sets.pet_midcast.Healing, mode)
        elseif pet_ability_type == PetAbilityTypes.magic and sets.pet_midcast.Magic ~= nil then
            log_debug("Pet magic spell")
            pet_set = get_set(sets.pet_midcast.Magic, mode)
        elseif pet_ability_type == PetAbilityTypes.magicTP then
            if sets.pet_midcast.MagicTP ~= nil then
                log_debug("Pet TP-based magic spell")
                pet_set = get_set(sets.pet_midcast.MagicTP, mode)
            elseif sets.pet_midcast.Magic ~= nil then
                log_debug("Pet TP-based magic spell using generic magic set")
                pet_set = get_set(sets.pet_midcast.Magic, mode)
            end
        elseif pet_ability_type == PetAbilityTypes.physical and sets.pet_midcast.Physical ~= nil then
            log_debug("Pet physical attack")
            pet_set = get_set(sets.pet_midcast.Physical, mode)
        elseif pet_ability_type == PetAbilityTypes.multihit and sets.pet_midcast.MultiHit ~= nil then
            log_debug("Pet multi-hit physical attack")
            pet_set = get_set(sets.pet_midcast.MultiHit, mode)
        elseif pet_ability_type == PetAbilityTypes.physTP then
            if sets.pet_midcast.PhysicalTP ~= nil then
                log_debug("Pet TP-based physical attack")
                pet_set = get_set(sets.pet_midcast.PhysicalTP, mode)
            elseif sets.pet_midcast.Physical ~= nil then
                log_debug("Pet TP-based physical attack using generic physical set")
                pet_set = get_set(sets.pet_midcast.Physical, mode)
            end
        elseif pet_ability_type == PetAbilityTypes.skill and sets.pet_midcast["Summoning Skill"] ~= nil then
            log_debug("Pet summoning-skill-based ability")
            pet_set = get_set(sets.pet_midcast["Summoning Skill"], mode)
        end
    end

    if pet_set == nil and sets.pet_midcast.Generic ~= nil then
        log_debug("Using generic pet set")
        pet_set = get_set(sets.pet_midcast.Generic, mode)
    end

    pet_set = mod_pet_midcast(spell, pet_set)

    equip(pet_set)
end

function pet_aftercast(spell)
    log_debug("Pet aftercast: " .. spell.name)

    pet_aftercast_set = steady_state()
    pet_aftercast_set = mod_pet_aftercast(spell, pet_aftercast_set)
    equip(pet_aftercast_set)
end

function status_change(new, old)
    set = nil

    if new == "Engaged" then
        currentTarget = player.target.index
        if (th_on_tag) then
            set = set_combine(steady_state(), sets.mod.TH)
        else
            set = steady_state()
        end
    elseif new == "Resting" and sets.Resting ~= nil then
        set = get_set(sets.Resting, Idle_Modes[Idle_Mode])
    else
        set = steady_state()
    end

    set = mod_status_change(new, old, set)

    equip(set)
end

function buff_change(name, is_gained)
    log_debug("Buff change")
    set = nil

    if is_gained then
        buffs:add(name)
    else
        if buffs:contains(name) then
            buffs:remove(name)
        end
        -- To be as clean as possible, clear out any buffs that don't currently exist on the player
        for i, buff in pairs(buffs) do
            if buffactive[buff] == nil then
                buffs:remove(buff)
            end
        end
    end

    if not (midaction() or pet_midaction()) then
        set = steady_state()
    else
        log_debug("Mid-action. Not changing sets.")
        set = {}
    end

    set = mod_buff_change(name, is_gained, set)

    equip(set)
end

-- Make sure that the correct idle set gets equipped after gaining or losing a pet
function pet_change(pet, gain)
    if (not (gain and pet_midaction())) then
        idle()
    end
end

function self_command(commandArgs)
    -- Split the command into separate words
    if type(commandArgs) == 'string' then
        commandArgs = T(commandArgs:split(' '))
        if #commandArgs == 0 then
            return
        end
    end

    command = (table.remove(commandArgs, 1)):lower()

    local command_table = {
        meleemode = function(modeArgs)
            if #modeArgs > 0 then
                mode = table.remove(modeArgs, 1)
                for key, name in pairs(Melee_Modes) do
                    if mode == name then
                        Melee_Mode = key
                    end
                end
            else
                Melee_Mode = cycle_table(Melee_Mode, Melee_Modes)
            end
            melee_display.mode = Melee_Modes[Melee_Mode]
        end,
        thmode = function()
            th_on_tag = not th_on_tag and sets.mod.TH ~= nil
            if (th_on_tag) then
                melee_display.th_mod = ' with TH'
            else
                melee_display.th_mod = ''
            end
        end,
        idlemode = function(modeArgs)
            if #modeArgs > 0 then
                mode = table.remove(modeArgs, 1)
                for key, name in pairs(Idle_Modes) do
                    if mode == name then
                        Idle_Mode = key
                    end
                end
            else
                Idle_Mode = cycle_table(Idle_Mode, Idle_Modes)
            end
            idle_display.mode = Idle_Modes[Idle_Mode]
        end,
        magicmode = function(modeArgs)
            if #modeArgs > 0 then
                mode = table.remove(modeArgs, 1)
                for key, name in pairs(Magic_Modes) do
                    if mode == name then
                        Magic_Mode = key
                    end
                end
            else
                Magic_Mode = cycle_table(Magic_Mode, Magic_Modes)
            end
            magic_display.mode = Magic_Modes[Magic_Mode]
        end,
        mb = function()
            MB_Mode = true
            notice('Magic Burst mode is ON')
        end,
        meleeset = function(setArgs)
            local setname = table.concat(setArgs, " ")
            local mode = Melee_Modes[Melee_Mode]
            local set = objectPath(sets, unpack(setname:split('.')))
            if set ~= nil then
                equip(get_set(set, mode))
            else
                error('No set was found by the name of ' .. setname)
            end
        end,
        magicset = function(setArgs)
            local setname = table.concat(setArgs, " ")
            local mode = Magic_Modes[Magic_Mode]
            local set = objectPath(sets, unpack(setname:split('.')))
            if set ~= nil then
                equip(get_set(set, mode))
            else
                error('No set was found by the name of ' .. setname)
            end
        end,
        steadystate = function()
            equip(steady_state(nil, false, false))
        end,
        equipgear = function(equipArgs)
            local override_flag
            if #equipArgs > 0 then
                override_flag = table.remove(equipArgs, 1)
            end
            if override_flag == "override" then
                equip(steady_state(nil, true, true))
            else
                equip(steady_state(nil, nil, true))
            end
            if lockstyleset ~= nil then
                send_command('input /lockstyleset ' .. lockstyleset)
            end
        end,
        clearstances = function()
            current_stances = {}
            update_stance_display()
        end,
        debug = function()
            is_debug = not is_debug
            notice("Debug is set to " .. tostring(is_debug))
        end
    }
    local job_commands = define_commands()
    for k, v in pairs(job_commands) do
        command_table[k] = v
    end

    if command_table[command] ~= nil then
        command_table[command](commandArgs)
    end
end

-- This happens any time the user does anything, including auto-attack!
windower.raw_register_event('action', function(action)
    if action == nil then
        return
    end
    -- action.category 1 is a melee attack
    if action.actor_id == player.id and action.category == 1 then
        local previousTargetMatch = previousTarget == currentTarget
        previousTarget = currentTarget
        if player.target ~= nil then
            currentTarget = player.target.index
        end

        local currentTargetMatch = previousTarget == currentTarget
        -- For some reason, gearswap doesn't equip gear here, so send a command to force it
        if th_on_tag and previousTargetMatch ~= currentTargetMatch then
            log_debug("TH Tag state changed. Recalculating gear set")
            send_command('gs c steadystate')
        end
    end
end)

windower.register_event('target change', function()
    if player.status == 'Engaged' then
        local previousTargetMatch = previousTarget == currentTarget
        previousTarget = currentTarget
        currentTarget = player.target.index
        local currentTargetMatch = previousTarget == currentTarget

        if th_on_tag and previousTargetMatch ~= currentTargetMatch then
            log_debug("TH Tag state changed. Recalculating gear set")
            send_command('gs c steadystate')
        end
    end
end)

local tick = os.time()

-- Make sure that we stay in the right stance once it's set
windower.register_event('prerender', function()
    if os.time() > tick then
        tick = os.time()

        for stance_set in pairs(stances) do
            local ability = current_stances[stance_set]
            if current_stances[stance_set] ~= nil and not buffactive[ability.name] and not midaction() and
                windower.ffxi.get_ability_recasts()[res.job_abilities[ability.id].recast_id] <= 0 then
                send_command('input /ja ' .. ability.name .. ' <me>')

            end
        end
    end
end)

windower.register_event('zone change', function()
    current_stances = {}
    update_stance_display()
end)

---------------------------------------------------------
---- User overrides                                  ----
---------------------------------------------------------
function define_sets()
end

function define_commands()
    return {}
end

function cleanup()
end

function mod_precast(spell, set)
    return set
end

function mod_midcast(spell, set)
    return set
end

function mod_aftercast(spell, set)
    return set
end

function mod_pet_midcast(spell, set)
    return set
end

function mod_pet_aftercast(spell, set)
    return set
end

function mod_status_change(new_status, old_status, set)
    return set
end

function mod_buff_change(buff, is_gained, set)
    return set
end

function mod_tp(set, mode, override_lock, is_user_command)
    return set
end

function mod_idle(set, mode, override_lock, is_user_command)
    return set
end

---------------------------------------------------------
---- Behavior functions                              ----
---------------------------------------------------------
function tp(buff_override, override_lock, is_user_command)
    if should_equip == nil then
        should_equip = true
    end

    tp_set = nil
    mode = Melee_Modes[Melee_Mode]

    if pet.isvalid then
        if Avatars:contains(pet.name) and sets.TP_Avatar ~= nil then
            tp_set = get_set(sets.TP_Avatar, mode, override_lock, is_user_command)
        elseif string.find(pet.name, 'Spirit') and sets.TP_Spirit ~= nil then
            tp_set = get_set(sets.TP_Spirit, mode, override_lock, is_user_command)
        end
    end

    if tp_set == nil then
        tp_set = get_set(sets.TP, mode, override_lock)
    end

    for buff, buffset in pairs(sets.TPMod) do
        if buffactive[buff] ~= nil or buff == buff_override then
            tp_set = set_combine(tp_set, get_set(buffset, mode, override_lock, is_user_command))
        end
    end

    -- Check if we should equip TH gear
    if th_on_tag and currentTarget ~= previousTarget then
        tp_set = set_combine(tp_set, sets.mod.TH)
    end

    tp_set = mod_tp(tp_set, mode, override_lock, is_user_command)

    return tp_set
end

function idle(should_equip, buff_override, override_lock, is_user_command)
    if should_equip == nil then
        should_equip = true
    end
    idle_set = nil
    mode = Idle_Modes[Idle_Mode]

    if pet.isvalid then
        if Avatars:contains(pet.name) and next(sets.Idle_Avatar) ~= nil then
            idle_set = get_set(sets.Idle_Avatar, mode, override_lock, is_user_command)
        elseif string.find(pet.name, 'Spirit') and next(sets.Idle_Spirit) ~= nil then
            idle_set = get_set(sets.Idle_Spirit, mode, override_lock, is_user_command)
        end
    end

    if idle_set == nil then
        idle_set = get_set(sets.Idle, mode, override_lock, is_user_command)
    end

    idle_set = mod_idle(idle_set, mode, override_lock, is_user_command)

    if should_equip then
        equip(idle_set)
    else
        return idle_set
    end
end

function get_set(set_definition, mode_name, override_lock, is_user_command)
    set = copy(set_definition)

    if set_definition[mode_name] ~= nil then
        set = copy(set_definition[mode_name])
    end

    if set.withBuffs ~= nil then
        for buff, buffset in pairs(set.withBuffs) do
            if buffactive[buff] ~= nil or buffs:contains(buff) then
                set = copy(buffset)
            end
        end
    end

    -- If any of the lock_gear is currently equipped, then don't change it
    if not override_lock then
        for slot, _ in pairs(set) do
            if lock_gear:contains(player.equipment[slot]) then
                if is_user_command then
                    notice('Leaving ' .. player.equipment[slot] .. ' equipped. Use Ctrl+F12 to override.')
                end
                set[slot] = player.equipment[slot]
            end
        end
    end

    return set
end

function weather_match(spell)
    return spell.element == world.weather_element or spell.element == world.day_element
end

function steady_state(buff_override, override_lock, is_user_command)
    steady_set = {}
    if player.status == 'Engaged' then
        steady_set = tp(buff_override, override_lock, is_user_command)
    else
        steady_set = idle(false, buff_override, override_lock, is_user_command)
    end

    return steady_set
end

function cycle_table(index, table)
    new_index = index + 1
    if new_index <= #table then
        return new_index
    else
        return 1
    end
end

function update_stance_display()
    if stance_display == nil then
        return
    end

    stances_string = ''
    for stance_set in pairs(stances) do
        if current_stances[stance_set] ~= nil then
            if stances_string == '' then
                stances_string = current_stances[stance_set].name
            else
                stances_string = stances_string .. ', ' .. current_stances[stance_set].name
            end
        end
    end

    stance_display.stances = stances_string
end

function log_debug(message)
    if is_debug then
        notice("Debug: " .. message)
    end
end
