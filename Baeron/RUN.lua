-- Last updated: February 15, 2023
include('set-behavior')
include('augments')

-- Set this to to /equipset you want to use for your lockstyle
lockstyleset = 4

function define_sets()
    Melee_Modes = T {'Parry', 'Magic Tank', 'DD', 'DD Tank'}
    Idle_Modes = T {'Speed', 'Physical Tank', 'Hybrid Tank', 'Magic Tank', 'Refresh'}

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
        dexws = {
            name = "Ogma's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'DEX+10', 'Weapon skill damage +10%', 'Phys. dmg. taken-10%'}
        },
        sird = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'Evasion+10', 'Enmity+10', 'Spell interruption rate down-10%'}
        }
    }

    af = {
        head = "Rune. Bandeau +3",
        body = "Runeist Coat +3",
        hands = "Runeist Mitons +3",
        legs = "Rune. Trousers +3",
        feet = "Runeist Bottes +1"
    }

    relic = {
        head = "Fu. Bandeau +3",
        body = "Futhark Coat +3",
        hands = "Futhark Mitons +3",
        legs = "Futhark Trousers +3",
        feet = "Futhark Boots +3"
    }

    empy = {
        head = "Erilaz Galea +3",
        body = "Erilaz Surcoat +3",
        hands = "Erilaz Gauntlets +1",
        legs = "Eri. Leg Guards +3",
        feet = "Erilaz Greaves +3",
        ear = "Erilaz Earring +2"
    }

    enmity = { -- +117, PDT -32%, MDT -23%
        main = "Epeolatry", -- +23
        ammo = "Staunch Tathlum +1", -- DT -3%
        head = "Halitus Helm", -- +8
        body = "Emet Harness +1", -- +10, PDT -6%
        hands = "Kurys Gloves", -- +9
        legs = empy.legs, -- +12, DT -12%
        feet = empy.feet, -- +8, DT -11%
        neck = "Moonlight Necklace", -- +15
        waist = "Kasiri Belt", -- +3,
        left_ear = "Cryptic Earring", -- +4
        right_ear = "Trux Earring", -- +5
        left_ring = "Supershear Ring", -- +5
        right_ring = "Eihwaz Ring", -- +5
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
    sets.Idle.Speed = { -- 52% DT, 7% PDT, 1% MDT, 25% PDT II, Refresh +3
        main = "Epeolatry", -- 25% PDT II
        sub = "Refined Grip +1", -- 3% DT
        ammo = "Staunch Tathlum +1", -- 3% DT
        head = nyame.head, -- 7% DT
        body = af.body, -- Refresh +3
        hands = nyame.hands, -- 7% DT
        legs = carmine.legs,
        feet = empy.feet, -- 11% DT
        neck = "Futhark Torque +2", -- 7% DT
        waist = "Plat. Mog. Belt",
        left_ear = "Odnowa Earring +1", -- 110 MP to HP, 3% DT, 2% MDT
        right_ear = empy.ear, -- 6% DT
        left_ring = "Moonlight Ring", -- 5% DT
        right_ring = "Gelatinous Ring +1", -- 135 HP, 7% PDT, +1% MDT
        back = back.tank
    }

    sets.Idle['Physical Tank'] = { -- 60% DT, 7% PDT, 1% MDT, 25% PDT II
        main = "Epeolatry", -- 25% PDT II
        sub = "Refined Grip +1", -- 3% DT
        ammo = "Staunch Tathlum +1", -- 3% DT
        head = nyame.head, -- 7% DT
        body = af.body, -- Refresh +3
        hands = nyame.hands, -- 7% DT
        legs = nyame.legs, -- 8% DT
        feet = empy.feet, -- 11% DT
        neck = "Futhark Torque +2", -- 7% DT
        waist = "Plat. Mog. Belt",
        left_ear = "Odnowa Earring +1", -- 110 MP to HP, 3% DT, 2% MDT
        right_ear = empy.ear, -- 6% DT
        left_ring = "Moonlight Ring", -- 5% DT
        right_ring = "Gelatinous Ring +1", -- 135 HP, 7% PDT, +1% MDT
        back = back.tank
    }

    sets.Idle['Hybrid Tank'] = { -- 64% DT, 2% MDT, 25% PDT II, +55 all resistances
        main = "Epeolatry", -- 25% PDT II
        sub = "Refined Grip +1", -- 3% DT
        ammo = "Staunch Tathlum +1", -- 3% DT
        head = nyame.head, -- 7% DT
        body = nyame.body, -- 9% DT
        hands = nyame.hands, -- 7% DT
        legs = nyame.legs, -- 8% DT
        feet = empy.feet, -- 11% DT, +35 all resistances
        neck = "Futhark Torque +2", -- 7% DT
        waist = "Engraved Belt", -- +20 all resistances
        left_ear = "Odnowa Earring +1", -- 110 MP to HP, 3% DT, 2% MDT
        right_ear = empy.ear, -- 6% DT
        left_ring = "Shadow Ring", -- Resist Death
        right_ring = "Vexer Ring +1", -- MDB +4
        back = back.tank
    }

    sets.Idle['Magic Tank'] = { -- 52% DT, 7% MDT, 5% PDT II, +94 all resistances
        main = "Aettir", -- 5% PDT II, +50 Meva
        sub = "Irenic Strap +1", -- 5% MDT, +15 Meva
        ammo = "Staunch Tathlum +1", -- 3% DT
        head = nyame.head, -- 7% DT
        body = af.body, -- +39 all resistances, Refresh +3
        -- body = empy.body,
        hands = nyame.hands, -- 7% DT
        legs = nyame.legs, -- 8% DT
        feet = empy.feet, -- 11% DT, +35 all resistances
        neck = "Futhark Torque +2", -- 7% DT
        waist = "Engraved Belt", -- +20 all resistances
        left_ear = "Odnowa Earring +1", -- 110 MP to HP, 3% DT, 2% MDT
        right_ear = empy.ear, -- 6% DT
        left_ring = "Shadow Ring", -- Resist Death
        right_ring = "Vexer Ring +1", -- MDB +4
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
        waist = "Plat. Mog. Belt",
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

    sets.TP['Hybrid Tank'] = sets.Idle['Hybrid Tank']

    sets.TP['Magic Tank'] = sets.Idle['Magic Tank']

    sets.TP.DD = {
        main = "Epeolatry",
        sub = "Utu Grip",
        ammo = "Yamarang",
        head = ayanmo.head,
        body = "Ashera Harness",
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
        body = "Ashera Harness",
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
        back = back.dexws
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
        back = back.dexws
    }
    sets.WS.Dimidiation = {
        ammo = "Knobkierrie",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Rep. Plat. Medal",
        waist = sailfi.belt,
        left_ear = "Odr Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = back.dexws
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
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = back.dexws
    }

    -- =========================================================================================================
    -- ***Job Ability Sets***
    -- =========================================================================================================
    sets.JA['Vivacious Pulse'] = {
        head = empy.head,
        legs = af.legs,
        neck = "Incanter's Torque",
        waist = "Bishop's Sash",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = "Altruistic Cape"
    }

    magic_damage = {
        ammo = "Ghastly Tathlum +1",
        head = agwu.head,
        body = agwu.body,
        hands = agwu.hands,
        legs = agwu.legs,
        feet = agwu.feet,
        neck = "Baetyl Pendant",
        waist = "Orpheus's Sash",
        left_ear = "Crematio Earring",
        right_ear = "Friomisi Earring",
        left_ring = "Mujin Band",
        right_ring = "Shiva Ring +1"
    }
    sets.JA.Swipe = magic_damage
    sets.JA.Lunge = magic_damage

    sets.JA.Vallation = set_combine(enmity, {
        body = af.body,
        legs = relic.legs
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
    -- ***Item Sets***
    -- =========================================================================================================
    sets.item["Holy Water"] = {
        neck = "Nicander's Necklace",
        left_ring = "Purity Ring",
        right_ring = "Blenmot's Ring +1"
    }

    -- =========================================================================================================
    -- ***Precast Sets for Spells***
    -- =========================================================================================================
    sets.precast.FastCast = { -- 64%
        ammo = "Sapience Orb", -- 2%
        head = af.head, -- 14%
        body = empy.body, -- 13%
        hands = "Leyline Gloves", -- 8%
        legs = agwu.legs, -- 7%
        feet = carmine.feet, -- 8%
        neck = "Orunmila's Torque", -- 5%
        waist = "Kasiri Belt",
        left_ear = "Etiolation Earring", -- 1%
        right_ear = "Loquacious Earring", -- 2%
        left_ring = "Kishar Ring", -- 4%
        right_ring = "Gelatinous Ring +1",
        back = back.tank
    }
    sets.precast.Enhancing = set_combine(sets.precast.FastCast, {
        legs = relic.legs
    })

    -- =========================================================================================================
    -- ***Midcast Sets for Spells***
    -- =========================================================================================================
    -- I need 93% SIRD to cap with merits
    sird_enmity = { -- 94% SIRD, Enmity +66, PDT -62%, MDT -27%
        main = "Epeolatry", -- PDT II -25%
        ammo = "Staunch Tathlum +1", -- 11%, DT -3%
        head = empy.head, -- 20%
        body = "Emet Harness +1", -- Enmity +10, PDT -6%
        hands = "Rawhide Gloves", -- 15%
        legs = empy.legs, -- Enmity +13, DT -13%
        feet = empy.feet, -- Enmity +8, DT -11%
        neck = "Moonlight Necklace", -- 15%, Enmity +15
        waist = "Audumbla Sash", -- 10%, PDT -4%
        left_ear = "Halasz Earring", -- 5%
        right_ear = "Magnetic Earring", -- 8%
        left_ring = "Supershear Ring", -- Enmity +5
        right_ring = "Eihwaz Ring", -- Enmity +5,
        back = back.sird -- 10%, Enmity +10
    }

    sird_dt = { -- 94% SIRD, Enmity +46, PDT -75%, MDT -40%
        main = "Epeolatry", -- PDT II -25%
        ammo = "Staunch Tathlum +1", -- 11%, DT -3%
        head = empy.head, -- 20%
        body = nyame.body, -- DT -9%
        hands = "Rawhide Gloves", -- 15%
        legs = empy.legs, -- Enmity +13, DT -13%
        feet = empy.feet, -- Enmity +8, DT -11%
        neck = "Moonlight Necklace", -- 15%, Enmity +15
        waist = "Audumbla Sash", -- 10%, PDT -4%
        left_ear = "Odnowa Earring +1", -- DT -3%, MDT -2%
        right_ear = "Magnetic Earring", -- 8%
        left_ring = "Evanescence Ring", -- 5%
        right_ring = "Gelatinous Ring +1", -- PDT -7%, MDT +1% (HP +100)
        back = back.sird -- 10%, Enmity +10
    }

    sets.midcast.Enhancing = {
        main = "Pukulatmuj +1",
        head = carmine.head,
        body = "Manasa Chasuble",
        hands = af.hands,
        legs = carmine.legs,
        neck = "Incanter's Torque",
        waist = "Olympus Sash",
        left_ear = "Mimir Earring",
        right_ear = "Andoaa Earring"
    }
    sets.midcast.Aquaveil = sird_dt
    sets.midcast.EnhancingDuration = set_combine(sets.midcast.Enhancing, {
        head = empy.head,
        hands = "Regal Gauntlets",
        legs = relic.legs
    })
    sets.midcast.Phalanx = {
        ammo = "Staunch Tathlum +1",
        head = relic.head, -- +7
        body = herc.body.phalanx, -- +4
        hands = taeon.hands.fcphalanx, -- +3
        legs = herc.legs.phalanx, -- +4
        feet = herc.feet.phalanx, -- +5
        neck = "Incanter's Torque",
        waist = "Olympus Sash",
        left_ear = "Mimir Earring",
        right_ear = "Odnowa Earring +1",
        left_ring = "Stikini Ring +1",
        right_ring = "Gelatinous Ring +1",
        back = "Moonlight Cape"
    }
    sets.midcast.Bar = {
        ammo = "Staunch Tathlum +1",
        head = empy.head,
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
    sets.midcast.Jettatura = sird_enmity
    sets.midcast['Blank Gaze'] = sird_enmity

    -- SIRD Spells
    sets.midcast['Sheep Song'] = sird_dt
    sets.midcast['Geist Wall'] = sird_dt
    sets.midcast['Healing Breeze'] = sird_dt
    sets.midcast['Wild Carrot'] = sird_dt
    sets.midcast.Pollen = sird_dt
    sets.midcast.Cocoon = sird_dt
    sets.midcast.Soporific = sird_dt
    sets.midcast.Sandspin = sird_dt

    -- Spell-specific gear
    sets.midcast.Regen = set_combine(sets.midcast.EnhancingDuration, {
        head = af.head,
        neck = "Sacro Gorget",
        right_ear = empy.ear
    })
    sets.midcast.Refresh = set_combine(sets.midcast.EnhancingDuration, {
        head = empy.head
    })

    sets.midcast.Generic = sird_dt -- If no other set is found, this set is used instead

    -- =========================================================================================================
    -- ***Special Sets***
    -- =========================================================================================================

    sets.Distance = {
        waist = "Orpheus's Sash"
    }

end

function mod_aftercast(spell, set)
    if spell.interrupted ~= true then
        if spell.name == 'Rayke' then
            send_command(
                '@timers create Rayke 50 down; wait 35; input /p Rayke wearing off in 15 seconds; wait 15; input /p Rayke is OFF')
        elseif spell.name == 'Gambit' then
            send_command(
                '@timers create Gambit 96 down; wait 66; input /p Gambit wearing off in 30 seconds; wait 30; input /p Gambit is OFF')
        end
    end

    return set
end
