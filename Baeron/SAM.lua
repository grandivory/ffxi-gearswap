include('set-behavior')
include('augments')

lockstyleset = 12

function define_sets()
    Melee_Modes = T {'DT', 'TH'}
    Idle_Modes = T {'Speed', 'DT'}

    fastcast = .22 -- This defines how much fast cast you have, which is used when canceling spell effects (.8 = 80%)

    back = {
        tp = {
            name = "Smertrios's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Damage taken-5%'}
        },
        ws = {
            name = "Smertrios's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        },
        mab = {
            name = "Smertrios's Mantle",
            augments = {'STR+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Magic Damage +10', 'Weapon skill damage +10%',
                        'Damage taken-5%'}
        }
    }

    af = {
        head = "Wakido Kabuto +2",
        body = "Wakido Domaru +2",
        hands = "Wakido Kote +2",
        legs = "Wakido Haidate +2"
    }

    relic = {
        body = "Sakonji Domaru +1",
        hands = "Sakonji Kote +1"
    }

    jseneck = "Samurai's Nodowa +2"

    th_gear = {
        ammo = "Per. Lucky Egg",
        legs = "Volte Hose",
        waist = "Chaac Belt"
    }

    -- =========================================================================================================
    -- ***Not Engaged Sets***
    -- =========================================================================================================
    sets.Idle = {
        main = "Masamune",
        sub = "Utu Grip",
        ammo = "Crepuscular Pebble",
        head = af.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Loricate Torque +1",
        waist = "Flume Belt +1",
        left_ear = "Odnowa Earring +1",
        right_ear = "Tuisto Earring",
        left_ring = "Defending Ring",
        right_ring = "Chirich Ring +1",
        back = back.tp
    }

    sets.Idle.Speed = {
        main = "Masamune",
        sub = "Utu Grip",
        ammo = "Crepuscular Pebble",
        head = af.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = "Danzo Sune-ate",
        neck = "Loricate Torque +1",
        waist = "Flume Belt +1",
        left_ear = "Odnowa Earring +1",
        right_ear = "Tuisto Earring",
        left_ring = "Defending Ring",
        right_ring = "Chirich Ring +1",
        back = back.tp
    }

    -- =========================================================================================================
    -- ***Engaged Sets***
    -- =========================================================================================================
    sets.TP.DT = {
        main = "Masamune",
        sub = "Utu Grip",
        ammo = "Aurgelmir Orb +1",
        head = mpaca.head,
        body = af.body,
        hands = af.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = jseneck,
        waist = "Ioskeha Belt +1",
        left_ear = "Telos Earring",
        right_ear = "Dedition Earring",
        left_ring = "Defending Ring",
        right_ring = "Niqmaddu Ring",
        back = back.tp
    }

    sets.TP.TH = set_combine(sets.TP.DT, th_gear)

    sets.mod.TH = th_gear

    -- =========================================================================================================
    -- ***Weapon Skill Sets***
    -- =========================================================================================================
    sets.WS.Generic = {
        sub = "Utu Grip",
        ammo = "Knobkierrie",
        head = mpaca.head,
        body = flamma.body,
        hands = nyame.hands,
        legs = af.legs,
        feet = nyame.feet,
        neck = jseneck,
        waist = "Sailfi Belt +1",
        left_ear = "Moonshade Earring",
        right_ear = "Thrud Earring",
        left_ring = "Epaminondas's Ring",
        right_ring = "Niqmaddu Ring",
        back = back.ws
    }
    sets.WS.MAB = {
        sub = "Utu Grip",
        ammo = "Knobkierrie",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = jseneck,
        waist = "Orpheus's Sash",
        left_ear = "Moonshade Earring",
        right_ear = "Friomisi Earring",
        left_ring = "Epaminondas's Ring",
        right_ring = "Shiva Ring +1",
        back = back.mab
    }
    sets.WS["Tachi: Ageha"] = {
        sub = "Utu Grip",
        ammo = "Pemphredo Tathlum",
        head = nyame.head,
        body = mpaca.body,
        hands = mpaca.hands,
        legs = mpaca.legs,
        feet = nyame.feet,
        neck = "Sanctity Necklace",
        waist = "Eschan Stone",
        left_ear = "Digni. Earring",
        right_ear = "Crep. Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Metamorph Ring +1",
        back = back.ws
    }
    impulse_sonic = {
        sub = "Utu Grip",
        ammo = "Knobkierrie",
        head = mpaca.head,
        body = flamma.body,
        hands = nyame.hands,
        legs = af.legs,
        feet = nyame.feet,
        neck = jseneck,
        waist = "Sailfi Belt +1",
        left_ear = "Moonshade Earring",
        right_ear = "Thrud Earring",
        left_ring = "Epaminondas's Ring",
        right_ring = "Niqmaddu Ring",
        back = back.ws
    }
    sets.WS["Impulse Drive"] = impulse_sonic
    sets.WS["Sonic Thrust"] = impulse_sonic
    sets.WS.Stardiver = {
        sub = "Utu Grip",
        ammo = "Knobkierrie",
        head = mpaca.head,
        body = tatenashi.body,
        hands = "Ryuo Tekko +1",
        legs = mpaca.legs,
        feet = nyame.feet,
        neck = jseneck,
        waist = "Fotia Belt",
        left_ear = "Moonshade Earring",
        right_ear = "Thrud Earring",
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = back.ws
    }

    -- =========================================================================================================
    -- ***Job Ability Sets***
    -- =========================================================================================================
    sets.JA['Warding Circle'] = {
        head = af.head
    }
    sets.JA.Meditate = {
        head = af.head,
        hands = relic.hands,
        back = back.tp
    }
    sets.JA['Blade Bash'] = {
        hands = relic.hands
    }

    -- =========================================================================================================
    -- ***Precast Sets for Spells***
    -- =========================================================================================================
    sets.precast.FastCast = { -- 22%
        ammo = "Sapience Orb", -- 2%
        hands = { -- 7%
            name = "Leyline Gloves",
            augments = {'Accuracy+14', 'Mag. Acc.+13', '"Mag.Atk.Bns."+13', '"Fast Cast"+2'}
        },
        neck = "Orunmila's Torque", -- 5%
        left_ear = "Etiolation Earring", -- 1%
        right_ear = "Loquac. Earring", -- 5%
        left_ring = "Rahab Ring" -- 2%
    }

    -- =========================================================================================================
    -- ***Weather Gear***
    -- =========================================================================================================
    sets.Weather = {
        waist = "Hachirin-no-obi",
        back = "Twilight Cape"
    }

end
