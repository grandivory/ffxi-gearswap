include('set-behavior')
include('augments')

lockstyleset = 5
function define_sets()
    Melee_Modes = T {'Swords', 'Aeolian', 'Acc', 'Enspell', 'Odin', 'TH'}
    Idle_Modes = T {'DT', 'Refresh'}
    Magic_Modes = T {'MAB', 'Acc'}
    stances.RDM = S {'Composure'}

    fastcast = .8 -- This defines how much fast cast you have, which is used when canceling spell effects (.8 = 80%)

    af = {
        head = "Atrophy Chapeau +3",
        body = "Atrophy Tabard +3",
        hands = "Atrophy Gloves +3",
        legs = "Atrophy Tights +3",
        feet = "Atrophy Boots +1"
    }

    relic = {
        head = "Viti. Chapeau +3",
        body = "Viti. Tabard +3",
        hands = "Viti. Gloves +3",
        legs = "Viti. Tights +1",
        feet = "Vitiation Boots +3"
    }

    empy = {
        head = "Lethargy Chappel +2",
        body = "Lethargy Sayon +2",
        hands = "Lethargy Gantherots +2",
        legs = "Lethargy Fuseau +2",
        feet = "Lethargy Houseaux +3"
    }

    back = {
        enfws = {
            name = "Sucellos's Cape",
            augments = {'MND+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'MND+10', 'Weapon skill damage +10%',
                        'Phys. dmg. taken-10%'}
        },
        tp = {
            name = "Sucellos's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dual Wield"+10', 'Phys. dmg. taken-10%'}
        },
        mab = {
            name = "Sucellos's Cape",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'INT+10', '"Mag.Atk.Bns."+10', 'Phys. dmg. taken-10%'}
        },
        crit = {
            name = "Sucellos's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'DEX+10', 'Crit.hit rate+10', 'Phys. dmg. taken-10%'}
        },
        rangedws = {
            name = "Sucellos's Cape",
            augments = {'AGI+20', 'Rng.Acc.+20 Rng.Atk.+20', 'AGI+10', 'Weapon skill damage +10%'}
        }
    }

    th_gear = {
        head = chironic.head.th,
        legs = "Volte Hose",
        waist = "Chaac Belt"
    }

    -- =========================================================================================================
    -- ***Not Engaged***
    -- =========================================================================================================

    sets.Idle.Refresh = {
        main = { -- Refresh +2
            name = "Colada",
            augments = {'"Refresh"+2', 'INT+2', 'Mag. Acc.+3', 'DMG:+2'}
        },
        sub = { -- Refresh +2
            name = "Colada",
            augments = {'"Refresh"+2', 'INT+2', 'Mag. Acc.+16', '"Mag.Atk.Bns."+5'}
        },
        ranged = empty,
        ammo = "Homiliary",
        head = relic.head,
        body = jhakri.body,
        hands = malignance.hands,
        legs = carmine.legs,
        feet = malignance.feet,
        neck = "Loricate Torque +1",
        waist = "Fucho-no-obi",
        left_ear = "Sanare Earring",
        right_ear = "Etiolation Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = back.tp
    }

    sets.Idle.DT = set_combine(sets.Idle.Refresh, {
        sub = "Genmei Shield",
        ammo = "Staunch Tathlum +1", -- 3%
        head = malignance.head, -- 6%
        body = malignance.body, -- 9%
        hands = malignance.hands, -- 5%
        legs = carmine.legs, -- zoom zoom
        feet = malignance.feet, -- 4%
        neck = "Loricate Torque +1", -- 6%
        left_ring = "Defending Ring", -- 10%
        back = back.tp -- 10% PDT
    })

    -- =========================================================================================================
    -- ***Engaged Sets***
    -- =========================================================================================================

    sets.TP.Swords = {
        main = "Naegling",
        sub = "Thibron",
        ranged = empty,
        ammo = "Coiste Bodhar",
        head = malignance.head,
        body = malignance.body,
        hands = malignance.hands,
        legs = malignance.legs,
        feet = malignance.feet,
        neck = "Anu Torque",
        waist = kentarch.belt,
        left_ear = "Telos Earring",
        right_ear = "Sherida Earring",
        left_ring = "Chirich Ring +1",
        right_ring = "Chirich Ring +1",
        back = back.tp
    }
    sets.TP.Aeolian = set_combine(sets.TP.Swords, {
        main = malevolence,
        sub = bunzi.rod
    })

    sets.TP.Enspell = {
        main = "Naegling",
        sub = "Thibron",
        ranged = empty,
        ammo = "Coiste Bodhar",
        head = malignance.head,
        body = malignance.body,
        hands = ayanmo.hands,
        legs = malignance.legs,
        feet = malignance.feet,
        neck = "Anu Torque",
        waist = "Orpheus's Sash",
        left_ear = "Telos Earring",
        right_ear = "Sherida Earring",
        left_ring = "Chirich Ring +1",
        right_ring = "Chirich Ring +1",
        back = back.tp
    }
    sets.TP.Enspell.withBuffs = {}
    sets.TP.Enspell.withBuffs.Enstone = set_combine(sets.TP.Enspell, {
        neck = "Quanpur Necklace"
    })

    sets.TP.Odin = set_combine(sets.TP.Enspell, {
        main = "Infiltrator",
        sub = "Esikuva",
        ranged = "Ullr",
        ammo = empty,
        body = ayanmo.body,
        neck = "Dls. Torque +2",
        left_ear = "Eabani Earring",
        right_ring = "Metamorph Ring +1"
    })

    -- =========================================================================================================
    -- ***WS Sets***
    -- =========================================================================================================
    sets.WS.Generic = {
        ranged = empty,
        ammo = "Crepuscular Pebble",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Regal Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Epaminondas's Ring",
        right_ring = "Ilabrat Ring",
        back = back.enfws
    }

    sets.WS.MAB = {
        ranged = empty,
        ammo = "Ghastly Tathlum +1",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Sibyl Scarf",
        waist = "Orpheus's Sash",
        left_ear = "Malignance Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Epaminondas's Ring",
        right_ring = "Freke Ring",
        back = back.enfws
    }

    sets.WS["Savage Blade"] = {
        ranged = empty,
        ammo = "Crepuscular Pebble",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Rep. Plat. Medal",
        waist = "Sailfi Belt +1",
        left_ear = "Regal Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Epaminondas's Ring",
        right_ring = "Metamorph Ring +1",
        back = back.enfws
    }

    sets.WS["Black Halo"] = {
        ranged = empty,
        ammo = "Crepuscular Pebble",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Rep. Plat. Medal",
        waist = "Sailfi Belt +1",
        left_ear = "Regal Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Epaminondas's Ring",
        right_ring = "Metamorph Ring +1",
        back = back.enfws
    }

    sets.WS["Requiescat"] = {
        ranged = empty,
        ammo = "Regal Gem",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Regal Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Epaminondas's Ring",
        right_ring = "Metamor. Ring +1",
        back = back.enfws
    }

    sets.WS["Chant du Cygne"] = {
        ranged = empty,
        ammo = "Yetshila +1",
        head = "Blistering Sallet +1",
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Mache Earring +1",
        right_ear = "Sherida Earring",
        left_ring = "Ilabrat Ring",
        right_ring = "Hetairoi Ring",
        back = back.crit
    }

    sets.WS["Sanguine Blade"] = {
        ranged = empty,
        ammo = "Pemphredo Tathlum",
        head = "Pixie Hairpin +1",
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Sanctity Necklace",
        waist = "Orpheus's Sash",
        left_ear = "Malignance Earring",
        right_ear = "Regal Earring",
        left_ring = "Archon Ring",
        right_ring = "Metamorph Ring +1",
        back = back.enfws
    }

    sets.WS["Red Lotus Blade"] = {
        ranged = empty,
        ammo = "Pemphredo Tathlum",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Sibyl Scarf",
        waist = "Orpheus's Sash",
        left_ear = "Malignance Earring",
        right_ear = "Friomisi Earring",
        left_ring = "Freke Ring",
        right_ring = "Metamorph Ring +1",
        back = back.enfws
    }

    sets.WS["Seraph Blade"] = {
        ranged = empty,
        ammo = "Regal Gem",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Sibyl Scarf",
        waist = "Orpheus's Sash",
        left_ear = "Regal Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Freke Ring",
        right_ring = "Metamorph Ring +1",
        back = back.enfws
    }

    sets.WS["Evisceration"] = {
        ranged = empty,
        ammo = "Yetshila +1",
        head = "Blistering Sallet +1",
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Mache Earring +1",
        right_ear = "Sherida Earring",
        left_ring = "Ilabrat Ring",
        right_ring = "Hetairoi Ring",
        back = back.crit
    }

    sets.WS["Aeolian Edge"] = {
        ranged = empty,
        ammo = "Ghastly Tathlum +1",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Sibyl Scarf",
        waist = "Orpheus's Sash",
        left_ear = "Malignance Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Freke Ring",
        right_ring = "Epaminondas's Ring",
        back = back.enfws
    }
    sets.WS["Aeolian Edge"].TH = set_combine(sets.WS["Aeolian Edge"], th_gear)

    sets.WS['Empyreal Arrow'] = {
        head = nyame.helm,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Marked Gorget",
        waist = "Yemaya Belt",
        left_ear = "Moonshade Earring",
        right_ear = "Telos Earring",
        left_ring = "Epaminondas's Ring",
        right_ring = "Cacoethic Ring +1",
        back = back.rangedws

    }

    -- =========================================================================================================
    -- ***Job Ability sets***
    -- =========================================================================================================

    sets.JA["Chainspell"] = {
        body = relic.body
    }

    -- =========================================================================================================
    -- ***Item Sets***
    -- =========================================================================================================
    sets.item["Holy Water"] = {
        neck = "Nicander's Necklace",
        left_ring = "Purity Ring",
        right_ring = "Blenmot's Ring +1"
    }

    -- ===============================================================================================
    -- ***Precast sets for spells***
    -- ===============================================================================================

    -- RDM needs 42% to cap (38% comes from traits)

    sets.precast.FastCast = {
        head = af.head, -- 16%
        body = relic.body, -- 15%
        hands = "Gendewitha Gages +1", -- 7%
        legs = "Volte Brais", -- 8%
        feet = amalric.feet, -- 6%
        neck = "Orunmila's Torque", -- 5%
        waist = "Embla Sash", -- 5%
        left_ear = "Malignance Earring", -- 4%
        right_ear = "Etiolation Earring", -- 2%
        left_ring = "Rahab Ring", -- 2%
        right_ring = "Kishar Ring", -- 4%
        back = "Fi Follet Cape +1" -- 10%
    }

    sets.precast.Impact = set_combine(sets.precast.FastCast, {
        body = "Crepuscular Cloak"
    })

    sets.precast.Dispelga = set_combine(sets.precast.FastCast, {
        main = "Daybreak",
        sub = "Ammurapi Shield"
    })

    -- ==========================================================================================================
    -- *** Midcast sets for spells ***
    -- ==========================================================================================================

    -- 71% Potency, 11% Potency II
    sets.midcast.Cur = {
        main = "Chatoyant Staff", -- +10%
        sub = "Enki Strap",
        ranged = empty,
        ammo = "Regal Gem",
        head = "Vanya Hood", -- +17%
        body = kaykaus.body, -- II +4%
        hands = kaykaus.hands, -- +11% II +4% (from the set bonus)
        legs = af.legs, -- 11~12%
        feet = kaykaus.feet, -- 17% II +2%
        neck = "Incanter's Torque",
        waist = "Luminary Sash",
        left_ear = "Mendi. Earring", -- 5%
        right_ear = "Etiolation Earring",
        left_ring = "Naji's Loop", -- II +1%
        right_ring = "Haoma's Ring",
        back = back.enfws
    }
    sets.midcast.Cursna = set_combine(sets.midcast.Cur, {
        main = "Daybreak",
        sub = "Genmei Shield",
        neck = "Debilis Medallion",
        ring1 = "Haoma's Ring",
        ring2 = "Haoma's Ring",
        back = "Oretan. Cape +1"
    })

    sets.midcast.Enfeebling = {
        main = "Contemplator +1",
        sub = "Enki Strap",
        ranged = "Ullr",
        ammo = empty,
        head = relic.head,
        body = af.body,
        hands = "Regal Cuffs",
        legs = chironic.legs.maccdrain,
        feet = relic.feet,
        neck = "Dls. Torque +2",
        waist = "Obstinate Sash",
        left_ear = "Regal Earring",
        right_ear = "Snotra Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Kishar Ring",
        back = back.enfws
    }
    sets.midcast.EnfeeblingAcc = {
        main = "Contemplator +1",
        sub = "Enki Strap",
        ranged = "Ullr",
        ammo = empty,
        head = relic.head,
        body = af.body,
        hands = kaykaus.hands,
        legs = chironic.legs.maccdrain,
        feet = relic.feet,
        neck = "Dls. Torque +2",
        waist = "Obstinate Sash",
        left_ear = "Regal Earring",
        right_ear = "Digni. Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Metamorph Ring +1",
        back = back.enfws
    }
    sets.midcast.EnfeeblingMND = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        ranged = empty,
        ammo = "Regal Gem",
        head = relic.head,
        body = af.body,
        hands = "Regal Cuffs",
        legs = chironic.legs.maccdrain,
        feet = relic.feet,
        neck = "Dls. Torque +2",
        waist = "Luminary Sash",
        left_ear = "Regal Earring",
        right_ear = "Snotra Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Metamorph Ring +1",
        back = back.enfws
    }
    sets.midcast.EnfeeblingINT = {
        main = bunzi.rod,
        sub = "Ammurapi Shield",
        ranged = empty,
        ammo = "Regal Gem",
        head = relic.head,
        body = af.body,
        hands = "Regal Cuffs",
        legs = chironic.legs.maccdrain,
        feet = relic.feet,
        neck = "Dls. Torque +2",
        waist = "Obstinate Sash",
        left_ear = "Regal Earring",
        right_ear = "Snotra Earring",
        left_ring = "Kishar Ring",
        right_ring = "Metamorph Ring +1",
        back = back.enfws
    }

    sets.midcast.Enfeebling.withBuffs = {}
    sets.midcast.Enfeebling.withBuffs.Saboteur = set_combine(sets.midcast.Enfeebling, {
        hands = empy.hands
    })
    sets.midcast.EnfeeblingAcc.withBuffs = {}
    sets.midcast.EnfeeblingAcc.withBuffs.Saboteur = set_combine(sets.midcast.EnfeeblingAcc, {
        hands = empy.hands
    })
    sets.midcast.EnfeeblingMND.withBuffs = {}
    sets.midcast.EnfeeblingMND.withBuffs.Saboteur = set_combine(sets.midcast.EnfeeblingMND, {
        hands = empy.hands
    })
    sets.midcast.EnfeeblingINT.withBuffs = {}
    sets.midcast.EnfeeblingINT.withBuffs.Saboteur = set_combine(sets.midcast.EnfeeblingINT, {
        hands = empy.hands
    })

    sets.midcast.Dispelga = set_combine(sets.midcast.EnfeeblingINT, {
        main = "Daybreak",
        sub = "Ammurapi Shield"
    })

    sets.midcast.Impact = set_combine(sets.midcast.EnfeeblingAcc, {
        body = "Crepuscular Cloak",
        hands = "Regal Cuffs"
    })
    sets.midcast.Dia = set_combine(sets.midcast.Enfeebling, th_gear)
    sets.midcast.Dispel = set_combine(sets.midcast.Enfeebling, {
        neck = "Dls. Torque +2"
    })
    sets.midcast.Inundation = set_combine(sets.midcast.Enfeebling, th_gear)

    sets.midcast.Enhancing = {
        main = "Pukulatmuj +1",
        sub = "Forfend +1",
        ranged = empty,
        ammo = "Homiliary",
        head = "Befouled Crown",
        body = relic.body,
        hands = relic.gloves,
        legs = af.legs,
        feet = empy.feet,
        neck = "Incanter's Torque",
        waist = "Olympus Sash",
        left_ear = "Andoaa Earring",
        right_ear = "Mimir Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = "Ghostfyre Cape"
    }

    sets.midcast.EnhancingDuration = set_combine(sets.midcast.Enhancing, {
        main = {
            name = "Colada",
            augments = {'Enh. Mag. eff. dur. +4', 'DMG:+8'}
        },
        sub = "Ammurapi Shield",
        ranged = empty,
        ammo = "Sapience Orb",
        head = empy.head,
        body = empy.body,
        hands = af.hands,
        legs = empy.legs,
        feet = empy.feet,
        neck = "Dls. Torque +2",
        waist = "Embla Sash",
        left_ear = "Loquac. Earring",
        right_ear = "Etiolation Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = "Ghostfyre Cape"
    })

    sets.midcast.EnhancingDurationSelf = set_combine(sets.midcast.Enhancing, {
        main = {
            name = "Colada",
            augments = {'Enh. Mag. eff. dur. +4', 'DMG:+8'}
        },
        sub = "Ammurapi Shield",
        head = telchine.head.enhfc,
        body = relic.body,
        hands = af.hands,
        legs = telchine.legs.enhfc,
        feet = empy.feet,
        neck = "Dls. Torque +2",
        waist = "Embla Sash",
        left_ear = "Loquac. Earring",
        right_ear = "Etiolation Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = "Ghostfyre Cape"
    })

    sets.midcast.Gain = set_combine(sets.midcast.Ehnancing, {
        hands = relic.hands
    })
    sets.midcast.Stoneskin = set_combine(sets.midcast.Enhancing, {
        -- neck = "Nodens Gorget",
        waist = "Siegel Sash"
    })
    sets.midcast.Aquaveil = set_combine(sets.midcast.Enhancing, {
        head = amalric.head,
        hands = "Regal Cuffs"
    })

    sets.midcast.Refresh = set_combine(sets.midcast.EnhancingDuration, {
        head = amalric.head,
        body = af.body,
        legs = empy.legs
    })
    sets.midcast.PhalanxSelf = set_combine(sets.midcast.EnhancingDuration, {
        main = sakpata.sword,
        sub = "Ammurapi Shield",
        head = taeon.head.fcphalanx,
        body = taeon.body.fcphalanx,
        hands = taeon.hands.fcphalanx,
        legs = taeon.legs.fcphalanx,
        feet = taeon.feet.fcphalanx,
        left_ear = "Andoaa Earring"
    })
    sets.midcast.Regen = set_combine(sets.midcast.EnhancingDuration, {
        main = "Bolelabunga",
        sub = "Ammurapi Shield"
    })

    sets.midcast.Elemental = {
        main = bunzi.rod,
        sub = "Daybreak",
        -- sub = "Ammurapi Shield",
        ranged = empty,
        ammo = "Pemphredo Tathlum",
        head = "Cath Palug Crown",
        body = amalric.body,
        hands = jhakri.hands,
        legs = amalric.legs,
        feet = amalric.feet,
        neck = "Sibyl Scarf",
        waist = "Sacro Cord",
        left_ear = "Regal Earring",
        right_ear = "Malignance Earring",
        left_ring = "Freke Ring",
        right_ring = "Metamorph Ring +1",
        back = back.mab
    }
    sets.midcast.ElementalMB = set_combine(sets.midcast.Elemental, {
        head = ea.head,
        body = ea.body,
        hands = amalric.hands,
        legs = ea.legs,
        neck = "Mizu. Kubikazari",
        right_ring = "Mujin Band"
    })
    sets.midcast.ElementalMB.Acc = set_combine(sets.midcast.ElementalMB, {
        hands = bunzi.hands
    })
    sets.midcast.Stone = set_combine(sets.midcast.Elemental, {
        neck = "Quanpur Necklace"
    })
    sets.midcast.StoneMB = set_combine(sets.midcast.ElementalMB, {
        neck = "Quanpur Necklace"
    })

    sets.midcast.DarkMagic = {
        main = "Rubicundity",
        sub = "Ammurapi Shield",
        ranged = "Ullr",
        ammo = empty,
        head = "Pixie Hairpin +1",
        body = amalric.body,
        hands = jhakri.hands,
        legs = chironic.legs.maccdrain,
        feet = amalric.feet,
        neck = "Erra Pendant",
        waist = "Fucho-no-obi",
        left_ear = "Malignance Earring",
        -- left_ear = "Hirudinea Earring",
        right_ear = "Mani Earring",
        left_ring = "Evanescence Ring",
        right_ring = "Archon Ring"
    }

    -- ==========================================================================================================
    -- Distance Gear
    -- ==========================================================================================================

    sets.Distance = {
        waist = "Orpheus's Sash"
    }

    -- ==========================================================================================================
    -- ***Pieces to switch out when the day/weather matches***
    -- ==========================================================================================================
    sets.Weather = {
        waist = "Hachirin-no-obi"
    }
end

function mod_midcast(spell, set)
    acc_enfeebles = S {"Addle", "Distract", "Distract II", "Frazzle", "Frazzle II", "Paralyze", "Silence", "Slow"}
    if acc_enfeebles:contains(spell.name) then
        return sets.midcast.EnfeeblingAcc
    end

    return set
end
