include('texts')
include('ability-data')
include('utils')

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
---- Gearswap functions                              ----
---------------------------------------------------------
function get_sets()
    sets.TP = {}
    sets.TPMod = {}
    sets.DT = {}
    sets.TH = {}
    sets.Idle = {}
    sets.Idle_Avatar = {}
    sets.Idle_Spirit = {}
    sets.precast = {}
    sets.midcast = {}
    sets.midcast.BlueMagic = {}
    sets.midcast.mod = {}
    sets.aftercast = {}
    sets.pet_midcast = {}
    sets.WS = {}
    sets.JA = {}

    no_shoot_ammo = S {}
    ammo_threshold = 10
    tool_threshold = 10
    distance_threshold = 7

    Melee_Modes = T {}
    Idle_Modes = T {}
    Magic_Modes = T {}
    Melee_Mode = 1
    Idle_Mode = 1
    Magic_Mode = 1

    define_sets()

    MB_Mode = false

    send_command('bind f9 gs c MeleeMode')
    send_command('bind f10 gs c IdleMode')
    send_command('bind f11 gs c MagicMode')
    send_command('bind f12 gs c EquipGear')

    melee_settings = table.copy(text_settings)
    idle_settings = table.copy(text_settings)
    magic_settings = table.copy(text_settings)

    line_height = text_settings.text.size * 1.5 + text_settings.padding * 2 + 3
    idle_settings.pos.y = idle_settings.pos.y + line_height
    magic_settings.pos.y = magic_settings.pos.y + line_height * 2

    melee_display = texts.new('Melee: ${mode}', melee_settings)
    idle_display = texts.new('Idle: ${mode}', idle_settings)
    magic_display = texts.new('Magic: ${mode}', magic_settings)

    melee_display.mode = Melee_Modes[Melee_Mode]
    idle_display.mode = Idle_Modes[Idle_Mode]
    magic_display.mode = Magic_Modes[Magic_Mode]

    texts.show(melee_display)
    texts.show(idle_display)
    texts.show(magic_display)
end

function file_unload(new_file)
    send_command('unbind f9')
    send_command('unbind f10')
    send_command('unbind f11')
    send_command('unbind f12')
    if melee_display ~= nil then
        texts.destroy(melee_display)
    end
    if idle_display ~= nil then
        texts.destroy(idle_display)
    end
    if magic_display ~= nil then
        texts.destroy(magic_display)
    end
end

function precast(spell)
    if no_action_types:contains(spell.type) then
        return
    end

    -- If a pet is mid-action, then don't swap sets
    if (pet.isvalid and pet_midaction() and not spell.type == 'SummonerPact') then
        return
    end

    precast_set = nil

    -- Determine which mode to use for this ability
    if spell.cast_time == nil then
        mode = Melee_Modes[Melee_Mode]
    else
        mode = Magic_Modes[Magic_Mode]
    end

    -- Spell-specific sets
    if sets.precast[spell.name] ~= nil then
        precast_set = get_set(sets.precast[spell.name], mode)
    elseif sets.JA[spell.name] ~= nil then
        precast_set = get_set(sets.JA[spell.name], mode)
    elseif sets.WS[spell.name] ~= nil then
        precast_set = get_set(sets.WS[spell.name], mode)
    end

    -- Ranged attack
    if spell.action_type == 'Ranged Attack' and sets.precast.RA ~= nil then
        precast_set = get_set(sets.precast.RA, mode)
    end

    -- Phantom roll
    if precast_set == nil then
        if spell.type == "CorsairRoll" then
            if sets.precast["Phantom Roll"] ~= nil then
                precast_set = get_set(sets.precast["Phantom Roll"], mode)
            elseif sets.JA["Phantom Roll"] ~= nil then
                precast_set = get_set(sets.JA["Phantom Roll"], mode)
            end
        end
    end

    -- Quick Draw
    if precast_set == nil then
        if spell.type == "CorsairShot" then
            if sets.precast["Quick Draw"] ~= nil then
                precast_set = get_set(sets.precast["Quick Draw"], mode)
            elseif sets.JA["Quick Draw"] ~= nil then
                precast_set = get_set(sets.JA["Quick Draw"], mode)
            end
        end
    end

    -- Blood Pacts
    if precast_set == nil then
        if (spell.type == "BloodPactWard" or spell.type == "BloodPactRage") and not buffactive["Astral Conduit"] then
            if sets.precast["Blood Pact"] ~= nil then
                precast_set = get_set(sets.precast["Blood Pact"], mode)
            elseif sets.JA["Blood Pact"] ~= nil then
                precast_set = get_set(sets.JA["Blood Pact"], mode)
            end
        end
    end

    -- String-search-based sets
    if precast_set == nil then
        for name, set in pairs(sets.precast) do
            if string.find(spell.name, name) then
                -- Spell-family sets
                precast_set = get_set(set, mode)
            elseif string.find(spell.type, name) then
                -- Spell-type sets
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
                        precast_set = get_set(sets.WS.MAB, mode)
                    elseif sets.WS.Elemental ~= nil then
                        precast_set = get_set(sets.WS.Elemental, mode)
                    end
                end
                if precast_set == nil then
                    if sets.WS.Generic ~= nil then
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
                precast_set = get_set(sets.precast.FastCast, mode)
            end
        end
    end

    -- Only equip weather gear during precast for instant-cast abilities. Any others will equip it during midcast
    if spell.cast_time == nil and ElementalWS:contains(spell.name) and weather_match(spell) and sets.Weather ~= nil then
        precast_set = set_combine(precast_set, get_set(sets.Weather, mode))
    end

    -- If distance_threshold is set and the player is closer than the threshold, equip distance gear
    if distance_threshold ~= nil and spell.target.distance < distance_threshold and (ElementalWS:contains(spell.name)) and
        sets.Distance ~= nil then
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
        tool_to_check = NinjutsuTools[spell.name]
        tool_available = player.inventory[tool_to_check]
        if (tool_available == nil or tool_available.count < tool_threshold) and player.mainjob == 'NIN' then
            tool_to_check = NinjutsuUniversalTools[spell.name]
            tool_available = player.inventory[tool_to_check]
        end
        if tool_available == nil then
            tool_count = 0
        else
            tool_count = tool_available.count
        end

        if tool_count < tool_threshold then
            notice('***** Running low on ' .. tool_to_check .. '! ' .. tool_count .. ' left *****')
        end
    end

    -- If a spell is being cast that will fail with a buff up, cancel the buff
    if spell.target.type == 'SELF' then
        for checkSpell, config in pairs(CancelSpells) do
            if spell.name == checkSpell then
                for cancelBuff, wait in pairs(config) do
                    if buffactive[cancelBuff] ~= nil then
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

    equip(precast_set)
end

function midcast(spell)
    if no_action_types:contains(spell.type) then
        return
    end

    -- If a pet is mid-action, then don't swap sets
    if (pet.isvalid and pet_midaction()) then
        return
    end

    -- For spells without a cast time (like job abilities or weapon skills), gear swaps happen in the precast
    if spell.cast_time == nil and spell.action_type ~= 'Ranged Attack' then
        return
    end

    midcast_set = nil
    mode = Magic_Modes[Magic_Mode]

    if MB_Mode and sets.midcast[spell.name .. 'MB'] then
        -- Spell-specific magic burst
        midcast_set = get_set(sets.midcast[spell.name .. 'MB'], mode)
    elseif spell.target.type == 'SELF' and sets.midcast[spell.name .. 'Self'] then
        -- Self-targeted spells
        midcast_set = get_set(sets.midcast[spell.name .. 'Self'], mode)
    elseif sets.midcast[spell.name] then
        -- Spell-specific sets
        midcast_set = get_set(sets.midcast[spell.name], mode)
    end

    if spell.action_type == 'Ranged Attack' and sets.midcast.RA ~= nil then
        midcast_set = get_set(sets.midcast.RA, Melee_Modes[Melee_Mode])
    end

    ----------------------
    -- Spell name matching
    ----------------------
    if midcast_set == nil then
        for name, set in pairs(sets.midcast) do
            if MB_Mode and ends_with(name, 'MB') and string.find(spell.name, name:sub(1, -3)) then
                -- Partial name magic burst
                midcast_set = get_set(set, mode)
                break
            elseif spell.target.type == 'SELF' and ends_with(name, 'Self') and string.find(spell.name, name:sub(1, -5)) then
                -- Partial name self-targeted
                midcast_set = get_set(set, mode)
                break
            elseif string.find(spell.name, name) then
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
                midcast_set = get_set(sets.midcast.NaSpell, mode)
            elseif spell.target.type == 'SELF' and sets.midcast.CureSelf ~= nil then
                midcast_set = get_set(sets.midcast.CureSelf, mode)
            elseif sets.midcast.Healing ~= nil then
                midcast_set = get_set(sets.midcast.Healing, mode)
            end
        elseif spell.skill == "Enhancing Magic" then
            if EnhancingSpells:contains(spell.name) and spell.target.type == 'SELF' and sets.midcast.EnhancingSelf ~=
                nil then
                midcast_set = get_set(sets.midcast.EnhancingSelf, mode)
            elseif EnhancingSpells:contains(spell.name) and sets.midcast.Enhancing ~= nil then
                midcast_set = get_set(sets.midcast.Enhancing, mode)
            elseif spell.target.type == 'SELF' and sets.midcast.EnhancingDurationSelf ~= nil then
                midcast_set = get_set(sets.midcast.EnhancingDurationSelf, mode)
            elseif sets.midcast.EnhancingDuration ~= nil then
                midcast_set = get_set(sets.midcast.EnhancingDuration, mode)
            elseif spell.target.type == 'SELF' and sets.midcast.EnhancingSelf ~= nil then
                midcast_set = get_set(sets.midcast.EnhancingSelf, mode)
            elseif sets.midcast.Enhancing ~= nil then
                midcast_set = get_set(sets.midcast.Enhancing, mode)
            end
        elseif spell.skill == "Enfeebling Magic" then
            if EnfeeblingMND:contains(spell.name) and sets.midcast.EnfeeblingMND ~= nil then
                midcast_set = get_set(sets.midcast.EnfeeblingMND, mode)
            elseif EnfeeblingINT:contains(spell.name) and sets.midcast.EnfeeblingINT ~= nil then
                midcast_set = get_set(sets.midcast.EnfeeblingINT, mode)
            elseif sets.midcast.Enfeebling ~= nil then
                midcast_set = get_set(sets.midcast.Enfeebling, mode)
            elseif sets.midcast.MAcc ~= nil then
                midcast_set = get_set(sets.midcast.MAcc, mode)
            end
        elseif spell.skill == "Divine Magic" then
            if DivineEnfeebles:contains(spell.name) and sets.midcast.DivineEnfeeble ~= nil then
                midcast_set = get_set(sets.midcast.DivineEnfeeble, mode)
            elseif DivineEnhancing:contains(spell.name) and sets.midcast.DivineEnhancing ~= nil then
                midcast_set = get_set(sets.midcast.DivineEnhancing, mode)
            elseif MB_Mode and sets.midcast.DivineMB ~= nil then
                midcast_set = get_set(sets.midcast.DivineMB, mode)
            elseif sets.midcast.Divine ~= nil then
                midcast_set = get_set(sets.midcast.Divine, mode)
            end
        elseif spell.skill == "Elemental Magic" then
            if MB_Mode and sets.midcast.ElementalMB ~= nil then
                midcast_set = get_set(sets.midcast.ElementalMB, mode)
            elseif sets.midcast.Elemental ~= nil then
                midcast_set = get_set(sets.midcast.Elemental, mode)
            end
        elseif spell.skill == "Dark Magic" then
            if sets.midcast.DarkMagic ~= nil then
                midcast_set = get_set(sets.midcast.DarkMagic, mode)
            end
        elseif spell.type == "BlueMagic" then
            magic_type = BlueMagic[spell.english]
            if magic_type == 'physical' and sets.midcast.BlueMagic.Physical ~= nil then
                midcast_set = get_set(sets.midcast.BlueMagic.Physical, mode)
            elseif magic_type == 'magical' and sets.midcast.BlueMagic.MAB ~= nil then
                midcast_set = get_set(sets.midcast.BlueMagic.MAB, mode)
            elseif magic_type == 'breath' and sets.midcast.BlueMagic.Breath ~= nil then
                midcast_set = get_set(sets.midcast.BlueMagic.Breath, mode)
            elseif magic_type == 'cure' and spell.target.type == 'SELF' and sets.midcast.BlueMagic.CureSelf ~= nil then
                midcast_set = get_set(sets.midcast.BlueMagic.CureSelf, mode)
            elseif magic_type == 'cure' and sets.midcast.BlueMagic.Cure ~= nil then
                midcast_set = get_set(sets.midcast.BlueMagic.Cure, mode)
            elseif magic_type == 'buff' then
                if sets.midcast.BlueMagic.Buff ~= nil then
                    midcast_set = get_set(sets.midcast.BlueMagic.Buff, mode)
                elseif sets.midcast.BlueMagic.Skill ~= nil then
                    midcast_set = get_set(sets.midcast.BlueMagic.Skill, mode)
                end
            elseif magic_type == 'debuff' then
                if sets.midcast.BlueMagic.Debuff ~= nil then
                    midcast_set = get_set(sets.midcast.BlueMagic.Debuff, mode)
                elseif sets.midcast.BlueMagic.Skill ~= nil then
                    midcast_set = get_set(sets.midcast.BlueMagic.Skill, mode)
                end
            elseif sets.midcast.BlueMagic.Skill ~= nil then
                midcast_set = get_set(sets.midcast.BlueMagic.Skill, mode)
            end
        elseif spell.skill == "Geomancy" and sets.midcast.Geomancy ~= nil then
            midcast_set = get_set(sets.midcast.Geomancy, mode)
        elseif spell.skill == "Summoning Magic" and sets.midcast.Summon ~= nil then
            midcast_set = get_set(sets.midcast.Summon, mode)
        end
    end

    if midcast_set == nil then
        for name, set in pairs(sets.midcast) do
            if (not S {'BlueMagic', 'mod'}:contains(name)) and string.find(spell.type, name) then
                -- Spell-type sets
                midcast_set = get_set(set, mode)
            end
        end
    end

    -- Look for a generic midcast set if none has been chosen yet
    if midcast_set == nil and sets.midcast.Generic ~= nil then
        midcast_set = get_set(sets.midcast.Generic, mode)
    end

    -- If there's still no midcast set, just jump to the tp or idle set, as needed
    if midcast_set == nil then
        midcast_set = steady_state()
    end

    if WeatherSpells:contains(spell.name) and weather_match(spell) and sets.Weather ~= nil then
        midcast_set = set_combine(midcast_set, get_set(sets.Weather, mode))
    end

    -- If distance_threshold is set and the player is closer than the threshold, equip distance gear
    if distance_threshold ~= nil and spell.target.distance < distance_threshold and WeatherSpells:contains(spell.name) and
        spell.skill ~= "Healing Magic" and sets.Distance ~= nil then
        midcast_set = set_combine(midcast_set, get_set(sets.Distance, mode))
    end

    -- Go through any buff-specific pieces
    for buff, buffset in pairs(sets.midcast.mod) do
        if buffactive[buff] ~= nil then
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
    if no_action_types:contains(spell.type) then
        return
    end

    -- If a pet is mid-action, then don't swap sets
    if (pet.isvalid and (pet_midaction() or string.find(spell.type, 'BloodPact'))) then
        return
    end

    aftercast_set = steady_state()

    aftercast_set = mod_aftercast(spell, aftercast_set)

    equip(aftercast_set)
end

function pet_midcast(spell)
    pet_set = nil

    if S {BloodPactTypes.healing, BloodPactTypes.magic, BloodPactTypes.magicTP, BloodPactTypes.mnd}:contains(spell.name) then
        mode = Magic_Modes[Magic_Mode]
    else
        mod = Melee_Modes[Melee_Mode]
    end

    -- Spell-specific sets
    if sets.pet_midcast[spell.name] then
        pet_set = get_set(sets.pet_midcast[spell.name], mode)
    end

    ----------------------
    -- Spell name matching
    ----------------------
    if pet_set == nil then
        for name, set in pairs(sets.pet_midcast) do
            if string.find(spell.name, name) then
                pet_set = get_set(set, mode)
            end
        end
    end

    if pet_set == nil then
        pact_type = BloodPacts[spell.name]
        if pact_type == BloodPactTypes.buffDuration and sets.pet_midcast.Buff ~= nil then
            pet_set = get_set(sets.pet_midcast.Buff, mode)
        elseif pact_type == BloodPactTypes.mnd and sets.pet_midcast.BuffMND ~= nil then
            pet_set = get_set(sets.pet_midcast.BuffMND, mode)
        elseif pact_type == BloodPactTypes.debuff and sets.pet_midcast.MAcc ~= nil then
            pet_set = get_set(sets.pet_midcast.Macc, mode)
        elseif pact_type == BloodPactTypes.healing and sets.pet_midcast.Healing ~= nil then
            pet_set = get_set(sets.pet_midcast.Healing, mode)
        elseif pact_type == BloodPactTypes.magic and sets.pet_midcast.Magic ~= nil then
            pet_set = get_set(sets.pet_midcast.Magic, mode)
        elseif pact_type == BloodPactTypes.magicTP then
            if sets.pet_midcast.MagicTP ~= nil then
                pet_set = get_set(sets.pet_midcast.MagicTP, mode)
            elseif sets.pet_midcast.Magic ~= nil then
                pet_set = get_set(sets.pet_midcast.Magic, mode)
            end
        elseif pact_type == BloodPactTypes.phys and sets.pet_midcast.Physical ~= nil then
            pet_set = get_set(sets.pet_midcast.Physical, mode)
        elseif pact_type == BloodPactTypes.physTP then
            if sets.pet_midcast.PhysicalTP ~= nil then
                pet_set = get_set(sets.pet_midcast.PhysicalTP, mode)
            elseif sets.pet_midcast.Physical ~= nil then
                pet_set = get_set(sets.pet_midcast.Physical, mode)
            end
        elseif pact_type == BloodPactTypes.skill and sets.pet_midcast["Summoning Skill"] ~= nil then
            pet_set = get_set(sets.pet_midcast["Summoning Skill"], mode)
        end
    end

    if pet_set == nil and sets.pet_midcast.Generic ~= nil then
        pet_set = get_set(set.pet_midcast.Generic, mode)
    end

    pet_set = mod_pet_midcast(spell, pet_set)

    equip(pet_set)
end

function pet_aftercast(spell)
    idle()
end

function status_change(new, old)
    if new == "Resting" and sets.Resting ~= nil then
        equip(get_set(sets.Resting, Idle_Modes[Idle_Mode]))
    else
        equip(steady_state())
    end
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
            local setname = table.remove(setArgs, 1)
            local mode = Melee_Modes[Melee_Mode]
            local set = objectPath(sets, unpack(setname:split('.')))
            if set ~= nil then
                equip(get_set(set, mode))
            else
                error('No set was found by the name of ' .. setname)
            end
        end,
        magicset = function(setArgs)
            local setname = table.remove(setArgs, 1)
            local mode = Magic_Modes[Magic_Mode]
            local set = objectPath(sets, unpack(setname:split('.')))
            if set ~= nil then
                equip(get_set(set, mode))
            else
                error('No set was found by the name of ' .. setname)
            end
        end,
        equipgear = function()
            equip(steady_state())
            send_command('input /lockstyleset ' .. lockstyleset)
        end
    }

    if command_table[command] ~= nil then
        command_table[command](commandArgs)
    end
end

---------------------------------------------------------
---- User overrides                                  ----
---------------------------------------------------------
function define_sets()
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

---------------------------------------------------------
---- Behavior functions                              ----
---------------------------------------------------------
function tp(should_equip, buff_override)
    if should_equip == nil then
        should_equip = true
    end

    tp_set = nil
    mode = Melee_Modes[Melee_Mode]

    if pet.isvalid then
        if Avatars:contains(pet.name) and sets.TP_Avatar ~= nil then
            tp_set = get_set(sets.TP_Avatar, mode)
        elseif string.find(pet.name, 'Spirit') and sets.TP_Spirit ~= nil then
            tp_set = get_set(sets.TP_Spirit, mode)
        end
    end

    if tp_set == nil then
        tp_set = get_set(sets.TP, mode)
    end

    for buff, buffset in pairs(sets.TPMod) do
        if buffactive[buff] ~= nil or buff == buff_override then
            tp_set = set_combine(tp_set, get_set(buffset, mode))
        end
    end

    if should_equip then
        equip(tp_set)
    else
        return tp_set
    end
end

function idle(should_equip, buff_override)
    if should_equip == nil then
        should_equip = true
    end
    idle_set = nil
    mode = Idle_Modes[Idle_Mode]

    if pet.isvalid then
        if Avatars:contains(pet.name) and next(sets.Idle_Avatar) ~= nil then
            idle_set = get_set(sets.Idle_Avatar, mode)
        elseif string.find(pet.name, 'Spirit') and next(sets.Idle_Spirit) ~= nil then
            idle_set = get_set(sets.Idle_Spirit, mode)
        end
    end

    if idle_set == nil then
        idle_set = get_set(sets.Idle, mode)
    end

    if should_equip then
        equip(idle_set)
    else
        return idle_set
    end
end

function get_set(set_definition, mode_name)
    set = set_definition

    if set_definition[mode_name] ~= nil then
        set = set_definition[mode_name]
    end

    if set.withBuffs ~= nil then
        for buff, buffset in pairs(set.withBuffs) do
            if buffactive[buff] ~= nil then
                return buffset
            end
        end
        return set
    else
        return set
    end
end

function weather_match(spell)
    return spell.element == world.weather_element or spell.element == world.day_element
end

function steady_state(buff_override)
    steady_set = {}
    if player.status == 'Engaged' then
        steady_set = tp(false, buff_override)
    else
        steady_set = idle(false, buff_override)
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
