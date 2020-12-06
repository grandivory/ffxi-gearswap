include('texts')
include('ability-data')

---------------------------------------------------------
---- Configuration                                   ----
---------------------------------------------------------
lockstyleset = 1
text_settings = {
    pos = {
        x = 2180,
        y = 1242
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
    sets.precast = {}
    sets.midcast = {}
    sets.midcast.BlueMagic = {}
    sets.midcast.mod = {}
    sets.aftercast = {}
    sets.WS = {}
    sets.JA = {}

    no_shoot_ammo = S {}
    ammo_threshold = 10
    tool_threshold = 10

    define_sets()

    TP_Modes = T {}
    if TP_Mode_Order ~= nil then
        for key, mode in pairs(TP_Mode_Order) do
            if sets.TP[mode] ~= nil then
                table.insert(TP_Modes, mode)
            end
        end
    end
    for mode, x in pairs(sets.TP) do
        if not TP_Modes:contains(mode) then
            table.insert(TP_Modes, mode)
        end
    end
    TP_Mode = 1

    Idle_Modes = T {}
    if Idle_Mode_Order ~= nil then
        for key, mode in pairs(Idle_Mode_Order) do
            if sets.Idle[mode] ~= nil then
                table.insert(Idle_Modes, mode)
            end
        end
    end
    for mode, x in pairs(sets.Idle) do
        if not Idle_Modes:contains(mode) then
            table.insert(Idle_Modes, mode)
        end
    end
    Idle_Mode = 1

    send_command('bind f9 gs c TP')
    send_command('bind f10 gs c Idle')
    send_command('bind f12 gs c EquipGear')

    mode_display = texts.new('TP: ${TP_Mode}    Idle: ${Idle_Mode}', text_settings)
    mode_display.TP_Mode = TP_Modes[TP_Mode]
    mode_display.Idle_Mode = Idle_Modes[Idle_Mode]
    texts.show(mode_display)
end

function file_unload(new_file)
    send_command('unbind f9')
    send_command('unbind f10')
    send_command('unbind f12')
    if mode_display ~= nil then
        texts.destroy(mode_display)
    end
end

function precast(spell)
    if no_action_types:contains(spell.type) then
        return
    end

    precast_set = nil

    -- Spell-specific sets
    if sets.precast[spell.name] ~= nil then
        precast_set = get_set(sets.precast[spell.name])
    elseif sets.JA[spell.name] ~= nil then
        precast_set = get_set(sets.JA[spell.name])
    elseif sets.WS[spell.name] ~= nil then
        precast_set = get_set(sets.WS[spell.name])
    end

    -- Ranged attack
    if spell.action_type == 'Ranged Attack' and sets.precast.RA ~= nil then
        precast_set = get_set(sets.precast.RA)
    end

    -- Phantom roll
    if precast_set == nil then
        if spell.type == "CorsairRoll" or spell.english == "Double-Up" then
            if sets.precast["Phantom Roll"] ~= nil then
                precast_set = get_set(sets.precast["Phantom Roll"])
            elseif sets.JA["Phantom Roll"] ~= nil then
                precast_set = get_set(sets.JA["Phantom Roll"])
            end
        end
    end

    -- Quick Draw
    if precast_set == nil then
        if spell.type == "CorsairShot" then
            if sets.precast["Quick Draw"] ~= nil then
                precast_set = get_set(sets.precast["Quick Draw"])
            elseif sets.JA["Quick Draw"] ~= nil then
                precast_set = get_set(sets.JA["Quick Draw"])
            end
        end
    end

    -- String-search-based sets
    if precast_set == nil then
        for name, set in pairs(sets.precast) do
            if string.find(spell.name, name) then
                -- Spell-family sets
                precast_set = get_set(set)
            elseif string.find(spell.type, name) then
                -- Spell-type sets
                precast_set = get_set(set)
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
                        precast_set = get_set(sets.WS.MAB)
                    elseif sets.WS.Elemental ~= nil then
                        precast_set = get_set(sets.WS.Elemental)
                    end
                end
                if precast_set == nil then
                    if sets.WS.Generic ~= nil then
                        precast_set = get_set(sets.WS.Generic)
                    end
                end
            end
        else
            ----------------------
            -- Cast-time abilities
            ----------------------
            -- Generic Fast Cast
            if sets.precast.FastCast ~= nil then
                precast_set = get_set(sets.precast.FastCast)
            end
        end
    end

    -- Only equip weather gear during precast for instant-cast abilities. Any others will equip it during midcast
    if spell.cast_time == nil and (ElementalWS:contains(spell.name) or WeatherSpells:contains(spell.name)) and
        weather_match(spell) and sets.Weather ~= nil then
        precast_set = set_combine(precast_set, get_set(sets.Weather))
    end

    precast_set = mod_precast(spell, precast_set)

    -- Get ammo counts
    -- Ammo count for: Ranged Attack, Ranged Weaponskill, Quick Draw, Ranged JAs
    if spell.action_type == 'Ranged Attack' or
        (spell.type == 'WeaponSkill' and (spell.skill == 'Marksmanship' or spell.skill == 'Archery')) or spell.type ==
        'CorsairShot' or RangedJAs:contains(spell.name) then
        -- find the ammo that we're using
        if precast_set ~= nil then
            ammo_to_check = precast_set.ammo or player.equipment.ammo
        else
            ammo_to_check = player.equipment.ammo
        end
        if ammo_to_check ~= nil and ammo_to_check ~= 'empty' then
            available_ammo = player.inventory[ammo_to_check] or player.wardrobe[ammo_to_check]

            if available_ammo == nil then
                send_command('input /echo No ' .. ammo_to_check .. ' left!')
            elseif available_ammo.count < ammo_threshold then
                send_command('input /echo ***** Running low on ' .. ammo_to_check .. '! ' .. available_ammo.count ..
                                 ' left *****')
            end

            -- Check for no-shoot ammo
            if no_shoot_ammo:contains(player.equipment.ammo) and
                (spell.type ~= 'CorsairShot' or buffactive['Unlimited Shot'] == nil) and
                (available_ammo == nil or precast_set == nil or
                    (precast_set ~= nil and precast_set.ammo == player.equipment.ammo)) then
                send_command('input /echo You\'re trying to shoot ' .. player.equipment.ammo .. '! Canceling')
                cancel_spell()
            end
        end
    end

    -- Get tool counts
    if spell.type == 'Ninjutsu' then
        tool_to_check = NinjutsuTools[spell.name]
        tool_available = player.inventory[tool_to_check]
        if tool_available == nil and player.mainjob == 'NIN' then
            tool_to_check = NinjutsuUniversalTools[spell.name]
            tool_available = player.inventory[tool_to_check]
        end
        if tool_available == nil then
            tool_count = 0
        else
            tool_count = tool_available.count
        end

        if tool_count < tool_threshold then
            send_command('input /echo ***** Running low on ' .. tool_to_check .. '! ' .. tool_count .. ' left *****')
        end
    end

    -- If a spell is being cast that will fail with a buff up, cancel the buff
    for checkSpell, config in pairs(CancelSpells) do
        if spell.name == checkSpell then
            for cancelBuff, wait in pairs(config) do
                if buffactive[cancelBuff] ~= nil then
                    if wait > 0 then
                        send_command('@wait ' .. wait .. ';cancel ' .. cancelBuff)
                    else
                        send_command('cancel ' .. cancelBuff)
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

    -- send_command('input Spell target type: ' .. spell.target.type)

    -- For spells without a cast time (like job abilities or weapon skills), gear swaps happen in the precast
    if spell.cast_time == nil and spell.action_type ~= 'Ranged Attack' then
        return
    end

    midcast_set = nil

    if sets.midcast[spell.name] then
        -- Spell-specific sets
        midcast_set = get_set(sets.midcast[spell.name])
        send_command('input /echo Set spell-specific set')
    end

    if spell.action_type == 'Ranged Attack' and sets.midcast.RA ~= nil then
        midcast_set = sets.midcast.RA
        send_command('input /echo set RA set')
    end

    ----------------------
    -- Spell name matching
    ----------------------
    if midcast_set == nil then
        for name, set in pairs(sets.midcast) do
            if string.find(spell.name, name) then
                midcast_set = get_set(set)
            end
        end
    end

    ------------------
    -- Magic-type sets
    ------------------
    if midcast_set == nil then
        if spell.skill == "Healing Magic" then
            if NaSpells:contains(spell.name) and sets.midcast.NaSpell ~= nil then
                midcast_set = get_set(sets.midcast.NaSpell)
            elseif spell.target.type == 'SELF' and sets.midcast.SelfCure ~= nil then
                midcast_set = get_set(sets.midcast.SelfCure)
            elseif sets.midcast.Healing ~= nil then
                midcast_set = get_set(sets.midcast.Healing)
            end
        elseif spell.skill == "Enhancing Magic" then
            if EnhancingSpells:contains(spell.name) and spell.target.type == 'SELF' and sets.midcast.EnhancingSelf ~=
                nil then
                midcast_set = get_set(sets.midcast.EnhancingSelf)
            elseif EnhancingSpells:contains(spell.name) and sets.midcast.Enhancing ~= nil then
                midcast_set = get_set(sets.midcast.Enhancing)
            elseif spell.target.type == 'SELF' and sets.midcast.EnhancingDurationSelf ~= nil then
                midcast_set = get_set(sets.midcast.EnhancingDurationSelf)
            elseif sets.midcast.EnhancingDuration ~= nil then
                midcast_set = get_set(sets.midcast.EnhancingDuration)
            end
        elseif spell.skill == "Enfeebling Magic" then
            if EnfeeblingMND:contains(spell.name) and sets.midcast.EnfeeblingMND ~= nil then
                midcast_set = get_set(sets.midcast.EnfeeblingMND)
            elseif EnfeeblingINT:contains(spell.name) and sets.midcast.EnfeeblingINT ~= nil then
                midcast_set = get_set(sets.midcast.EnfeeblingINT)
            elseif sets.midcast.Enfeebling ~= nil then
                midcast_set = get_set(sets.midcast.Enfeebling)
            elseif sets.midcast.MAcc ~= nil then
                midcast_set = get_set(sets.midcast.MAcc)
            end
        elseif spell.skill == "Divine Magic" then
            if DivineEnfeebles:contains(spell.name) and sets.midcast.DivineEnfeeble ~= nil then
                midcast_set = get_set(sets.midcast.DivineEnfeeble)
            elseif DivineEnhancing:contains(spell.name) and sets.midcast.DivineEnhancing ~= nil then
                midcast_set = get_set(sets.midcast.DivineEnhancing)
            elseif sets.midcast.Divine ~= nil then
                midcast_set = get_set(sets.midcast.Divine)
            end
        elseif spell.skill == "Elemental Magic" then
            if sets.midcast.Elemental ~= nil then
                midcast_set = get_set(sets.midcast.Elemental)
            end
        elseif spell.skill == "Dark Magic" then
            if sets.midcast.DarkMagic ~= nil then
                midcast_set = get_set(sets.midcast.DarkMagic)
            end
        elseif spell.type == "BlueMagic" then
            magic_type = BlueMagic[spell.english]
            send_command('input /echo Magic Type: ' .. magic_type)
            if magic_type == 'physical' and sets.midcast.BlueMagic.Physical ~= nil then
                midcast_set = get_set(sets.midcast.BlueMagic.Physical)
                send_command('input /echo Equipping Physical Gear')
            elseif magic_type == 'magical' and sets.midcast.BlueMagic.MAB ~= nil then
                midcast_set = get_set(sets.midcast.BlueMagic.MAB)
                send_command('input /echo Equipping Magical Gear')
            elseif magic_type == 'breath' and sets.midcast.BlueMagic.Breath ~= nil then
                midcast_set = get_set(sets.midcast.BlueMagic.Breath)
                send_command('input /echo Equipping Magical Gear')
            elseif magic_type == 'cure' and sets.midcast.BlueMagic.Cure ~= nil then
                midcast_set = get_set(sets.midcast.BlueMagic.Cure)
                send_command('input /echo Equipping Cure Gear')
                if spell.target.type == 'SELF' and sets.midcast.BlueMagic.SelfCure ~= nil then
                    midcast_set = set_combine(midcast_set, sets.midcast.BlueMagic.SelfCure)
                    send_command('input /echo Equipping Self-Cure Gear')
                end
            elseif magic_type == 'buff' then
                if sets.midcast.BlueMagic.Buff ~= nil then
                    midcast_set = get_set(sets.midcast.BlueMagic.Buff)
                    send_command('input /echo Equipping Blue Magic Buff Gear')
                elseif sets.midcast.BlueMagic.Skill ~= nil then
                    midcast_set = get_set(sets.midcast.BlueMagic.Skill)
                    send_command('input /echo Equipping Blue Magic Skill Gear')
                end
            elseif magic_type == 'debuff' then
                if sets.midcast.BlueMagic.Debuff ~= nil then
                    midcast_set = get_set(sets.midcast.BlueMagic.Debuff)
                    send_command('input /echo Equipping Blue Magic Debuff Gear')
                elseif sets.midcast.BlueMagic.Skill ~= nil then
                    midcast_set = get_set(sets.midcast.BlueMagic.Skill)
                    send_command('input /echo Equipping Blue Magic Skill Gear')
                end
            elseif sets.midcast.BlueMagic.Skill ~= nil then
                midcast_set = get_set(sets.midcast.BlueMagic.Skill)
                send_command('input /echo Equipping Blue Magic Skill Gear')
            end
        elseif spell.skill == "Geomancy" and sets.midcast.Geomancy ~= nil then
            midcast_set = get_set(sets.midcast.Geomancy)
        elseif sets.midcast.Generic ~= nil then
            midcast_set = sets.midcast.Generic
        end
    end

    if midcast_set == nil then
        for name, set in pairs(sets.midcast) do
            if string.find(spell.type, name) then
                -- Spell-type sets
                midcast_set = get_set(set)
            end
        end
    end

    -- If there's still no midcast set, just jump to the tp or idle set, as needed
    if midcast_set == nil then
        midcast_set = steady_state()
    end

    if WeatherSpells:contains(spell.name) and weather_match(spell) and sets.Weather ~= nil then
        send_command('input /echo Weather is active! Equipping weather gear')
        midcast_set = set_combine(midcast_set, sets.Weather)
    end

    -- Go through any buff-specific pieces
    for buff, buffset in pairs(sets.midcast.mod) do
        if buffactive[buff] ~= nil then
            midcast_set = set_combine(midcast_set, get_set(buffset))
            send_command('input /echo ' .. buff .. ' is active! Equipping special set')
        end
    end

    midcast_set = mod_midcast(spell, midcast_set)

    equip(midcast_set)
end

function aftercast(spell)
    if no_action_types:contains(spell.type) then
        return
    end

    aftercast_set = steady_state()

    aftercast_set = mod_aftercast(spell, aftercast_set)

    equip(aftercast_set)
end

function status_change(new, old)
    if new == "Resting" and sets.Resting ~= nil then
        equip(sets.Resting)
    else
        equip(steady_state())
    end
end

function self_command(command)
    local command_table = {
        TP = function()
            TP_Mode = cycle_table(TP_Mode, TP_Modes)
            mode_display.TP_Mode = TP_Modes[TP_Mode]
        end,
        Idle = function()
            Idle_Mode = cycle_table(Idle_Mode, Idle_Modes)
            mode_display.Idle_Mode = Idle_Modes[Idle_Mode]
        end,
        EquipGear = function()
            equip(steady_state())
            send_command('input /lockstyleset ' .. lockstyleset)
        end
    }

    if command_table[command] ~= nil then
        command_table[command]()
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

---------------------------------------------------------
---- Behavior functions                              ----
---------------------------------------------------------
function tp(should_equip, buff_override)
    if should_equip == nil then
        should_equip = true
    end

    tp_set = {}

    if sets.TP[TP_Modes[TP_Mode]] ~= nil then
        tp_set = get_set(sets.TP[TP_Modes[TP_Mode]])
    end

    for buff, buffset in pairs(sets.TPMod) do
        if buffactive[buff] ~= nil or buff == buff_override then
            tp_set = set_combine(tp_set, get_set(buffset))
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
    idle_set = {}

    if sets.Idle[Idle_Modes[Idle_Mode]] ~= nil then
        idle_set = get_set(sets.Idle[Idle_Modes[Idle_Mode]])
    end

    if should_equip then
        equip(idle_set)
    else
        return idle_set
    end
end

function get_set(set_definition)
    if set_definition.withBuffs ~= nil then
        for buff, buffset in pairs(set_definition.withBuffs) do
            if buffactive[buff] ~= nil then
                return buffset
            end
        end
        return set_definition
    else
        return set_definition
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
