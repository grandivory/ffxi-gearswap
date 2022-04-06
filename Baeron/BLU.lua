include('set-behavior')
include('organizer-lib')
include('augments')

lockstyleset = 16

function define_sets()
    Melee_Modes = T {'DT', 'Att', 'Acc', 'Refresh'}
    Idle_Modes = T {'Speed', 'Refresh', 'Hybrid', 'DT', 'Evasion'}
    Magic_Modes = T {'Acc', 'MAB', 'TH', 'Enmity'}
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

    -- Not Engaged
    sets.Idle.Refresh = { -- Refresh +18, +4 MDB, -24% PDT, -9% MDT
        main = { -- Refresh +2
            name = "Colada",
            augments = {'"Refresh"+2', 'INT+2', 'Mag. Acc.+3', 'DMG:+2'}
        },
        sub = { -- Refresh +2
            name = "Colada",
            augments = {'"Refresh"+2', 'INT+2', 'Mag. Acc.+16', '"Mag.Atk.Bns."+5'}
        },
        ammo = "Vanir Battery", -- +4 MDB
        head = herc.head.refresh, -- Refresh +2
        body = "Jhakri Robe +2", -- Refresh +4
        hands = herc.hands.refresh, -- Refresh +2, PDT -2%
        legs = herc.legs.refresh, -- Refresh +2
        feet = herc.feet.refresh, -- Refresh +2, PDT -2%
        neck = "Loricate Torque +1", -- DT -6%
        left_ear = "Etiolation Earring", -- MDT -3%, Resist Silence +15
        waist = "Flume Belt +1", -- PDT -4%
        left_ring = "Stikini Ring +1", -- Refresh +1
        right_ring = "Stikini Ring +1", -- Refresh +1
        back = back.tp -- PDT -10%
    }

    sets.Idle.Hybrid = { -- Refresh +16, +4 MDB, -39% PDT, -25% MDT
        main = { -- Refresh +2
            name = "Colada",
            augments = {'"Refresh"+2', 'INT+2', 'Mag. Acc.+3', 'DMG:+2'}
        },
        sub = { -- Refresh +2
            name = "Colada",
            augments = {'"Refresh"+2', 'INT+2', 'Mag. Acc.+16', '"Mag.Atk.Bns."+5'}
        },
        ammo = "Vanir Battery", -- +4 MDB
        head = herc.head.refresh, -- Refresh +2
        body = "Jhakri Robe +2", -- Refresh +4
        hands = herc.hands.refresh, -- Refresh +2, PDT -2%
        legs = herc.legs.refresh, -- Refresh +2
        feet = herc.feet.refresh, -- Refresh +2, PDT -2%
        neck = "Loricate Torque +1", -- DT -6%
        left_ear = "Etiolation Earring", -- MDT -3%, Resist Silence +15
        waist = "Flume Belt +1", -- PDT -4%
        left_ring = "Defending Ring", -- DT -10%
        right_ring = {
            name = "Dark Ring",
            augments = {'Phys. dmg. taken -5%', 'Magic dmg. taken -6%'}
        },
        back = back.tp -- PDT -10%
    }

    -- TODO: Replace a Colada with Sakpata's Sword, and use more Herculean refresh pieces
    sets.Idle.DT = { -- Refresh +12, +4 MDB, -52% PDT, -38% MDT
        main = { -- Refresh +2
            name = "Colada",
            augments = {'"Refresh"+2', 'INT+2', 'Mag. Acc.+3', 'DMG:+2'}
        },
        sub = { -- Refresh +2
            name = "Colada",
            augments = {'"Refresh"+2', 'INT+2', 'Mag. Acc.+16', '"Mag.Atk.Bns."+5'}
        },
        ammo = "Vanir Battery", -- +4 MDB
        head = malignance.head, -- DT - 6%
        body = "Jhakri Robe +2", -- Refresh +4
        hands = herc.hands.refresh, -- Refresh +2, PDT -2%
        legs = malignance.legs, -- DT -7%
        feet = herc.feet.refresh, -- Refresh +2, PDT -2%
        neck = "Loricate Torque +1", -- DT -6%
        left_ear = "Etiolation Earring", -- MDT -3%, Resist Silence +15
        waist = "Flume Belt +1", -- PDT -4%
        left_ring = "Defending Ring", -- DT -10%
        right_ring = {
            name = "Dark Ring",
            augments = {'Phys. dmg. taken -5%', 'Magic dmg. taken -6%'}
        },
        back = back.tp -- PDT -10%
    }

    sets.Idle.Speed = { -- Refresh +8, +4 MDB, -50% PDT, -40% MDT
        main = { -- Refresh +2
            name = "Colada",
            augments = {'"Refresh"+2', 'INT+2', 'Mag. Acc.+3', 'DMG:+2'}
        },
        sub = { -- Refresh +2
            name = "Colada",
            augments = {'"Refresh"+2', 'INT+2', 'Mag. Acc.+16', '"Mag.Atk.Bns."+5'}
        },
        ammo = "Vanir Battery", -- +4 MDB
        head = malignance.head, -- DT - 6%
        body = "Jhakri Robe +2", -- Refresh +4
        hands = malignance.hands, -- DT -5%
        legs = "Carmine Cuisses +1",
        feet = malignance.feet, -- DT -4%
        neck = "Loricate Torque +1", -- DT -6%
        left_ear = "Etiolation Earring", -- MDT -3%, Resist Silence +15
        waist = "Flume Belt +1", -- PDT -4%
        left_ring = "Defending Ring", -- DT -10%
        right_ring = {
            name = "Dark Ring",
            augments = {'Phys. dmg. taken -5%', 'Magic dmg. taken -6%'}
        },
        back = back.tp -- PDT -10%
    }

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

    -- Engaged Sets

    aftermath = {
        ammo = "Ginsen", -- Aurgelmir Orb +1
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
        ammo = "Ginsen",
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

    sets.TP.Acc = set_combine(sets.TP.Att, {
        sub = "Zantetsuken",
        ammo = "Falcon Eye"
    })

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

    -- WS Sets
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
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Brutal Earring",
        left_ring = "Rufescent Ring",
        right_ring = "Epona's Ring",
        back = back.strws
    }
    sets.WS["Savage Blade"] = {
        ammo = "Aurgelmir Orb +1",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Mirage Stole +2",
        waist = "Sailfi Belt +1",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Ishvara Earring",
        left_ring = "Rufescent Ring",
        right_ring = "Epaminondas's Ring",
        back = back.strws
    }
    sets.WS["Expiacion"] = sets.WS["Savage Blade"]
    sets.WS["Black Halo"] = set_combine(sets.WS["Savage Blade"], {
        left_ring = "Metamorph Ring +1"
    })
    sets.WS["Sanguine Blade"] = {
        ammo = "Ghastly Tathlum +1",
        head = "Pixie Hairpin +1",
        body = "Amalric Doublet +1",
        hands = "Jhakri Cuffs +2",
        legs = "Luhlaza Shalwar +3",
        feet = "Amalric Nails +1",
        neck = "Baetyl Pendant",
        waist = "Eschan Stone",
        left_ear = "Friomisi Earring",
        right_ear = "Regal Earring",
        left_ring = "Archon Ring",
        right_ring = "Epaminondas's Ring",
        back = back.nuke
    }
    sets.WS.Generic = {
        ammo = "Amar Cluster",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Mirage Stole +2",
        waist = "Sailfi Belt +1",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Ishvara Earring",
        left_ring = "Rufescent Ring",
        right_ring = "Epaminondas's Ring",
        back = back.strws
    }
    sets.WS.MAB = {
        ammo = "Ghastly Tathlum +1",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = herc.feet.thmab,
        neck = "Baetyl Pendant",
        waist = "Eschan Stone",
        left_ear = "Friomisi Earring",
        right_ear = "Regal Earring",
        left_ring = "Epaminondas's Ring",
        right_ring = "Shiva Ring +1",
        back = back.nuke
    }

    -- Precast sets for spells
    sets.precast.FastCast = { -- 73%
        main = { -- 4%
            name = "Colada",
            augments = {'"Refresh"+2', 'INT+2', 'Mag. Acc.+3', 'DMG:+2'}
        },
        sub = { -- 4%
            name = "Colada",
            augments = {'"Refresh"+2', 'INT+2', 'Mag. Acc.+16', '"Mag.Atk.Bns."+5'}
        },
        ammo = "Sapience Orb", -- 2%
        head = herc.head.refresh, -- 7%
        body = taeon.body.fcphalanx, -- 9%
        hands = "Leyline Gloves", -- 7%
        legs = "Psycloth Lappas", -- 7%
        feet = "Carmine Greaves +1", -- 8%
        neck = "Orunmila's Torque", -- 5%
        left_ear = "Loquac. Earring", -- 2%
        right_ear = "Enchntr. Earring +1", -- 2%
        left_ring = "Kishar Ring", -- 4%
        right_ring = "Rahab Ring", -- 2%
        back = back.evafc -- 10%
    }
    sets.precast.BlueMagic = set_combine(sets.precast.FastCast, {
        body = "Hashishin Mintan +1"
    })

    -- Midcast sets for spells
    sets.midcast.Cur = {
        main = "Bunzi's Rod",
        sub = "Nibiru Cudgel",
        head = telchine.head.enhfc,
        body = "Amalric Doublet +1",
        hands = "Jhakri Cuffs +2",
        legs = "Gyve Trousers",
        feet = "Medium's Sabots",
        neck = "Phalaina Locket",
        waist = "Luminary Sash",
        left_ear = "Mendicant's Earring",
        right_ear = "Regal Earring",
        left_ring = "Haoma's Ring",
        right_ring = "Haoma's Ring",
        back = back.bluskill
    }
    sets.midcast.CureSelf = set_combine(sets.midcast.Cur, {
        neck = "Phalaina Locket",
        waist = "Gishdubar Sash",
        left_ring = "Kunaji Ring"
    })
    sets.midcast.Elemental = {
        main = "Maxentius",
        sub = "Bunzi's Rod",
        ammo = "Ghastly Tathlum +1",
        head = "Jhakri Coronal +2",
        body = "Amalric Doublet +1",
        hands = "Amalric Gages +1",
        legs = "Luhlaza Shalwar +3",
        feet = "Amalric Nails +1",
        neck = "Baetyl Pendant",
        waist = "Eschan Stone",
        left_ear = "Friomisi Earring",
        right_ear = "Regal Earring",
        left_ring = "Shiva Ring +1",
        right_ring = "Metamorph Ring +1",
        back = back.nuke
    }
    sets.midcast.Enfeebling = {
        main = "Tizona",
        sub = "Bunzi's Rod",
        ammo = "Pemphredo Tathlum",
        head = "Assim. Keffiyeh +3",
        body = "Jhakri Robe +2",
        hands = malignance.hands,
        legs = "Assim. Shalwar +3",
        feet = "Jhakri Pigaches +2", -- TODO: Replace
        neck = "Mirage Stole +2",
        waist = "Acuity Belt +1",
        left_ear = "Regal Earring",
        right_ear = "Digni. Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Metamorph Ring +1",
        back = "Aurist's Cape +1"
    }

    sets.midcast.BlueMagic.Physical = {
        ammo = "Ginsen",
        head = adhemar.head,
        body = gleti.body,
        hands = "Jhakri Cuffs +2",
        legs = gleti.feet,
        feet = "Gleti's Boots",
        neck = "Mirage Stole +2",
        waist = "Sailfi Belt +1",
        left_ear = "Telos Earring",
        right_ear = "Odr Earring",
        left_ring = "Shukuyu Ring",
        right_ring = "Rufescent Ring",
        back = back.strws
    }
    sets.midcast.BlueMagic.AddEffect = { -- Acc +340, MAcc +325, BLU +16
        ammo = "Falcon Eye", -- Acc +13
        head = malignance.head, -- Acc +50, MAcc +50
        body = "Jhakri Robe +2", -- Acc +46, MAcc +46 (and more INT than Malignance)
        hands = "Jhakri Cuffs +2", -- Acc +43, MAcc +43 (and more INT than Malignance)
        legs = "Jhakri Slops +2", -- TODO: Replace; Acc +45, MAcc +45 (and more INT than Malignance)
        feet = malignance.feet, -- Acc +50, MAcc +50
        neck = "Mirage Stole +2", -- Acc +25, MAcc +25
        waist = "Eschan Stone", -- Acc +15, MAcc +7
        left_ear = "Telos Earring", -- Acc +10
        right_ear = "Digni. Earring", -- Acc +10, Macc +10
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
    sets.midcast.BlueMagic.Breath = set_combine(sets.midcast.Elemental, {
        -- ammo = "Mavi Tathlum",
        head = "Luh. Keffiyeh +1"
    })
    sets.midcast.BlueMagic.Breath.TH = set_combine(sets.midcast.BlueMagic.Breath, th_gear)
    sets.midcast.BlueMagic.Cure = set_combine(sets.midcast.Cur, {
        legs = "Carmine Cuisses +1"
    })
    sets.midcast.BlueMagic.CureSelf = set_combine(sets.midcast.BlueMagic.Cure, {
        neck = "Phalaina Locket",
        waist = "Gishdubar Sash",
        left_ring = "Kunaji Ring"
    })
    sets.midcast["White Wind"] = {
        ammo = "Falcon Eye",
        head = nyame.head,
        body = nyame.body,
        hands = "Hieros Mittens",
        legs = "Gyve Trousers",
        feet = {
            name = "Medium's Sabots",
            augments = {'MP+40', 'MND+6', '"Conserve MP"+5', '"Cure" potency +3%'}
        },
        neck = "Phalaina Locket",
        waist = "Eschan Stone",
        left_ear = "Tuisto Earring",
        right_ear = "Odnowa Earring +1",
        left_ring = "Ilabrat Ring",
        right_ring = "Lebeche Ring"
    }
    sets.midcast.BlueMagic.Skill = { -- +129
        -- ammo = "Mavi Tathlum", -- +5
        head = "Luh. Keffiyeh +1", -- +13
        body = "Assim. Jubbah +3", -- +24
        hands = "Rawhide Gloves", -- +10
        legs = "Hashishin Tayt +1", -- +23
        feet = "Luhlaza Charuqs +1", -- +8
        neck = "Mirage Stole +2", -- +20
        left_ring = "Stikini Ring +1", -- +8
        right_ring = "Stikini Ring +1", -- +8
        back = back.bluskill -- +15

    }
    sets.midcast.BlueMagic.Debuff = sets.midcast.Enfeebling
    sets.midcast.BlueMagic.Static = { -- 50% DT, 20% FC
        ammo = "Sapience Orb", -- 2% FC
        head = malignance.head, -- 6% DT
        body = malignance.body, -- 9% DT
        hands = malignance.hands, -- 5% DT
        legs = malignance.legs, -- 7% DT
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
    sets.midcast["Occultation"] = { -- 551 skill (11 shadows), 40% PDT, 30% MDT, 5% FC
        ammo = "Sapience Orb", -- 2% FC
        head = malignance.head, -- 6% DT
        body = "Assim. Jubbah +3", -- +23 Skill
        hands = malignance.hands, -- 5% DT
        legs = "Hashishin Tayt +1", -- +23 Skill
        feet = "Luhlaza Charuqs +1", -- +8 Skill
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

    sets.midcast["Temporal Shift"] = sets.midcast.BlueMagic.Debuff
    sets.midcast["Temporal Shift"].Enmity = enmity_gear
    sets.midcast["Actinic Burst"] = sets.midcast.BlueMagic.Debuff
    sets.midcast["Actinic Burst"].Enmity = enmity_gear
    sets.midcast.Fantod = sets.midcast.BlueMagic.Static
    sets.midcast.Fantod.Enmity = enmity_gear

    sets.midcast.Phalanx = {
        ammo = "Sapience Orb",
        head = taeon.head.fcphalanx,
        body = taeon.body.fcphalanx,
        hands = taeon.hands.fcphalanx,
        legs = taeon.legs.fcphalanx,
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
        sub = "Bunzi's Rod",
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

    TP_Skill_set = set_combine(sets.TP.Att, sets.midcast.BlueMagic.Skill)

    -- Pieces to switch out when buffs are active
    sets.midcast.mod.Diffusion = {
        feet = "Luhlaza Charuqs +1"
    }

    -- Pieces to switch out when the day/weather matches
    sets.Weather = {
        waist = "Hachirin-no-obi",
        back = "Twilight Cape"
    }

    sets.Distance = {
        waist = "Orpheus's Sash"
    }

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
