include('set-behavior')
include('organizer-lib')
include('augments')
require('queues')
require('strings')

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
        legs = "Volte Hose",
        feet = herc.feet.thmab
    }

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
        right_ring = "Kunaji Ring",
        back = back.strda
    }

    sets.Idle.Bruiser = {
        main = {
            name = "Ohtas",
            augments = {'Accuracy+70', 'Pet: Accuracy+70', 'Pet: Haste+10%'}
        },
        range = "Animator P +1",
        ammo = "Automat. Oil +3",
        head = "Anwig Salade",
        body = taeon.body.pet,
        hands = taeon.hands.pet,
        legs = taeon.legs.pet,
        feet = taeon.feet.pet,
        neck = "Shulmanu Collar",
        waist = "Incarnation Sash",
        left_ear = "Rimeice Earring",
        right_ear = "Domes. Earring",
        left_ring = "Thurandaut Ring +1",
        right_ring = "C. Palug Ring",
        back = back.pet
    }

    sets.Idle.Turtle = sets.Idle.Bruiser

    sets.Idle.PUPDD = {
        main = {
            name = "Ohtas",
            augments = {'Accuracy+70', 'Pet: Accuracy+70', 'Pet: Haste+10%'}
        },
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
        right_ear = "Domes. Earring",
        left_ring = "Thurandaut Ring +1",
        right_ring = "C. Palug Ring",
        back = back.pet
    }

    sets.Idle.Ranger = {
        main = "Denouements",
        range = "Animator P +1",
        ammo = "Automat. Oil +3",
        head = "Mpaca's Cap",
        body = "Mpaca's Doublet",
        hands = taeon.hands.pet,
        legs = "Mpaca's Hose",
        feet = "Mpaca's Boots",
        neck = "Shulmanu Collar",
        waist = "Klouskap Sash +1",
        left_ear = "Burana Earring",
        left_ring = "Varar Ring +1",
        right_ring = "Varar Ring +1",
        back = back.pet
    }

    sets.Idle.BoneSlayer = sets.Idle.PUPDD

    sets.Idle.PUPMagic = set_combine(sets.Idle.PUPDD, {
        main = "Denouements",
        range = "Animator P +1",
        ammo = "Automat. Oil +3",
        left_ear = "Burana Earring",
        left_ring = "Tali'ah Ring"
    })

    ve_overdrive = {
        main = "Ohtas",
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
    sharpshot_overdrive = {}

    sets.Idle.Bruiser.withBuffs = {}
    sets.Idle.Bruiser.withBuffs['Overdrive'] = ve_overdrive

    sets.TP.DT = {
        main = "Verethragna",
        range = "Animator P +1",
        ammo = "Automat. Oil +3",
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = herc.hands.dexta,
        legs = "Malignance Tights",
        feet = "Mpaca's Boots",
        neck = "Shulmanu Collar",
        waist = "Moonbow Belt +1",
        left_ear = "Telos Earring",
        right_ear = "Brutal Earring",
        left_ring = "Defending Ring",
        right_ring = "Niqmaddu Ring",
        back = back.strda
    }

    sets.TP.Master = {
        main = "Verethragna",
        range = "Animator P +1",
        ammo = "Automat. Oil +3",
        head = "Mpaca's Cap",
        body = "Tali'ah Manteel +2",
        hands = herc.hands.dexta,
        legs = "Mpaca's Hose",
        feet = "Mpaca's Boots",
        neck = "Shulmanu Collar",
        waist = "Moonbow Belt +1",
        left_ear = "Telos Earring",
        right_ear = "Brutal Earring",
        left_ring = "Epona's Ring",
        right_ring = "Niqmaddu Ring",
        back = back.strda
    }

    sets.TP.Dual = {
        main = "Verethragna",
        range = "Animator P +1",
        head = "Mpaca's Cap",
        body = "Mpaca's Doublet",
        hands = herc.hands.dexta,
        legs = "Mpaca's Hose",
        feet = "Mpaca's Boots",
        neck = "Shulmanu Collar",
        waist = "Moonbow Belt +1",
        left_ear = "Telos Earring",
        right_ear = "Cessance Earring",
        left_ring = "Epona's Ring",
        right_ring = "Niqmaddu Ring",
        back = back.pet
    }

    sets.TP.Bruiser = sets.Idle.Bruiser
    sets.TP.TH = set_combine(sets.TP.DT, th_gear)

    sets.WS["Victory Smite"] = {
        head = "Mpaca's Cap",
        body = "Mpaca's Doublet",
        hands = "Ryuo Tekko +1",
        legs = "Mpaca's Hose",
        feet = herc.feet.strcrit,
        neck = "Fotia Gorget",
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

    sets.WS["Stringing Pummel"] = {
        head = "Mpaca's Cap",
        body = "Mpaca's Doublet",
        hands = "Ryuo Tekko +1",
        legs = "Mpaca's Hose",
        feet = herc.feet.strcrit,
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Brutal Earring",
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = back.strda
    }

    sets.WS["Shijin Spiral"] = {
        head = herc.head.dexta,
        body = "Mpaca's Doublet",
        hands = herc.hands.dexta,
        legs = "Samnuha Tights",
        feet = herc.feet.dexta,
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Mache Earring +1",
        right_ear = "Brutal Earring",
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = back.strda
    }

    sets.WS["Howling Fist"] = {
        head = "Mpaca's Cap",
        body = "Mpaca's Doublet",
        hands = herc.hands.strta,
        legs = "Mpaca's Hose",
        feet = herc.feet.strta,
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

    sets.WS["Raging Fists"] = {
        head = "Mpaca's Cap",
        body = "Mpaca's Doublet",
        hands = herc.hands.strta,
        legs = "Mpaca's Hose",
        feet = herc.feet.strta,
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

    sets.WS.Generic = {
        head = "Mpaca's Cap",
        body = "Mpaca's Doublet",
        hands = herc.hands.strta,
        legs = "Mpaca's Hose",
        feet = herc.feet.strta,
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
        head = herc.head.strws,
        body = "Gyve Doublet",
        hands = herc.hands.agiws,
        legs = "Gyve Trousers",
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

    meleeWS = {
        head = taeon.head.pet,
        body = "Mpaca's Doublet",
        hands = taeon.hands.pet,
        legs = taeon.legs.pet,
        feet = taeon.feet.pet,
        neck = "Shulmanu Collar",
        waist = "Incarnation Sash",
        left_ear = "Domes. Earring",
        right_ear = "Burana Earring",
        left_ring = "Thur. Ring +1",
        right_ring = "C. Palug Ring",
        back = back.pet
    }

    rangedWS = {
        head = "Karagoz Capello +1",
        body = "Mpaca's Doublet",
        hands = "Karagoz Guanti +1",
        legs = "Kara. Pantaloni +1",
        feet = "Naga Kyahan",
        neck = "Shulmanu Collar",
        waist = "Klouskap Sash +1",
        left_ear = "Domes. Earring",
        right_ear = "Burana Earring",
        left_ring = "Thur. Ring +1",
        right_ring = "C. Palug Ring",
        back = "Dispersal Mantle"
    }

    sets.petWS = {}
    sets.petWS.Bruiser = set_combine(sets.Idle.Bruiser, meleeWS)
    sets.petWS.Turtle = sets.Idle.Turtle
    sets.petWS.PUPDD = set_combine(sets.Idle.PUPDD, rangedWS)
    sets.petWS.Ranger = set_combine(sets.Idle.Ranger, rangedWS)
    sets.petWS.BoneSlayer = set_combine(sets.Idle.BoneSlayer, meleeWS)
    sets.petWS.PUPMagic = sets.Idle.PUPMagic

    sets.JA.Repair = {
        feet = "Pup. Babouches",
        left_ear = "Guignol Earring",
        back = "Visucius's Mantle"
    }

    sets.JA.Maneuver = {
        body = "Kara. Farsetto +1",
        hands = "Foire Dastanas +1",
        neck = "Buffoon's Collar +1",
        left_ear = "Burana Earring",
        back = "Visucius's Mantle"
    }

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

    sets.midcast.Cur = {
        body = "Heka's Kalasiris",
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
end

previousTarget = nil
currentTarget = nil

function job_status_change(new, old)
    if new == "Engaged" then
        if autodeploy == true and pet.isvalid then
            if windower.ffxi.get_mob_by_target('t').id then
                currentTarget = windower.ffxi.get_mob_by_target('t').id
            end

            send_command('@wait 1; input /pet "Deploy" <t>')
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
        notice('Upcoming Maneuvers: ' .. maneuver_queue:length())
    end

    return set
end

function mod_buff_change(buff, is_gained, set)
    if buff:endswith('Maneuver') then
        -- Keep track of current maneuvers
        if is_gained then
            current_maneuvers:push(buff)
        else
            -- local maneuver_iterator = current_maneuvers:it()
            -- local maneuver = maneuver_iterator()

            -- -- Only pop a maneuver from the current maneuvers list if the one we just lost is the next one in the list
            -- -- This should help to let the lua catch up when it's loaded while maneuvers are already active
            -- if maneuver == buff then
            current_maneuvers:pop()

            -- If we lose a maneuver and we have less than 3, then recast it
            if player.hp > 0 and pet.isvalid then
                send_command('input /ja "' .. buff .. '" <me>')
            end
            -- end
        end
    end

    return set
end

pet_mode = "TP"

function mod_idle(set, mode)
    if pet_mode == "WS" and sets.petWS[mode] ~= nil and buffactive["Overdrive"] == nil then
        return sets.petWS[mode]
    else
        return set
    end
end

tick = os.time()

windower.register_event("prerender", function()
    if os.time() > tick then
        tick = os.time()

        -- Try to cast any maneuvers in the queue
        if not midaction() and maneuver_queue:length() > 0 then
            local maneuver_iterator = maneuver_queue:it()
            local maneuver = maneuver_iterator()

            if windower.ffxi.get_ability_recasts()[res.job_abilities[maneuver.id].recast_id] <= 0 and
                buffactive['Amnesia'] == nil then
                send_command('@wait 0.5;input /ja "' .. maneuver.name .. '" <me>')
                -- Remove the maneuver from the queue
                maneuver_queue:pop()
                notice('Upcoming Maneuvers: ' .. maneuver_queue:length())
            end
        end

        -- Update the pet mode
        if pet.isvalid and pet.tp ~= nil then
            if pet.tp >= 900 and pet_mode == "TP" then
                pet_mode = "WS"
                equip(steady_state())
            elseif pet.tp < 900 and pet_mode == "WS" then
                pet_mode = "TP"
                equip(steady_state())
            end
        end

        -- Check to see if we've switched targets and need to redeploy
        if autodeploy == true and player.status == "Engaged" then
            previousTarget = currentTarget

            if windower.ffxi.get_mob_by_target('t').id then
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
