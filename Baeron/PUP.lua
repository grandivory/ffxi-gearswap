include('set-behavior')
include('organizer-lib')
include('augments')
require('queues')
require('strings')

texts = require('texts')
res = require('resources')

lockstyleset = 18

autodeploy = true

function define_sets()
    Melee_Modes = T {'DT', 'Master', 'Dual', 'Bruiser', 'TH'}
    Idle_Modes = T {'Speed', 'Bruiser', 'Turtle', 'PUPDD', 'Ranger', 'BoneSlayer', 'PUPMagic'}

    back = {
        strda = {
            name = "Visucius's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        },
        pet = {
            name = "Visucius's Mantle",
            augments = {'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20', 'Accuracy+20 Attack+20',
                        'Pet: Attack+10 Pet: Rng.Atk.+10', 'Pet: Haste+10', 'System: 1 ID: 1247 Val: 4'}
        }
    }

    th_gear = {
        ammo = "Per. Lucky Egg",
        legs = "Volte Hose",
        feet = herc.feet.thmab
    }

    -- =========================================================================================================
    -- ***Overdrive Definitions***
    -- =========================================================================================================

    ve_overdrive = {
        main = "Gnafron's Adargas",
        range = "Animator P +1",
        ammo = "Automat. Oil +3",
        head = taeon.head.pet,
        body = taeon.body.pet,
        hands = "Mpaca's Gloves",
        legs = taeon.legs.pet,
        feet = "Mpaca's Boots",
        neck = "Shulmanu Collar",
        waist = "Klouskap Sash +1",
        left_ear = "Rimeice Earring",
        right_ear = "Enmerkar Earring",
        left_ring = "Thur. Ring +1",
        right_ring = "C. Palug Ring",
        back = back.pet
    }
    sharpshot_overdrive = {
        main = "Gnafron's Adargas",
        range = "Animator P +1",
        ammo = "Automat. Oil +3",
        head = "Karagoz Capello +1",
        body = "Pitre Tobe +3",
        hands = "Mpaca's Gloves",
        legs = "Heyoka Subligar +1",
        feet = "Mpaca's Boots",
        neck = "Shulmanu Collar",
        waist = "Klouskap Sash +1",
        left_ear = "Rimeice Earring",
        right_ear = "Enmerkar Earring",
        left_ring = "Thurandaut Ring +1",
        right_ring = "Cath Palug Ring",
        back = "Dispersal Mantle"
    }

    -- =========================================================================================================
    -- ***Not Engaged Sets***
    -- =========================================================================================================

    sets.Idle.Speed = {
        range = "Animator P +1",
        ammo = "Automat. Oil +3",
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Hermes' Sandals",
        neck = "Loricate Torque +1",
        waist = "Moonbow Belt +1",
        left_ear = "Tuisto Earring",
        right_ear = "Odnowa Earring +1",
        left_ring = "Defending Ring",
        right_ring = "C. Palug Ring",
        back = back.strda
    }

    sets.Idle.Bruiser = {
        main = "Ohtas",
        range = "Animator P +1",
        ammo = "Automat. Oil +3",
        head = taeon.head.pet,
        body = taeon.body.pet,
        hands = taeon.hands.pet,
        legs = taeon.legs.pet,
        feet = taeon.feet.pet,
        neck = "Shulmanu Collar",
        waist = "Incarnation Sash",
        left_ear = "Rimeice Earring",
        right_ear = "Enmerkar Earring",
        left_ring = "Thurandaut Ring +1",
        right_ring = "C. Palug Ring",
        back = back.pet
    }
    sets.Idle.Bruiser.withBuffs = {}
    sets.Idle.Bruiser.withBuffs.Overdrive = ve_overdrive

    sets.Idle.Turtle = {
        main = "Gnafron's Adargas",
        range = "Animator P +1",
        ammo = "Automat. Oil +3",
        head = "Anwig Salade",
        body = taeon.body.pet,
        hands = taeon.hands.pet,
        legs = taeon.legs.pet,
        feet = taeon.feet.pet,
        neck = "Shepherd's Chain",
        waist = "Isa Belt",
        left_ear = "Rimeice Earring",
        right_ear = "Enmerkar Earring",
        left_ring = "Thurandaut Ring +1",
        right_ring = "Overbearing Ring",
        back = back.pet
    }

    sets.Idle.PUPDD = {
        main = "Ohtas",
        range = "Animator P +1",
        ammo = "Automat. Oil +3",
        head = taeon.head.pet,
        body = "Pitre Tobe +3",
        hands = taeon.hands.pet,
        legs = taeon.legs.pet,
        feet = "Mpaca's Boots",
        neck = "Shulmanu Collar",
        waist = "Incarnation Sash",
        left_ear = "Rimeice Earring",
        right_ear = "Enmerkar Earring",
        left_ring = "Thurandaut Ring +1",
        right_ring = "C. Palug Ring",
        back = back.pet
    }
    sets.Idle.PUPDD.withBuffs = {}
    sets.Idle.PUPDD.withBuffs.Overdrive = sharpshot_overdrive

    sets.Idle.Ranger = {
        main = "Denouements",
        range = "Animator P +1",
        ammo = "Automat. Oil +3",
        head = "Mpaca's Cap",
        body = "Pitre Tobe +3",
        hands = "Mpaca's Gloves",
        legs = "Kara. Pantaloni +1",
        feet = "Mpaca's Boots",
        neck = "Shulmanu Collar",
        waist = "Klouskap Sash +1",
        left_ear = "Burana Earring",
        right_ear = "Enmerkar Earring",
        left_ring = "Thurandaut Ring +1",
        right_ring = "Varar Ring +1",
        back = back.pet
    }

    sets.Idle.BoneSlayer = copy(sets.Idle.PUPDD)
    sets.Idle.BoneSlayer.withBuffs = {}
    sets.Idle.BoneSlayer.withBuffs.Overdrive = ve_overdrive

    sets.Idle.PUPMagic = set_combine(sets.Idle.PUPDD, {
        main = "Denouements",
        range = "Animator P +1",
        ammo = "Automat. Oil +3",
        left_ear = "Burana Earring",
        left_ring = "Tali'ah Ring"
    })

    -- =========================================================================================================
    -- ***Engaged Sets***
    -- =========================================================================================================
    sets.TP.DT = {
        main = "Verethragna",
        range = "Animator P +1",
        ammo = "Automat. Oil +3",
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Mpaca's Boots",
        neck = "Shulmanu Collar",
        waist = "Moonbow Belt +1",
        left_ear = "Telos Earring",
        right_ear = "Schere Earring",
        left_ring = "Defending Ring",
        right_ring = "Niqmaddu Ring",
        back = back.strda
    }

    sets.TP.Master = {
        main = "Verethragna",
        range = "Animator P +1",
        ammo = "Automat. Oil +3",
        head = "Mpaca's Cap",
        body = "Mpaca's Doublet",
        hands = herc.hands.dexta,
        legs = "Mpaca's Hose",
        feet = herc.feet.dexta,
        neck = "Shulmanu Collar",
        waist = "Moonbow Belt +1",
        left_ear = "Telos Earring",
        right_ear = "Schere Earring",
        left_ring = "Epona's Ring",
        right_ring = "Niqmaddu Ring",
        back = back.strda
    }

    sets.TP.Dual = {
        main = "Verethragna",
        range = "Animator P +1",
        head = "Mpaca's Cap",
        body = "Mpaca's Doublet",
        hands = "Mpaca's Gloves",
        legs = "Heyoka Subligar +1",
        feet = "Mpaca's Boots",
        neck = "Shulmanu Collar",
        waist = "Moonbow Belt +1",
        left_ear = "Telos Earring",
        right_ear = "Schere Earring",
        left_ring = "Epona's Ring",
        right_ring = "Niqmaddu Ring",
        back = back.pet
    }

    sets.TP.Bruiser = sets.Idle.Bruiser
    sets.TP.TH = set_combine(sets.TP.DT, th_gear)

    -- =========================================================================================================
    -- ***Weapon Skill Sets***
    -- =========================================================================================================
    sets.WS["Victory Smite"] = {
        head = "Mpaca's Cap",
        body = "Mpaca's Doublet",
        hands = "Ryuo Tekko +1",
        legs = "Mpaca's Hose",
        feet = "Mpaca's Boots",
        neck = "Fotia Gorget",
        waist = "Moonbow Belt +1",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Schere Earring",
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = back.strda
    }

    sets.WS["Stringing Pummel"] = {
        head = "Mpaca's Cap",
        body = "Mpaca's Doublet",
        hands = "Ryuo Tekko +1",
        legs = "Mpaca's Hose",
        feet = "Mpaca's Boots",
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Schere Earring",
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = back.strda
    }

    sets.WS["Shijin Spiral"] = {
        head = "Nyame Helm",
        body = "Tali'ah Manteel +2",
        hands = herc.hands.dexta,
        legs = "Nyame Flanchard",
        feet = herc.feet.dexta,
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Mache Earring +1",
        right_ear = "Schere Earring",
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = back.strda
    }

    sets.WS["Howling Fist"] = {
        head = "Mpaca's Cap",
        body = "Tali'ah Manteel +2",
        hands = "Nyame Gauntlets",
        legs = "Mpaca's Hose",
        feet = "Nyame Sollerets",
        neck = "Caro Necklace",
        waist = "Moonbow Belt +1",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Schere Earring",
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = back.strda
    }

    sets.WS["Raging Fists"] = {
        head = "Mpaca's Cap",
        body = "Mpaca's Doublet",
        hands = "Mpaca's Gloves",
        legs = "Mpaca's Hose",
        feet = "Mpaca's Boots",
        neck = "Fotia Gorget",
        waist = "Moonbow Belt +1",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Schere Earring",
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = back.strda
    }

    sets.WS.Generic = {
        head = "Mpaca's Cap",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets",
        neck = "Caro Necklace",
        waist = "Moonbow Belt +1",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Brutal Earring",
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = back.strda
    }
    sets.WS.MAB = {
        head = "Nyame Helm",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        legs = "Nyame Flanchard",
        feet = herc.feet.thmab,
        neck = "Baetyl Pendant",
        waist = "Eschan Stone",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Friomisi Earring",
        left_ring = "Metamor. Ring +1",
        right_ring = "Shiva Ring +1",
        back = "Aurist's Cape"
    }

    -- =========================================================================================================
    -- ***Pet Weapon Skill Sets***
    -- =========================================================================================================
    meleeWS = {
        head = taeon.head.pet,
        body = taeon.body.pet,
        hands = "Mpaca's Gloves",
        legs = taeon.legs.pet,
        feet = "Mpaca's Boots",
        neck = "Shulmanu Collar",
        waist = "Incarnation Sash",
        left_ear = "Burana Earring",
        right_ear = "Domes. Earring",
        left_ring = "Thur. Ring +1",
        right_ring = "C. Palug Ring",
        back = back.pet
    }

    rangedWS = {
        head = "Karagoz Capello +1",
        body = "Pitre Tobe +3",
        hands = "Mpaca's Gloves",
        legs = "Kara. Pantaloni +1",
        feet = "Mpaca's Boots",
        neck = "Shulmanu Collar",
        waist = "Klouskap Sash +1",
        left_ear = "Burana Earring",
        right_ear = "Enmerkar Earring",
        left_ring = "Thur. Ring +1",
        right_ring = "Overbearing Ring",
        back = "Dispersal Mantle"
    }

    sets.petWS = {}
    sets.petWS.Bruiser = set_combine(sets.Idle.Bruiser, meleeWS)
    sets.petWS.Turtle = sets.Idle.Turtle
    sets.petWS.PUPDD = set_combine(sets.Idle.PUPDD, rangedWS)
    sets.petWS.Ranger = set_combine(sets.Idle.Ranger, rangedWS)
    sets.petWS.BoneSlayer = set_combine(sets.Idle.BoneSlayer, meleeWS)
    sets.petWS.PUPMagic = sets.Idle.PUPMagic

    enmity = {
        legs = "Heyoka Subligar +1",
        left_ear = "Rimeice Earring",
        right_ear = "Domes. Earring"
    }
    sets.petEnmity = {}
    sets.petEnmity.Bruiser = set_combine(sets.Idle.Bruiser, enmity)
    sets.petEnmity.Turtle = set_combine(sets.Idle.Turtle, enmity)

    sets.JA.Overdrive = {
        body = "Pitre Tobe +3"
    }

    sets.JA.Repair = {
        feet = "Foire Bab. +2",
        left_ear = "Guignol Earring",
        back = "Visucius's Mantle"
    }

    sets.JA.Maneuver = {
        body = "Kara. Farsetto +1",
        hands = "Foire Dastanas +2",
        neck = "Buffoon's Collar +1",
        left_ear = "Burana Earring",
        back = "Visucius's Mantle"
    }

    -- =========================================================================================================
    -- ***Precast Sets***
    -- =========================================================================================================
    sets.precast.FastCast = {
        head = "Herculean Helm",
        body = "Zendik Robe",
        legs = "Gyve Trousers",
        neck = "Orunmila's Torque",
        left_ear = "Loquac. Earring",
        right_ear = "Enchntr. Earring +1",
        right_ring = "Rahab Ring",
        back = "Fi Follet Cape +1"
    }

    sets.precast.Enhancing = set_combine(sets.precast.FastCast, {
        waist = "Siegel Sash"
    })

    -- =========================================================================================================
    -- ***Midcast Sets***
    -- =========================================================================================================
    sets.midcast.Cur = {
        body = "Annointed Kalasiris",
        legs = "Gyve Trousers",
        neck = "Incanter's Torque",
        waist = "Luminary Sash",
        left_ear = "Meili Earring",
        right_ear = "Mendi. Earring",
        left_ring = "Haoma's Ring",
        right_ring = "Lebeche Ring"
    }

    sets.midcast.CurSelf = set_combine(sets.midcast.Cur, {
        neck = "Phalaina Locket",
        waist = "Gishdubar Sash",
        left_ring = "Kunaji Ring"
    })

    sets.midcast["Dia II"] = th_gear

    sets.midcast.Enhancing = {
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Loricate Torque +1",
        waist = "Siegel Sash",
        left_ear = "Etiolation Earring",
        right_ear = "Andoaa Earring",
        left_ring = "Defending Ring",
        right_ring = "Kunaji Ring",
        back = "Fi Follet Cape +1"
    }

    sets.midcast.RefreshSelf = set_combine(sets.midcast.Enhancing, {
        waist = "Gishdubar Sash"
    })

    organizer_items = {
        bseals = "Beastmen's Seal",
        kseals = "Kindred's Seal",
        kcrests = "Kindred's Crest",
        hkcrests = "High Kindred's Crest",
        skcrest = "Sacred Kindred's Crest",
        warp_ring = "Warp Ring",
        caliber_ring = "Caliber Ring",
        vocation_ring = "Vocation Ring",
        facility_ring = "Facility Ring",
        aptitude_mantle = "Aptitude Mantle"
    }

    hud = texts.new('', hud_defaults)
    texts.append(hud, hud_text)

    hud:show()

    send_command('bind ^f9 gs c clearmaneuvers')
    send_command('bind ^f10 gs c autodeploy')
end

function cleanup()
    send_command('unbind ^f9')
    send_command('unbind ^f10')
end

function define_commands()
    return {
        autodeploy = function()
            autodeploy = not autodeploy
        end,
        clearmaneuvers = function()
            current_maneuvers:clear()
            maneuver_queue:clear()
        end
    }
end

-- =========================================================================================================
-- *** HUD ***
-- =========================================================================================================
hud_defaults = {
    pos = {
        x = 997,
        y = 1213
    },
    bg = {
        red = 0,
        green = 0,
        blue = 0,
        alpha = 255
    },
    text = {
        size = 12,
        font = 'Courier New',
        red = 255,
        green = 255,
        blue = 255,
        alpha = 255
    }
}

hud_text = [[| Kenbishi:      | Maneuvers:                | Config:            |
|  HP: ${pet_hp|0/0|%9s} |  Current: ${maneuvers||%14s}  |  Autodeploy: ${autodeploy||%5s} |
|  MP: ${pet_mp|0/0|%9s} |  Upcoming: ${upcoming_maneuvers||%14s} |  Pet Mode: ${pet_mode||%5s}   |
|  TP: [${pet_current_tp|0|%4s}]    |                           |                    |
]]

function update_hud()
    if pet.isvalid and player.hpp > 0 then
        -- Pet stats
        current_hp = pet.hp
        max_hp = pet.max_hp
        current_mp = pet.mp
        max_mp = pet.max_mp
        current_tp = pet.tp

        hud.pet_hp = colorize_percent(current_hp, max_hp)
        hud.pet_mp = colorize_percent(current_mp, max_mp)
        hud.pet_current_tp = colorize_tp(current_tp)

        -- Maneuvers
        maneuvers = {}
        index = 1
        for maneuver in current_maneuvers:it() do
            maneuvers[index] = maneuver_shorthand(maneuver)
            index = index + 1
        end
        maneuvers_string = table.concat(maneuvers, ',')
        while index < 4 do
            if index == 1 then
                maneuvers_string = maneuvers_string .. '    '
            else
                maneuvers_string = maneuvers_string .. '     '
            end
            index = index + 1
        end
        hud.maneuvers = maneuvers_string

        upcoming = {}
        index = 1
        for maneuver in maneuver_queue:it() do
            upcoming[index] = maneuver_shorthand(maneuver.name)
            index = index + 1
        end
        upcoming_string = table.concat(upcoming, ',')
        while index < 4 do
            if index == 1 then
                upcoming_string = upcoming_string .. '    '
            else
                upcoming_string = upcoming_string .. '     '
            end
            index = index + 1
        end

        hud.upcoming_maneuvers = upcoming_string

        -- Pet mode
        hud.pet_mode = pet_mode
    else
        hud.pet_hp = '0/0      '
        hud.pet_mp = '0/0      '
        hud.pet_current_tp = '0'
        hud.maneuvers = '              '
        hud.upcoming_maneuvers = '              '
        hud.pet_mode = '     '
    end

    hud.autodeploy = tostring(autodeploy)
end

function colorize_percent(value, max)
    percent = value / max

    if (percent > .75) then
        return '\\cs(128,255,128)' .. string.format('%9s', value .. '/' .. max) .. '\\cr'
    elseif (percent > .5) then
        return '\\cs(255,255,0)' .. string.format('%9s', value .. '/' .. max) .. '\\cr'
    elseif (percent > .25) then
        return '\\cs(128,160,0)' .. string.format('%9s', value .. '/' .. max) .. '\\cr'
    else
        return '\\cs(255,0,0)' .. string.format('%9s', value .. '/' .. max) .. '\\cr'
    end
end

function colorize_tp(value)
    if value > 750 then
        return '\\cs(128,255,128)' .. string.format('%4d', value) .. '\\cr'
    elseif value > 750 then
        return '\\cs(255,255,0)' .. string.format('%4d', value) .. '\\cr'
    elseif value > 750 then
        return '\\cs(128,160,0)' .. string.format('%4d', value) .. '\\cr'
    else
        return '\\cs(255,0,0)' .. string.format('%4d', value) .. '\\cr'
    end
end

function maneuver_shorthand(maneuver)
    if maneuver == 'Fire Maneuver' then
        return '\\cs(255, 128, 128)Fire\\cr'
    elseif maneuver == 'Ice Maneuver' then
        return '\\cs(0, 255, 255)Ice \\cr'
    elseif maneuver == 'Wind Maneuver' then
        return '\\cs(0, 255, 0)Wind\\cr'
    elseif maneuver == 'Earth Maneuver' then
        return '\\cs(128, 128, 0)Erth\\cr'
    elseif maneuver == 'Thunder Maneuver' then
        return '\\cs(192, 64, 192)Thnd\\cr'
    elseif maneuver == 'Water Maneuver' then
        return '\\cs(0, 0, 255)Watr\\cr'
    elseif maneuver == 'Dark Maneuver' then
        return '\\cs(128, 128, 128)Dark\\cr'
    else
        return '\\cs(255, 255, 255)Lght\\cr'
    end
end

-- =========================================================================================================
-- *** Custom Behavior ***
-- =========================================================================================================

previousTarget = nil
currentTarget = nil

function job_status_change(new, old)
    if new == "Engaged" then
        if autodeploy == true and pet.isvalid then
            if windower.ffxi.get_mob_by_target('t').id then
                currentTarget = windower.ffxi.get_mob_by_target('t').id
            end

            send_command('@wait 2; input /pet "Deploy" <t>')
        end
    end
end

maneuver_queue = Q {}
current_maneuvers = Q {}

function mod_precast(spell, set)
    local oil_count = 0
    if spell.name == 'Repair' then
        oil_equipped = player.wardrobe['Automat. Oil +3']
        if oil_equipped ~= nil then
            oil_count = oil_equipped.count
        end

        oil_available = player.inventory['Automat. Oil +3']
        if oil_available ~= nil then
            oil_count = oil_count + oil_available.count
        end

        if oil_count < 6 then
            notice('***** Running low on Oil! ' .. oil_count .. ' left *****')
        end
    end

    return set
end

function mod_aftercast(spell, set)
    if spell.name:endswith('Maneuver') and spell.interrupted == true and maneuver_queue:length() < 3 then
        maneuver_queue:push(spell)
    end

    return set
end

function mod_pet_aftercast(spell, set)
    pet_mode = "TP"

    return set
end

function mod_buff_change(buff, is_gained, set)
    if buff:endswith('Maneuver') then
        -- Keep track of current maneuvers
        if is_gained then
            current_maneuvers:push(buff)
        else
            local maneuver_iterator = current_maneuvers:it()
            local maneuver = maneuver_iterator()

            -- Only pop a maneuver from the current maneuvers list if the one we just lost is the next one in the list
            -- This should help to let the lua catch up when it's loaded while maneuvers are already active
            if maneuver == buff or current_maneuvers:length() > 3 then
                current_maneuvers:pop()

                -- If we lose a maneuver and we have less than 3, then recast it
                if player.hp > 0 and pet.isvalid and current_maneuvers:length() < 3 then
                    send_command('input /ja "' .. buff .. '" <me>')
                end
            end
        end
    end

    if buff == 'Overload' and is_gained then
        current_maneuvers:clear()
        maneuver_queue:clear()
    end

    return set
end

pet_mode = "TP"

function mod_idle(set, mode)
    if pet_mode == "WS" and sets.petWS[mode] ~= nil and buffactive["Overdrive"] == nil then
        return sets.petWS[mode]
    elseif pet_mode == "ENM" and sets.petEnmity[mode] ~= nil and buffactive["Overdrive"] == nil then
        return sets.petEnmity[mode]
    else
        return set
    end
end

tick = os.time()
last_voke = nil
last_flash = nil

windower.register_event("incoming text", function(original, modified, mode)
    if buffactive["Fire Maneuver"] and original:contains(pet.name) and original:contains("Provoke") then
        last_voke = os.time()
        pet_mode = "TP"
        equip(steady_state())
    elseif buffactive["Light Maneuver"] and original:contains(pet.name) and original:contains("Flashbulb") then
        last_flash = os.time()
        pet_mode = "TP"
        equip(steady_state())
    end

    return modified, mode
end)

windower.register_event("prerender", function()
    update_hud()
    if os.time() > tick then
        tick = os.time()

        -- Make sure we still have a pet
        if not pet.isvalid then
            current_maneuvers:clear()
            maneuver_queue:clear()
        end

        -- Try to cast any maneuvers in the queue
        if not midaction() and maneuver_queue:length() > 0 then
            local maneuver_iterator = maneuver_queue:it()
            local maneuver = maneuver_iterator()

            if windower.ffxi.get_ability_recasts()[res.job_abilities[maneuver.id].recast_id] <= 0 and
                buffactive['Amnesia'] == nil then
                send_command('@wait 0.5;input /ja "' .. maneuver.name .. '" <me>')
                -- Remove the maneuver from the queue
                maneuver_queue:pop()
            end
        end

        -- Update the pet mode
        if pet.isvalid then
            if last_voke ~= nil and tick > last_voke + 28 and tick < last_voke + 33 then
                if pet_mode ~= "ENM" then
                    pet_mode = "ENM"
                    equip(steady_state())
                end
            elseif last_flash ~= nil and tick > last_flash + 43 and tick < last_flash + 48 then
                if pet_mode ~= "ENM" then
                    pet_mode = "ENM"
                    equip(steady_state())
                end
            elseif pet.tp ~= nil and pet.tp >= 900 and pet_mode ~= "WS" then
                pet_mode = "WS"
                equip(steady_state())
            elseif pet.tp ~= nil and pet.tp < 900 and pet_mode ~= "TP" then
                pet_mode = "TP"
                equip(steady_state())
            end
        end

        -- Check to see if we've switched targets and need to redeploy
        if autodeploy == true and player.status == "Engaged" then
            previousTarget = currentTarget

            if windower.ffxi.get_mob_by_target('t') then
                currentTarget = windower.ffxi.get_mob_by_target('t').id
            end

            if previousTarget ~= currentTarget then
                send_command('@wait 1; input /pet "Deploy" <t>')
            end
        end
    end
end)

windower.raw_register_event("zone change", function()
    current_maneuvers:clear()
    maneuver_queue:clear()
end)
