include('set-behavior')
include('augments')

-- Set this to to /equipset you want to use for your lockstyle
lockstyleset = 4

function define_sets()
    Melee_Modes = T {'Parry', 'Magic Tank', 'DD', 'DD Tank'}
    Idle_Modes = T {'Speed', 'Physical Tank', 'Magic Tank', 'Refresh'}

    fastcast = .8

    -- =========================================================================================================
    -- ***Stances***
    -- =========================================================================================================
    stances.SAM = S {'Hasso', 'Seigan'}

    back = {
        tank = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'Evasion+10', 'Enmity+10', 'Parrying rate+5%'}
        },
        dd = {
            name = "Ogma's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Phys. dmg. taken-10%'}
        },
        dimidiation = {
            name = "Ogma's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'DEX+10', 'Weapon skill damage +10%', 'Phys. dmg. taken-10%'}
        }
    }

    af = {
        head = "Rune. Bandeau +3",
        body = "Runeist's Coat +3",
        hands = "Runeist's Mitons +3",
        legs = "Rune. Trousers +2",
        feet = "Runeist Bottes +1"
    }

    relic = {
        head = "Fu. Bandeau +3",
        body = "Futhark Coat +3",
        hands = "Futhark Mitons +1",
        legs = "Futhark Trousers +3",
        feet = "Futhark Boots +1"
    }

    empyrean = {
        head = "Erilaz Galea +1",
        body = "Erilaz Surcoat +1",
        hands = "Erilaz Gauntlets +1",
        legs = "Eri. Leg Guards +1",
        feet = "Erilaz Greaves +1"
    }

    enmity = { -- +87, PDT -48%, MDT -24%
        main = "Epeolatry", -- +23
        ammo = "Staunch Tathlum +1", -- DT -3%
        head = "Halitus Helm", -- +8
        body = "Emet Harness +1", -- +10, PDT -6%
        hands = "Kurys Gloves", -- +9
        legs = empyrean.legs, -- +11, PDT -7%
        feet = empyrean.feet, -- +6, PDT -5%
        neck = "Futhark Torque +2", -- +10, DT -7%
        waist = "Kasiri Belt", -- +3,
        left_ear = "Cryptic Earring", -- +4
        right_ear = "Trux Earring", -- +5
        left_ring = "Gelatinous Ring +1", -- PDT -7%, MDT +1%
        right_ring = "Defending Ring", -- DT -10%
        back = back.tank -- +10
    }

    th_gear = {
        ammo = "Per. Lucky Egg",
        feet = herc.feet.thmab,
        waist = "Chaac Belt"
    }

    -- =========================================================================================================
    -- ***Not Engaged Sets***
    -- =========================================================================================================
    sets.Idle.Speed = {
        main = "Epeolatry",
        sub = "Refined Grip +1",
        ammo = "Staunch Tathlum +1",
        head = nyame.head,
        body = af.body,
        hands = nyame.hands,
        legs = carmine.legs,
        feet = nyame.feet,
        neck = "Futhark Torque +2",
        waist = "Flume Belt +1",
        left_ear = "Cryptic Earring",
        right_ear = "Odnowa Earring +1",
        left_ring = "Moonlight Ring",
        right_ring = "Gelatinous Ring +1",
        back = back.tank
    }

    sets.Idle['Physical Tank'] = {
        main = "Epeolatry",
        sub = "Refined Grip +1",
        ammo = "Staunch Tathlum +1",
        head = nyame.head,
        body = af.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Futhark Torque +2",
        waist = "Flume Belt +1",
        left_ear = "Tuisto Earring",
        right_ear = "Odnowa Earring +1",
        left_ring = "Moonlight Ring",
        right_ring = "Gelatinous Ring +1",
        back = back.tank
    }

    sets.Idle['Magic Tank'] = {
        main = "Aettir",
        sub = "Irenic Strap +1",
        ammo = "Staunch Tathlum +1",
        head = nyame.head,
        body = af.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Futhark Torque +2",
        waist = "Engraved Belt",
        left_ear = "Eabani Earring",
        right_ear = "Odnowa Earring +1",
        left_ring = "Shadow Ring",
        right_ring = "Vexer Ring +1",
        back = back.tank
    }

    sets.Idle.Refresh = {
        main = "Epeolatry",
        sub = "Oneiros Grip",
        ammo = "Staunch Tathlum +1",
        head = herc.head.refresh,
        body = af.body,
        hands = herc.hands.refresh,
        legs = herc.legs.refresh,
        feet = herc.feet.refresh,
        neck = "Bathy Choker +1",
        waist = "Flume Belt +1",
        left_ear = "Tuisto Earring",
        right_ear = "Etiolation Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = back.tank
    }

    -- =========================================================================================================
    -- ***Engaged Sets***
    -- =========================================================================================================
    sets.TP.Parry = {
        main = "Epeolatry",
        sub = "Refined Grip +1",
        ammo = "Staunch Tathlum +1",
        head = nyame.head,
        body = af.body,
        hands = turms.hands,
        legs = nyame.legs,
        feet = turms.feet,
        neck = "Futhark Torque +2",
        waist = "Engraved Belt",
        left_ear = "Cryptic Earring",
        right_ear = "Eabani Earring",
        left_ring = "Moonlight Ring",
        right_ring = "Gelatinous Ring +1",
        back = back.tank
    }

    sets.TP['Magic Tank'] = sets.Idle['Magic Tank']

    sets.TP.DD = {
        main = "Epeolatry",
        sub = "Utu Grip",
        ammo = "Yamarang",
        head = ayanmo.head,
        body = ayanmo.body,
        hands = adhemar.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Futhark Torque +2",
        waist = "Ioskeha Belt +1",
        left_ear = "Mache Earring +1",
        right_ear = "Telos Earring",
        left_ring = "Defending Ring",
        right_ring = "Niqmaddu Ring",
        back = back.dd
    }

    sets.TP['DD Tank'] = {
        main = "Epeolatry",
        sub = "Utu Grip",
        ammo = "Yamarang",
        head = ayanmo.head,
        body = ayanmo.body,
        hands = adhemar.hands,
        legs = meghanada.legs,
        feet = nyame.feet,
        neck = "Futhark Torque +2",
        waist = "Ioskeha Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Telos Earring",
        left_ring = "Defending Ring",
        right_ring = "Moonlight Ring",
        back = back.dd
    }

    -- =========================================================================================================
    -- ***Weapon Skill Sets***
    -- =========================================================================================================
    sets.WS.Generic = {
        ammo = "Knobkierrie",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Moonshade Earring",
        right_ear = "Ishvara Earring",
        left_ring = "Epaminondas's Ring",
        right_ring = "Niqmaddu Ring",
        back = back.dimidiation
    }
    sets.WS.MAB = {
        ammo = "Ghastly Tathlum +1",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Baetyl Pendant",
        waist = "Orpheus's Sash",
        left_ear = "Moonshade Earring",
        right_ear = "Friomisi Earring",
        left_ring = "Metamorph Ring +1",
        right_ring = "Shiva Ring +1",
        back = back.dimidiation
    }
    sets.WS.Dimidiation = {
        ammo = "Knobkierrie",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = lustratio.legs,
        feet = lustratio.feet,
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Sherida Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Epaminondas's Ring",
        right_ring = "Niqmaddu Ring",
        back = back.dimidiation
    }
    sets.WS.Shockwave = set_combine(sets.WS.Generic, th_gear)
    sets.WS['Fell Cleave'] = {
        ammo = "Knobkierrie",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Sherida Earring",
        right_ear = "Ishvara Earring",
        left_ring = "Epaminondas's Ring",
        right_ring = "Niqmaddu Ring",
        back = back.dimidiation
    }

    -- =========================================================================================================
    -- ***Job Ability Sets***
    -- =========================================================================================================
    sets.JA['Vivacious Pulse'] = {
        head = empyrean.head,
        legs = af.legs,
        neck = "Incanter's Torque",
        waist = "Bishop's Sash",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = "Altruistic Cape"
    }

    magic_damage = {
        ammo = "Seething Bomblet +1",
        head = agwu.head,
        body = agwu.body,
        hands = agwu.hands,
        legs = agwu.legs,
        feet = agwu.feet,
        neck = "Baetyl Pendant",
        waist = "Orpheus's Sash",
        left_ear = "Hermetic Earring",
        right_ear = "Friomisi Earring",
        left_ring = "Mujin Band",
        right_ring = "Shiva Ring +1"
    }
    sets.JA.Swipe = magic_damage
    sets.JA.Lunge = magic_damage

    sets.JA.Vallation = set_combine(enmity, {
        body = af.body
    })
    sets.JA.Valiance = sets.JA.Vallation
    sets.JA.Gambit = set_combine(enmity, {
        hands = af.hands
    })
    sets.JA.Rayke = set_combine(enmity, {
        feet = relic.feet
    })
    sets.JA.Liement = enmity
    sets.JA.Battuta = set_combine(enmity, {
        head = relic.head
    })
    sets.JA['One for All'] = enmity
    sets.JA['Elemental Sforzo'] = set_combine(enmity, {
        body = relic.body
    })
    sets.JA.Swordplay = {
        hands = relic.hands
    }
    sets.JA.Embolden = {
        back = "Evasionist's Cape"
    }

    -- =========================================================================================================
    -- ***Precast Sets for Spells***
    -- =========================================================================================================
    sets.precast.FastCast = { -- 61%
        ammo = "Sapience Orb", -- 2%
        head = carmine.head, -- 14%
        body = taeon.body.fcphalanx, -- 9%
        hands = "Leyline Gloves", -- 7%
        legs = ayanmo.legs, -- 6%
        feet = carmine.feet, -- 8%
        neck = "Orunmila's Torque", -- 5%
        waist = "Kasiri Belt",
        left_ear = "Etiolation Earring", -- 1%
        right_ear = "Loquacious Earring", -- 5%
        left_ring = "Kishar Ring", -- 4%
        right_ring = "Gelatinous Ring +1",
        back = back.tank
    }
    sets.precast.Enhancing = set_combine(sets.precast.FastCast, {
        legs = relic.legs
    })
    -- sets.precast.FastCast.withBuffs = {}
    -- sets.precast.FastCast.withBuffs.Vallation = {
    --     ammo = "Staunch Tathlum +1",
    --     head = nyame.head,
    --     body = taeon.body.fcphalanx,
    --     hands = "Leyline Gloves",
    --     legs = ayanmo.legs,
    --     feet = carmine.feet,
    --     neck = "Orunmila's Torque",
    --     waist = "Kasiri Belt",
    --     left_ear = "Etiolation Earring",
    --     right_ear = "Loquacious Earring",
    --     left_ring = "Kishar Ring",
    --     right_ring = "Gelatinous Ring +1",
    --     back = back.tank

    -- }
    -- sets.precast.FastCast.withBuffs.Valliance = sets.precast.FastCast.withBuffs.Vallation

    -- =========================================================================================================
    -- ***Midcast Sets for Spells***
    -- =========================================================================================================
    sird = { -- 85%
        main = "Epeolatry",
        ammo = "Staunch Tathlum +1", -- Switch for Staunch Tathlum +1, 11%
        head = agwu.head, -- 10%
        body = af.body,
        hands = "Rawhide Gloves", -- 15%
        legs = carmine.legs, -- 20%
        feet = taeon.feet.sird, -- 10%
        neck = "Moonlight Necklace", -- 15%
        waist = "Audumbla Sash", -- 10%
        left_ear = "Cryptic Earring",
        right_ear = "Halasz Earring", -- 5%
        left_ring = "Defending Ring",
        right_ring = "Gelatinous Ring +1",
        back = back.tank
    }

    sird_enmity = { -- 80%, Enmity +69
        main = "Epeolatry",
        ammo = "Staunch Tathlum +1", -- Switch for Staunch Tathlum +1, 11%
        head = agwu.head, -- 10%, Enmity +15
        body = "Emet Harness +1", -- Enmity +10
        hands = "Rawhide Gloves", -- 15%
        legs = carmine.legs, -- 20%
        feet = taeon.feet.sird, -- 10%
        neck = "Moonlight Necklace", -- 15%, Enmity +15
        waist = "Audumbla Sash", -- 10%
        left_ear = "Cryptic Earring", -- Enmity +4
        right_ear = "Trux Earring", -- Enmity +5
        left_ring = "Supershear Ring", -- Enmity +5
        right_ring = "Eihwaz Ring", -- Enmity +5,
        back = back.tank -- Enmity +10
    }

    sird_dt = { -- 80%, PDT -46%, MDT -31%
        main = "Epeolatry",
        sub = "Mensch Strap +1", -- PDT -5%
        ammo = "Staunch Tathlum +1", -- Switch for Staunch Tathlum +1, 11%, DT -3%
        head = agwu.head,
        body = af.body, -- DT -9%
        hands = "Rawhide Gloves", -- 15%
        legs = carmine.legs, -- 20%
        feet = taeon.feet.sird, -- 10%
        neck = "Moonlight Necklace", -- 15%
        waist = "Audumbla Sash", -- 10%, PDT -4%
        left_ear = "Cryptic Earring",
        right_ear = "Odnowa Earring +1", -- PDT -3%, MDT -5%
        left_ring = "Defending Ring", -- DT -10%
        right_ring = "Gelatinous Ring +1", -- PDT -7%, MDT +1%
        back = back.dimidiation -- DT -5%
    }

    sets.midcast.Enhancing = {
        head = carmine.head,
        body = "Manasa Chasuble",
        hands = af.hands,
        legs = carmine.legs,
        neck = "Incanter's Torque",
        waist = "Olympus Sash",
        left_ear = "Mimir Earring",
        right_ear = "Andoaa Earring"
    }
    sets.midcast.EnhancingDuration = set_combine(sets.midcast.Enhancing, {
        head = empyrean.head,
        legs = relic.legs
    })
    sets.midcast.Phalanx = {
        ammo = "Staunch Tathlum +1",
        head = relic.head, -- +7
        body = herc.body.phalanx, -- +4
        hands = taeon.hands.fcphalanx, -- +3
        legs = taeon.legs.fcphalanx, -- +3
        feet = taeon.feet.fcphalanx, -- +#
        neck = "Incanter's Torque",
        waist = "Olympus Sash",
        left_ear = "Mimir Earring",
        right_ear = "Odnowa Earring +1",
        left_ring = "Gelatinous Ring +1",
        right_ring = "Stikini Ring +1",
        back = "Moonlight Cape"
    }
    sets.midcast.Bar = {
        ammo = "Staunch Tathlum +1",
        head = empyrean.head,
        body = af.body,
        legs = relic.legs,
        feet = carmine.feet,
        neck = "Incanter's Torque",
        waist = "Olympus Sash",
        left_ear = "Mimir Earring",
        right_ear = "Odnowa Earring +1",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = "Moonlight Cape"
    }

    -- Enmity Spells
    sets.midcast.Flash = sird_enmity
    sets.midcast.Foil = sird_enmity
    sets.midcast['Sheep Song'] = sird_enmity
    sets.midcast['Geist Wall'] = sird_enmity
    sets.midcast.Jettatura = sird_enmity
    sets.midcast['Blank Gaze'] = sird_enmity
    sets.midcast.Soporific = sird_enmity
    sets.midcast.Sandspin = sird_enmity

    -- SIRD Spells
    sets.midcast['Healing Breeze'] = sird_dt
    sets.midcast['Wild Carrot'] = sird_dt
    sets.midcast.Pollen = sird_dt
    sets.midcast.Cocoon = sird_dt

    -- Spell-specific gear
    sets.midcast.Regen = set_combine(sets.midcast.EnhancingDuration, {
        head = af.head,
        neck = "Sacro Gorget"
    })
    sets.midcast.Refresh = set_combine(sets.midcast.EnhancingDuration, {
        head = empyrean.head
    })

    sets.midcast.Generic = sird -- If no other set is found, this set is used instead

    -- =========================================================================================================
    -- ***Distance Gear***
    -- =========================================================================================================

    sets.Distance = {
        waist = "Orpheus's Sash"
    }

end
