include('set-behavior')
include('organizer-lib')
include('augments')
require('queues')

texts = require('texts')
res = require('resources')

lockstyleset = 18

autodeploy = true

function define_sets()
    Melee_Modes = T {'PDT', 'DT', 'Dual-Tank', 'TH', 'Bruiser'}
    Idle_Modes = T {'Turtle', 'Bruiser', 'PUPDD', 'Ranger', 'BoneSlayer', 'PUPMagic', 'Speed'}

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
        -- ammo = "Per. Lucky Egg",
        legs = "Volte Hose",
        feet = herc.feet.thmab,
        waist = "Chaac Belt"
    }
    af = {
        head = " +3",
        body = " +3",
        hands = " +3",
        legs = " +3",
        feet = " +3"
    }
    relic = {
        body = "Pitre Tobe +3"
    }
    empy = {
        head = "Kara. Cappello +2",
        body = "Karagoz Farsetto +2",
        hands = "Karagoz Guanti +2",
        legs = "Kara. Pantaloni +2"
    }
    -- =========================================================================================================
    -- ***Overdrive Definitions***
    -- =========================================================================================================

    ve_overdrive = {
        main = "Xiucoatl",
        range = "Animator P +1",
        ammo = "Automat. Oil +3",
        head = taeon.head.pet,
        body = taeon.body.pet,
        hands = taeon.hands.pet,
        legs = taeon.legs.pet,
        feet = taeon.feet.pet,
        neck = "Shulmanu Collar",
        waist = "Klouskap Sash +1",
        left_ear = "Rimeice Earring",
        right_ear = "Enmerkar Earring",
        left_ring = "Thur. Ring +1",
        right_ring = "C. Palug Ring",
        back = back.pet
    }
    sharpshot_overdrive = {
        main = "Xiucoatl",
        range = "Animator P +1",
        ammo = "Automat. Oil +3",
        head = empy.head,
        body = relic.body,
        hands = empy.hands,
        legs = heyoka.legs,
        feet = "Naga Kyahan",
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
        ammo = "Automat. Oil +3",
        head = malignance.head,
        body = malignance.body,
        hands = malignance.hands,
        legs = malignance.legs,
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
        left_ear = "Domes. Earring",
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
        body = rao.body,
        hands = rao.hands,
        legs = rao.legs,
        feet = rao.feet,
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
        body = relic.body,
        hands = taeon.hands.pet,
        legs = taeon.legs.pet,
        feet = mpaca.feet,
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
        main = "Xiucoatl",
        range = "Animator P +1",
        ammo = "Automat. Oil +3",
        head = mpaca.head,
        body = relic.body,
        hands = mpaca.hands,
        legs = empy.legs,
        feet = mpaca.feet,
        neck = "Shulmanu Collar",
        waist = "Klouskap Sash +1",
        left_ear = "Crep. Earring",
        right_ear = "Enmerkar Earring",
        left_ring = "Thurandaut Ring +1",
        right_ring = "Varar Ring +1",
        back = back.pet
    }
    sets.Idle.Ranger.withBuffs = {}
    sets.Idle.Ranger.withBuffs.Overdrive = sharpshot_overdrive

    sets.Idle.BoneSlayer = copy(sets.Idle.PUPDD)
    sets.Idle.BoneSlayer.withBuffs = {}
    sets.Idle.BoneSlayer.withBuffs.Overdrive = ve_overdrive

    sets.Idle.PUPMagic = set_combine(sets.Idle.PUPDD, {
        main = "Denouements",
        range = "Animator P +1",
        ammo = "Automat. Oil +3",
        waist = "Ukko Sash",
        left_ear = "Burana Earring",
        left_ring = taliah.ring
    })

    -- =========================================================================================================
    -- ***Engaged Sets***
    -- =========================================================================================================

    sets.TP.PDT = {
        main = "Godhands",
        range = "Neo Animator",
        ammo = "Automat. Oil +3",
        head = mpaca.head,
        body = mpaca.body,
        hands = mpaca.hands,
        legs = mpaca.legs,
        feet = mpaca.feet,
        neck = "Shulmanu Collar",
        waist = "Moonbow Belt +1",
        left_ear = "Telos Earring",
        right_ear = "Mache Earring +1",
        left_ring = "Gere Ring",
        right_ring = "Niqmaddu Ring",
        back = back.strda
    }

    sets.TP.DT = {
        main = "Godhands",
        range = "Neo Animator",
        ammo = "Automat. Oil +3",
        head = malignance.head,
        body = malignance.body,
        hands = malignance.hands,
        legs = malignance.legs,
        feet = mpaca.feet,
        neck = "Shulmanu Collar",
        waist = "Moonbow Belt +1",
        left_ear = "Telos Earring",
        right_ear = "Odnowa Earring +1",
        left_ring = "Gere Ring",
        right_ring = "Niqmaddu Ring",
        back = back.strda
    }

    sets.TP['Dual-Tank'] = {
        main = "Godhands",
        range = "Animator P +1",
        ammo = "Automat. Oil +3",
        head = mpaca.head,
        body = mpaca.body,
        hands = empy.hands,
        legs = "Heyoka Subligar +1",
        feet = mpaca.feet,
        neck = "Shulmanu Collar",
        waist = "Moonbow Belt +1",
        left_ear = "Rimeice Earring",
        right_ear = "Domes. Earring",
        left_ring = "Defending Ring",
        right_ring = "C. Palug Ring",
        back = back.pet
    }

    sets.TP.TH = set_combine(sets.TP.DT, th_gear)
    sets.TP.Bruiser = sets.Idle.Bruiser

    -- =========================================================================================================
    -- ***Weapon Skill Sets***
    -- =========================================================================================================

    sets.WS["Victory Smite"] = {
        head = mpaca.head,
        body = mpaca.body,
        hands = mpaca.hands,
        legs = mpaca.legs,
        feet = mpaca.feet,
        neck = "Fotia Gorget",
        waist = "Moonbow Belt +1",
        left_ear = "Moonshade Earring",
        right_ear = "Schere Earring",
        left_ring = "Gere Ring",
        right_ring = "Niqmaddu Ring",
        back = back.strda
    }

    sets.WS["Stringing Pummel"] = {
        head = mpaca.head,
        body = mpaca.body,
        hands = mpaca.hands,
        legs = mpaca.legs,
        feet = mpaca.feet,
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Moonshade Earring",
        right_ear = "Schere Earring",
        left_ring = "Gere Ring",
        right_ring = "Niqmaddu Ring",
        back = back.strda
    }

    sets.WS["Shijin Spiral"] = {
        head = nyame.head,
        body = nyame.body,
        hands = herc.hands.dexta,
        legs = nyame.legs,
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
        head = mpaca.head,
        body = mpaca.body,
        hands = mpaca.hands,
        legs = mpaca.legs,
        feet = mpaca.feet,
        neck = "Fotia Gorget",
        waist = "Moonbow Belt +1",
        left_ear = "Moonshade Earring",
        right_ear = "Schere Earring",
        left_ring = "Gere Ring",
        right_ring = "Niqmaddu Ring",
        back = back.strda
    }

    sets.WS["Raging Fists"] = {
        head = mpaca.head,
        body = mpaca.body,
        hands = mpaca.hands,
        legs = mpaca.legs,
        feet = mpaca.feet,
        neck = "Fotia Gorget",
        waist = "Moonbow Belt +1",
        left_ear = "Moonshade Earring",
        right_ear = "Schere Earring",
        left_ring = "Gere Ring",
        right_ring = "Niqmaddu Ring",
        back = back.strda
    }

    sets.WS["Asuran Fists"] = {
        head = empy.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = mpaca.legs,
        feet = nyame.feet,
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Telos Earring",
        right_ear = "Schere Earring",
        left_ring = "Niqmaddu Ring",
        right_ring = "Regal Ring",
        back = back.strda
    }

    sets.WS.Generic = {
        head = mpaca.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Caro Necklace",
        waist = "Moonbow Belt +1",
        left_ear = "Moonshade Earring",
        right_ear = "Schere Earring",
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = back.strda
    }
    sets.WS.MAB = {
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = herc.feet.thmab,
        neck = "Sibyl Scarf",
        waist = "Orpheus's Sash",
        left_ear = "Moonshade Earring",
        right_ear = "Friomisi Earring",
        left_ring = "Metamor. Ring +1",
        right_ring = "Epaminondas's Ring",
        back = "Aurist's Cape +1"
    }

    -- =========================================================================================================
    -- ***Pet Weapon Skill Sets***
    -- =========================================================================================================

    meleeWS = {
        main = "Xiucoatl",
        head = taeon.head.pet,
        body = taeon.body.pet,
        hands = mpaca.hands,
        legs = taeon.legs.pet,
        feet = mpaca.feet,
        neck = "Shulmanu Collar",
        waist = "Incarnation Sash",
        left_ear = "Burana Earring",
        right_ear = "Domes. Earring",
        left_ring = "Thur. Ring +1",
        right_ring = "C. Palug Ring",
        back = back.pet
    }

    rangedWS = {
        main = "Xiucoatl",
        head = empy.head,
        body = relic.body,
        hands = mpaca.hands,
        legs = empy.legs,
        feet = mpaca.feet,
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
        body = relic.body
    }

    sets.JA.Repair = {
        feet = "Foire Babouches +3",
        left_ear = "Guignol Earring",
        back = "Visucius's Mantle"
    }

    sets.JA.Maneuver = {
        body = empy.body,
        hands = "Foire Dastanas +3",
        neck = "Buffoon's Collar +1",
        left_ear = "Burana Earring",
        back = "Visucius's Mantle"
    }

    sets.JA.Provoke = th_gear

    -- =========================================================================================================
    -- ***Item Sets***
    -- =========================================================================================================

    sets.item["Holy Water"] = {
        neck = "Nicander's Necklace",
        left_ring = "Purity Ring",
        right_ring = "Blenmot's Ring +1"
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

    sets.midcast.Dia = th_gear

    sets.midcast.Enhancing = {
        head = malignance.head,
        body = malignance.body,
        hands = malignance.hands,
        legs = malignance.legs,
        feet = malignance.feet,
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

    -- =========================================================================================================
    -- ***Pet Midcast Sets***
    -- =========================================================================================================

    -- sets.pet_midcast.Generic = {
    --     main = "Xiucoatl",
    --     -- head = herc.head.petmab,
    --     body = "Udug Jacket",
    --     -- hands = herc.hands.petmab,
    --     -- legs = relic.legs,
    --     -- feet = relic.feet,
    --     feet = "Foire Babouches +3",
    --     neck = "Adad Amulet",
    --     waist = "Ukko Sash",
    --     left_ear = "Burana Earring",
    --     right_ear = "Enmerkar Earring",
    --     left_ring = "Tali'ah Ring",
    --     right_ring = "C. Palug Ring"
    --     -- back = back.petmab,
    -- }

    sets.Distance = {
        waist = "Orpheus's Sash"
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
            if (maneuver_queue:length() > 0) then
                maneuver_queue:clear()
            elseif (current_maneuvers:length() > 0) then
                current_maneuvers:pop()
            end
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

hud_text = [[| Kenbishi:      | Maneuvers (^f9 to clear): | Config(^f10):      |
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
    if value > 900 then
        return '\\cs(128,255,128)' .. string.format('%4d', value) .. '\\cr'
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

function mod_status_change(new, old, set)
    if new == "Engaged" then
        if autodeploy == true and pet.isvalid then
            if player.target then
                currentTarget = player.target.index
            end

            send_command('@wait 2; input /pet "Deploy" <t>')
        end
    end

    return set
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

function mod_idle(set, mode, override_lock, is_user_command)
    if pet.isvalid then
        if pet_mode == "WS" and sets.petWS[mode] ~= nil and buffactive["Overdrive"] == nil then
            return get_set(sets.petWS, mode, override_lock, is_user_command)
        elseif pet_mode == "ENM" and sets.petEnmity[mode] ~= nil and buffactive["Overdrive"] == nil then
            return get_set(sets.petEnmity, mode, override_lock, is_user_command)
        else
            return set
        end
    else
        -- If we don't have a pet, just use the default DT + Speed set
        return get_set(sets.Idle.Speed, mode, override_lock, is_user_command)
    end
end

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

local tick = os.time()

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

            if player.target then
                currentTarget = player.target.index
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
