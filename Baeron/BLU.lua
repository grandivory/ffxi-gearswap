-- Last Updated: January 15th, 2023
include('set-behavior')
include('organizer-lib')
include('augments')

lockstyleset = 16

function define_sets()
    Melee_Modes = T {'DT', 'Att', 'Refresh'}
    Idle_Modes = T {'Speed', 'DT', 'Evasion'}
    Magic_Modes = T {'Acc', 'MAB', 'TH', 'Enmity', 'DT'}
    stances.WAR = S {'Berserk'}
    fastcast = .8

    th_gear = {
        ammo = "Per. Lucky Egg",
        legs = "Volte Hose",
        feet = herc.feet.thmab
    }

    enmity_gear = {
        ammo = "Sapience Orb",
        head = nyame.head,
        body = "Emet Harness +1",
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Unmoving Collar +1",
        waist = "Kasiri Belt",
        left_ear = "Cryptic Earring",
        right_ear = "Friomisi Earring",
        left_ring = "Supershear Ring",
        right_ring = "Eihwaz Ring",
        back = "Earthcry Mantle"
    }

    back = {
        tp = {
            name = "Rosmerta's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Phys. dmg. taken-10%'}
        },
        dexcrit = {
            name = "Rosmerta's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'DEX+10', 'Crit.hit rate+10', 'Phys. dmg. taken-10%'}
        },
        strws = {
            name = "Rosmerta's Cape",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        },
        nuke = {
            name = "Rosmerta's Cape",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'INT+10', '"Mag.Atk.Bns."+10', 'Phys. dmg. taken-10%'}
        },
        evafc = {
            name = "Rosmerta's Cape",
            augments = {'AGI+20', 'Eva.+20 /Mag. Eva.+20', 'Evasion+10', '"Fast Cast"+10', 'Evasion+15'}
        },
        bluskill = {
            name = "Cornflower Cape",
            augments = {'MP+20', 'Accuracy+1', 'Blue Magic skill +10'}
        }
    }

    af = {
        head = "Assim. Keffiyeh +3",
        body = "Assim. Jubbah +3",
        hands = "Assim. Bazubands +1",
        legs = "Assim. Shalwar +3"
    }

    relic = {
        head = "Luhlaza Keffiyeh +1",
        legs = "Luhlaza Shalwar +3",
        feet = "Luhlaza Charuqs +1"
    }

    empy = {
        head = "Hashishin Kavuk +3",
        body = "Hashishin Mintan +3",
        hands = "Hashi. Bazu. +2",
        legs = "Hashishin Tayt +2",
        feet = "Hashi. Basmak +2"
    }

    sets.empy = empy

    -- =========================================================================================================
    -- ***Not Engaged Sets***
    -- =========================================================================================================
    sets.Idle.DT = { -- Refresh +17, 32% DT, 20% PDT, 3% MDT
        main = { -- Refresh +2
            name = "Colada",
            augments = {'"Refresh"+2', 'INT+2', 'Mag. Acc.+3', 'DMG:+2'}
        },
        sub = { -- Refresh +2
            name = "Colada",
            augments = {'"Refresh"+2', 'INT+2', 'Mag. Acc.+16', '"Mag.Atk.Bns."+5'}
        },
        ammo = "Staunch Tathlum +1", -- DT -3%
        head = herc.head.refresh, -- Refresh +2
        body = empy.body, -- Refresh +4, DT -13%
        hands = herc.hands.refresh, -- Refresh +2, PDT -2%
        legs = herc.legs.refresh, -- Refresh +2, PDT -2%
        feet = herc.feet.refresh, -- Refresh +2, PDT -2%
        neck = "Loricate Torque +1", -- DT -6%
        left_ear = "Etiolation Earring", -- MDT -3%, Resist Silence +15
        right_ear = "Sanare Earring", -- MDB +4
        waist = "Flume Belt +1", -- PDT -4%
        left_ring = "Defending Ring", -- DT -10%
        right_ring = "Stikini Ring +1", -- Refresh +1
        back = back.tp -- PDT -10%
    }

    sets.Idle.Speed = set_combine(sets.Idle.DT, { -- Refresh +15, 32% DT, 18% PDT, 3% MDT
        legs = "Carmine Cuisses +1"
    })

    sets.Idle.Evasion = { -- +590~600 Evasion, 55% PDT, 47% MDT
        main = "Tizona",
        sub = "Sakpata's Sword", -- 10% DT
        ammo = "Amar Cluster", -- +10 Evasion
        head = nyame.head, -- +91 Evasion, 7% DT
        body = nyame.body, -- +102 Evasion, 9% DT
        hands = nyame.hands, -- +80 Evasion, 7% DT
        legs = nyame.legs, -- +85 Evasion, 8% DT
        feet = nyame.feet, -- +119 Evasion, 7% DT
        neck = "Bathy Choker +1", -- +20~30 Evasion
        waist = "Kasiri Belt", -- +13 Evasion
        left_ear = "Eabani Earring", -- +15 Evasion
        right_ear = "Infused Earring", -- +10 Evasion
        left_ring = "Supershear Ring",
        right_ring = "Gelatinous Ring +1", -- 7% PDT, +1% MDT
        back = back.evafc -- +45 Evasion
    }

    -- =========================================================================================================
    -- ***Engaged Sets***
    -- =========================================================================================================
    aftermath = {
        ammo = "Aurgelmir Orb +1",
        head = malignance.head,
        body = malignance.body,
        hands = malignance.hands,
        legs = malignance.legs,
        feet = malignance.feet,
        neck = "Mirage Stole +2",
        waist = "Reiki Yotai",
        left_ear = "Telos Earring",
        right_ear = "Digni. Earring",
        left_ring = "Chirich Ring +1",
        right_ring = "Chirich Ring +1",
        back = back.tp
    }

    sets.TP.Att = {
        main = "Tizona",
        sub = "Thibron",
        ammo = "Aurgelmir Orb +1",
        head = adhemar.head,
        body = ayanmo.body,
        hands = adhemar.hands,
        legs = "Samnuha Tights",
        feet = herc.feet.dexta,
        neck = "Mirage Stole +2",
        waist = "Windbuffet Belt +1",
        left_ear = "Telos Earring",
        right_ear = "Cessance Earring",
        left_ring = "Petrov Ring",
        right_ring = "Epona's Ring",
        back = back.tp
    }

    -- DT Sets
    sets.TP.DT = set_combine(sets.TP.Att, { -- 50% DT
        head = malignance.head, -- 6% DT
        body = malignance.body, -- 9% DT
        hands = malignance.hands, -- 5% DT
        legs = malignance.legs, -- 7% DT
        feet = malignance.feet, -- 4%
        neck = "Mirage Stole +2",
        left_ring = "Defending Ring", -- 10%
        back = back.tp
    })

    for mode, set in pairs(sets.TP) do
        set.withBuffs = {}
        set.withBuffs["Aftermath: Lv.3"] = set_combine(set, aftermath)
    end

    sets.TP.Refresh = sets.Idle.Refresh

    -- =========================================================================================================
    -- ***Weapon Skill Sets***
    -- =========================================================================================================
    sets.WS["Chant du Cygne"] = {
        ammo = "Aurgelmir Orb +1",
        head = adhemar.head,
        body = nyame.body,
        hands = adhemar.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Mirage Stole +2",
        waist = "Fotia Belt",
        left_ear = "Mache Earring +1",
        right_ear = "Odr Earring",
        left_ring = "Begrudging Ring",
        right_ring = "Epona's Ring",
        back = back.dexcrit
    }
    sets.WS["Requiescat"] = {
        ammo = "Coiste Bodhar",
        head = empy.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Moonshade Earring",
        right_ear = "Brutal Earring",
        left_ring = "Rufescent Ring",
        right_ring = "Epona's Ring",
        back = back.strws
    }
    sets.WS["Savage Blade"] = {
        ammo = "Aurgelmir Orb +1",
        head = empy.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Mirage Stole +2",
        waist = "Sailfi Belt +1",
        left_ear = "Moonshade Earring",
        right_ear = "Ishvara Earring",
        left_ring = "Rufescent Ring",
        right_ring = "Epaminondas's Ring",
        back = back.strws
    }
    sets.WS["Expiacion"] = sets.WS["Savage Blade"]
    sets.WS["Black Halo"] = set_combine(sets.WS["Savage Blade"], {
        left_ring = "Metamorph Ring +1"
    })
    sets.WS.Realmrazer = set_combine(sets.WS["Savage Blade"], {
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ring = "Metamorph Ring +1"
    })

    sets.WS["Sanguine Blade"] = {
        ammo = "Ghastly Tathlum +1",
        head = "Pixie Hairpin +1",
        body = amalric.body,
        hands = empy.hands,
        legs = relic.legs,
        feet = amalric.feet,
        neck = "Baetyl Pendant",
        waist = "Sacro Cord",
        left_ear = "Friomisi Earring",
        right_ear = "Regal Earring",
        left_ring = "Archon Ring",
        right_ring = "Epaminondas's Ring",
        back = back.nuke
    }
    sets.WS.Generic = {
        ammo = "Amar Cluster",
        head = empy.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Mirage Stole +2",
        waist = "Sailfi Belt +1",
        left_ear = "Moonshade Earring",
        right_ear = "Ishvara Earring",
        left_ring = "Rufescent Ring",
        right_ring = "Epaminondas's Ring",
        back = back.strws
    }
    sets.WS.MAB = {
        ammo = "Ghastly Tathlum +1",
        head = empy.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = relic.legs,
        feet = herc.feet.thmab,
        neck = "Baetyl Pendant",
        waist = "Sacro Cord",
        left_ear = "Friomisi Earring",
        right_ear = "Regal Earring",
        left_ring = "Epaminondas's Ring",
        right_ring = "Shiva Ring +1",
        back = back.nuke
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
    sets.precast.FastCast = { -- 82%
        head = carmine.head, -- 14%
        body = pinga.body, -- 15%
        hands = "Leyline Gloves", -- 7%
        legs = pinga.legs, -- 13%
        feet = "Carmine Greaves +1", -- 8%
        neck = "Orunmila's Torque", -- 5%
        left_ear = "Loquac. Earring", -- 2%
        right_ear = "Enchntr. Earring +1", -- 2%
        left_ring = "Kishar Ring", -- 4%
        right_ring = "Rahab Ring", -- 2%
        back = back.evafc -- 10%
    }
    sets.precast.BlueMagic = set_combine(sets.precast.FastCast, {
        body = empy.body
    })

    -- =========================================================================================================
    -- ***Midcast Sets***
    -- =========================================================================================================
    sets.midcast.Cur = { -- 55% Potency, 234 MND, 18 Healing SKill, 30% DT, 16% PDT
        main = bunzi.rod, -- 30% Potency, 15 MND
        sub = "Nibiru Cudgel", -- 10% Potency, 11 MND
        head = empy.head, -- 35 MND
        body = pinga.body, -- 15% Potency, 40 MND
        hands = empy.hands, -- 45 MND, 9% DT
        legs = empy.legs, -- 38 MND, 11% DT
        feet = carmine.feet, -- 31 MND
        neck = "Loricate Torque +1", -- 6% DT
        waist = "Luminary Sash", -- 10 MND
        left_ear = "Meili Earring", -- 10 Healing Skill
        right_ear = "Regal Earring", -- 10 MND
        left_ring = "Defending Ring", -- 10% DT
        right_ring = "Haoma's Ring", -- 8 Healing Skill
        back = back.tp -- 10% PDT
    }
    sets.midcast.CureSelf = set_combine(sets.midcast.Cur, {
        neck = "Phalaina Locket",
        waist = "Gishdubar Sash",
        right_ring = "Kunaji Ring"
    })
    sets.midcast.Elemental = {
        main = "Maxentius",
        sub = bunzi.rod,
        ammo = "Ghastly Tathlum +1",
        head = empy.head,
        body = empy.body,
        hands = amalric.hands,
        legs = amalric.legs,
        feet = amalric.feet,
        neck = "Sibyl Scarf",
        waist = "Sacro Cord",
        left_ear = "Friomisi Earring",
        right_ear = "Regal Earring",
        left_ring = "Shiva Ring +1",
        right_ring = "Metamorph Ring +1",
        back = back.nuke
    }
    sets.midcast.Enfeebling = {
        main = "Tizona",
        sub = bunzi.rod,
        ammo = "Pemphredo Tathlum",
        head = af.head,
        body = empy.body,
        hands = empy.hands,
        legs = empy.legs,
        feet = empy.feet,
        neck = "Mirage Stole +2",
        waist = "Acuity Belt +1",
        left_ear = "Regal Earring",
        right_ear = "Hashi. Earring +1",
        left_ring = "Stikini Ring +1",
        right_ring = "Metamorph Ring +1",
        back = "Aurist's Cape +1"
    }

    sets.midcast.BlueMagic.Physical = {
        ammo = "Aurgelmir Orb +1",
        head = empy.head,
        body = empy.body,
        hands = empy.hands,
        legs = empy.feet,
        feet = empy.feet,
        neck = "Mirage Stole +2",
        waist = "Wanion Belt",
        left_ear = "Telos Earring",
        right_ear = "Odr Earring",
        left_ring = "Ilabrat Ring",
        right_ring = "Rufescent Ring",
        back = back.strws
    }
    sets.midcast.BlueMagic.AddEffect = { -- Acc
        ammo = "Amar Cluster", -- Acc +10
        head = empy.head, -- Acc +61, MAcc +61
        body = empy.body, -- Acc +64, MAcc +64
        hands = empy.hands, -- Acc +52, MAcc +52
        legs = empy.legs, -- Acc +53, MAcc +53
        feet = empy.feet, -- Acc +50, MAcc +50
        neck = "Mirage Stole +2", -- Acc +25, MAcc +25
        waist = "Eschan Stone", -- Acc +15, MAcc +7
        left_ear = "Digni. Earring", -- Acc +10, Macc +10
        right_ear = "Hashi. Earring +1", -- Acc +12, Macc +12, Skill +11
        left_ring = "Stikini Ring +1", -- Macc +8, BLU +8
        right_ring = "Stikini Ring +1", -- Macc +8, BLU +8
        back = "Aurist's Cape +1" -- Acc +33, MAcc +33
    }
    sets.midcast.BlueMagic.MAB = set_combine(sets.midcast.Elemental, {})
    sets.midcast["Tenebral Crush"] = set_combine(sets.midcast.BlueMagic.MAB, {
        head = "Pixie Hairpin +1"
    })
    sets.midcast["Palling Salvo"] = sets.midcast["Tenebral Crush"]
    sets.midcast["Atra. Libations"] = sets.midcast["Tenebral Crush"]
    sets.midcast.BlueMagic.MAB.DT = set_combine(sets.midcast.Elemental, {
        body = empy.body, -- 13%
        hands = empy.hands, -- 9%
        legs = empy.legs -- 11%
    })
    sets.midcast["Tenebral Crush"].DT = set_combine(sets.midcast["Tenebral Crush"], {
        body = empy.body, -- 13%
        hands = empy.hands, -- 9%
        legs = empy.legs -- 11%
    })
    sets.midcast["Palling Salvo"].DT = sets.midcast["Tenebral Crush"].DT
    sets.midcast["Atra. Libations"].DT = sets.midcast["Tenebral Crush"].DT
    sets.midcast.BlueMagic.Breath = set_combine(sets.midcast.Elemental, {
        -- ammo = "Mavi Tathlum",
        head = relic.head
    })
    sets.midcast.BlueMagic.Breath.TH = set_combine(sets.midcast.BlueMagic.Breath, th_gear)
    sets.midcast.BlueMagic.Cure = copy(sets.midcast.Cur)
    sets.midcast.BlueMagic.CureSelf = set_combine(sets.midcast.BlueMagic.Cure, {
        neck = "Phalaina Locket",
        waist = "Gishdubar Sash",
        left_ring = "Kunaji Ring"
    })
    sets.midcast["White Wind"] = { -- 1300 HP, 55% Cure Potency
        main = bunzi.rod, -- 30% Potency
        sub = "Nibiru Cudgel", -- 10% Potency
        ammo = "Psilomene", -- 15 HP
        -- ammo = "Egoist's Tathlum", -- 45 HP
        head = nyame.head, -- 91 HP
        body = pinga.body, -- 101 HP, 15% Cure Potency
        -- body = nyame.body, -- 136 HP
        hands = "Regal Cuffs", -- 91 HP
        legs = nyame.legs, -- 114 HP
        feet = nyame.feet, -- 68 HP
        neck = "Dualism Collar +1", -- 60 HP
        waist = "Kasiri Belt", -- 30 HP
        left_ear = "Tuisto Earring", -- 150 HP
        right_ear = "Odnowa Earring +1", -- 110 HP
        left_ring = "Ilabrat Ring", -- 60 HP
        right_ring = "Gelatinous Ring +1", -- 135 HP
        back = "Moonlight Cape" -- 275 HP
    }
    sets.midcast.BlueMagic.Skill = { -- +140
        -- ammo = "Mavi Tathlum", -- +5
        head = relic.head, -- +13
        body = af.body, -- +24
        hands = "Rawhide Gloves", -- +10
        legs = empy.legs, -- +28
        feet = relic.feet, -- +8
        neck = "Mirage Stole +2", -- +20
        right_ear = "Hashi. Earring +1", -- +11
        left_ring = "Stikini Ring +1", -- +8
        right_ring = "Stikini Ring +1", -- +8
        back = back.bluskill -- +15

    }
    sets.midcast.BlueMagic.Debuff = sets.midcast.Enfeebling

    sets.midcast.BlueMagic.Static = { -- 62% DT, 20% FC
        ammo = "Sapience Orb", -- 2% FC
        head = malignance.head, -- 6% DT
        body = empy.body, -- 13% DT
        hands = empy.hands, -- 9% DT
        legs = empy.legs, -- 11% DT
        feet = malignance.feet, -- 4% DT
        neck = "Orunmila's Torque", -- 5% FC
        waist = "Flume Belt +1", -- 4% PDT
        left_ear = "Etiolation Earring", -- 1% FC, 3% MDT
        right_ear = "Enchntr. Earring +1", -- 2% FC
        left_ring = "Defending Ring", -- 10% DT
        right_ring = { -- 5% PDT, 6% MDT
            name = "Dark Ring",
            augments = {'Phys. dmg. taken -5%', 'Magic dmg. taken -6%'}
        },
        back = back.evafc -- 10% FC
    }

    -- Specific spells
    -- TODO: Redo this set
    sets.midcast["Occultation"] = { -- 551 skill (11 shadows), 40% PDT, 30% MDT, 5% FC
        ammo = "Sapience Orb", -- 2% FC
        head = malignance.head, -- 6% DT
        body = af.body, -- +23 Skill
        hands = malignance.hands, -- 5% DT
        legs = empy.legs, -- +23 Skill
        feet = relic.feet, -- +8 Skill
        neck = "Mirage Stole +2", -- +20 Skill
        waist = "Flume Belt +1", -- 4% PDT
        left_ear = "Etiolation Earring", -- 1% FC, 3% MDT
        right_ear = "Enchntr. Earring +1", -- 2% FC
        left_ring = "Defending Ring", -- 10% DT
        right_ring = { -- 5% PDT, 6% MDT
            name = "Dark Ring",
            augments = {'Phys. dmg. taken -5%', 'Magic dmg. taken -6%'}
        },
        back = back.nuke -- 10% PDT
    }
    sets.midcast["Sound Blast"] = set_combine(sets.midcast.BlueMagic.Debuff, th_gear)
    sets.midcast["Sudden Lunge"] = sets.midcast.BlueMagic.AddEffect
    sets.midcast["Sudden Lunge"].TH = set_combine(sets.midcast.BlueMagic.AddEffect, th_gear)

    acc_fc = { -- 503 Macc Skill, 509 Macc, 75 Skill, 24% FC, 23% Haste, 15% Recast Delay
        main = "Tizona", -- 255 Macc Skill, 70 Macc
        sub = sakpata.sword, -- 248 Macc Skill, 45 Macc, 10% FC
        ammo = "Pemphredo Tathlum", -- 8 Macc
        head = carmine.head, -- 50 Macc, 14% FC, 8% Haste
        body = empy.body, -- 64 Macc, 4% Haste
        -- body = relic.body, -- 40 Macc, 9% FC
        hands = empy.hands, -- 52 Macc, 3% Haste, 15% Recast delay
        legs = empy.legs, -- 53 Macc, 28 Skill, 5% Haste
        feet = empy.feet, -- 50 Macc, 3% Haste
        neck = "Mirage Stole +2", -- 25 Macc, 20 Skill,
        waist = "Acuity Belt +1", -- 15 Macc
        left_ear = "Digni. Earring", -- 10 Macc
        right_ear = "Hashi. Earring +1", -- 12 Macc, 11 Skill
        left_ring = "Stikini Ring +1", -- 11 Macc, 8 Skill
        right_ring = "Stikini Ring +1", -- 11 Macc, 8 Skill
        back = "Aurist's Cape +1" -- 33 Macc

    }
    sets.midcast["Feather Tickle"] = acc_fc
    sets.midcast["Reaving Wind"] = acc_fc

    sets.midcast["Temporal Shift"] = sets.midcast.BlueMagic.Debuff
    sets.midcast["Temporal Shift"].Enmity = enmity_gear
    sets.midcast["Actinic Burst"] = sets.midcast.BlueMagic.Debuff
    sets.midcast["Actinic Burst"].Enmity = enmity_gear
    sets.midcast.Fantod = sets.midcast.BlueMagic.Static
    sets.midcast.Fantod.Enmity = enmity_gear

    sets.midcast.Phalanx = {
        main = sakpata.sword,
        ammo = "Sapience Orb",
        head = taeon.head.fcphalanx,
        body = herc.body.phalanx,
        hands = taeon.hands.fcphalanx,
        legs = herc.legs.phalanx,
        feet = taeon.feet.fcphalanx,
        neck = "Orunmila's Torque",
        -- waist = "Olumpus Sash",
        left_ear = "Odnowa Earring +1",
        right_ear = "Enchntr. Earring +1",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1"
        -- back = "Merciful Cape"
    }

    dream_flower = {
        main = "Tizona",
        sub = bunzi.rod,
        ammo = "Pemphredo Tathlum",
        head = malignance.head,
        body = malignance.body,
        hands = malignance.hands,
        legs = malignance.legs,
        feet = malignance.feet,
        neck = "Mirage Stole +2",
        waist = "Acuity Belt +1",
        left_ear = "Regal Earring",
        right_ear = "Digni. Earring",
        left_ring = "Defending Ring",
        right_ring = "Metamor. Ring +1",
        back = back.nuke
    }
    sets.midcast["Dream Flower"] = dream_flower
    sets.midcast["Dream Flower"].TH = set_combine(dream_flower, th_gear)

    -- =========================================================================================================
    -- ***Special Sets***
    -- =========================================================================================================
    -- Pieces to switch out when buffs are active
    sets.midcast.mod.Diffusion = {
        feet = relic.feet
    }
    sets.midcast.mod["Burst Affinity"] = {
        feet = empy.feet
    }
    sets.midcast.mod["Chain Affinity"] = {
        head = empy.head
    }

    -- Pieces to switch out when the day/weather matches
    sets.Weather = {
        waist = "Hachirin-no-obi",
        back = "Twilight Cape"
    }

    sets.Distance = {
        waist = "Orpheus's Sash"
    }
end
