include('set-behavior')
include('organizer-lib')
include('augments')

lockstyleset = 10

function define_sets()
    Melee_Modes = T {'Att', 'DT', 'TH', 'DT1H'}
    Idle_Modes = T {'Speed', 'DT', 'Refresh', 'Evasion'}
    Magic_Modes = T {'G.Horn', 'Harp', 'TH', 'Enmity'}

    fastcast = .75 -- This defines how much fast cast you have, which is used when canceling spell effects (.8 = 80%)

    back = {
        tp = {
            name = "Intarabus's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'DEX+10', '"Dual Wield"+10', 'Phys. dmg. taken-10%'}
        },
        strws = {
            name = "Intarabus's Cape",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        },
        chrws = {
            name = "Intarabus's Cape",
            augments = {'CHR+20', 'Accuracy+20 Attack+20', 'CHR+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        },
        maccfc = {
            name = "Intarabus's Cape",
            augments = {'CHR+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Mag. Acc.+10', '"Fast Cast"+10', 'Damage taken-5%'}
        },
        eva = {
            name = "Intarabus's Cape",
            augments = {'AGI+20', 'Eva.+20 /Mag. Eva.+20', 'Evasion+10', 'Enmity+10', 'Evasion+15'}
        }
    }

    linos = {
        tp = {
            name = "Linos",
            augments = {'Accuracy+20', '"Store TP"+4', 'Quadruple Attack +3'}
        },
        strws = {
            name = "Linos",
            augments = {'Accuracy+15 Attack+15', 'Weapon skill damage +3%', 'STR+8'}
        },
        dexws = {
            name = "Linos",
            augments = {'Accuracy+14 Attack+14', 'Weapon skill damage +3%', 'DEX+8'}
        },
        chrws = {
            name = "Linos",
            augments = {'Accuracy+14 Attack+14', 'Weapon skill damage +3%', 'CHR+8'}
        }
    }

    tpdagger = "Centovente"

    th_gear = {
        head = chironic.head.th,
        legs = "Volte Hose",
        waist = "Chaac Belt"
    }

    enmity_gear = {
        main = "Mafic Cudgel",
        sub = "Genmei Shield",
        ammo = "Sapience Orb",
        head = "Halitus Helm",
        body = "Emet Harness +1",
        legs = "Zoar Subligar +1",
        neck = "Unmoving Collar +1",
        waist = "Kasiri Belt",
        left_ear = "Friomisi Earring",
        right_ear = "Trux Earring",
        left_ring = "Supershear Ring",
        right_ring = "Eihwaz Ring",
        back = back.eva
    }

    af = {
        head = "Brioso Roundlet +3",
        body = "Brioso Justau. +3",
        hands = "Brioso Cuffs +3",
        legs = "Brioso Cannions +3",
        feet = "Brioso Slippers +3"
    }

    relic = {
        head = "Bihu Roundlet +3",
        body = "Bihu Jstcorps. +3",
        hands = "Bihu Cuffs +1",
        legs = "Bihu Cannions +1",
        feet = "Bihu Slippers +1"
    }

    empy = {
        head = "Fili Calot +2",
        body = "Fili Hongreline +2",
        hands = "Fili Manchettes +2",
        legs = "Fili Rhingrave +2",
        feet = "Fili Cothurnes +2"
    }

    -- =========================================================================================================
    -- ***Not Engaged Sets***
    -- =========================================================================================================
    sets.Idle.DT = { -- 67% PDT, 50% MDT
        sub = "Genmei Shield", -- 10% PDT
        head = empy.head, -- 10%
        body = bunzi.body, -- 10%
        hands = empy.hands, -- 10%
        legs = "Assid. Pants +1",
        feet = nyame.feet, -- 7%
        neck = "Warder's Charm +1", -- Elemental resistance, occasionally absorb spells
        waist = "Slipor Sash", -- 3% MDT
        left_ear = "Mendi. Earring",
        right_ear = "Etiolation Earring",
        left_ring = "Defending Ring", -- 10%
        right_ring = "Kunaji Ring",
        back = back.tp -- 10% PDT
    }
    sets.Idle.Speed = set_combine(sets.Idle.DT, {
        feet = empy.feet
    })
    sets.Idle.Refresh = set_combine(sets.Idle.DT, {
        main = {
            name = "Contemplator +1",
            augments = {'Path: A'}
        },
        sub = "Oneiros Grip",
        right_ring = "Stikini Ring +1"
    })
    sets.Idle.Evasion = {
        main = "Nibiru Knife",
        -- sub = "Nibiru Knife",
        sub = "Genmei Shield",
        ammo = "Amar Cluster",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Bathy Choker +1",
        waist = "Kasiri Belt",
        left_ear = "Eabani Earring",
        right_ear = "Infused Earring",
        left_ring = "Gelatinous Ring +1",
        right_ring = "Vengeful Ring",
        back = back.eva
    }
    -- =========================================================================================================
    -- ***Engaged Sets***
    -- =========================================================================================================
    sets.TP.Att = {
        main = "Naegling",
        sub = tpdagger,
        range = linos.tp,
        head = bunzi.head,
        body = "Ashera Harness",
        hands = bunzi.hands,
        legs = telchine.legs.att,
        feet = nyame.feet,
        neck = "Bard's Charm +2",
        waist = "Sailfi Belt +1",
        left_ear = "Telos Earring",
        right_ear = "Cessance Earring",
        left_ring = "Chirich Ring +1",
        right_ring = "Chirich Ring +1",
        back = back.tp
    }
    sets.TP.DT = {
        main = "Naegling",
        sub = tpdagger,
        range = linos.tp,
        head = bunzi.head, -- 7%
        body = "Ashera Harness", -- 7%
        hands = bunzi.hands, -- 8%
        legs = nyame.legs, -- 8%
        feet = nyame.feet, -- 7%
        neck = "Bard's Charm +2",
        waist = "Sailfi Belt +1",
        left_ear = "Telos Earring",
        right_ear = "Cessance Earring",
        left_ring = "Moonlight Ring", -- 5%
        right_ring = "Chirich Ring +1",
        back = back.tp -- 10% PDT
    }
    sets.TP.DT1H = {
        main = "Naegling",
        -- main = "Twashtar",
        sub = "Genmei Shield",
        range = linos.tp,
        head = bunzi.head,
        body = "Ashera Harness",
        hands = bunzi.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Bard's Charm +2",
        waist = "Sailfi Belt +1",
        left_ear = "Telos Earring",
        right_ear = "Cessance Earring",
        left_ring = "Moonlight Ring",
        right_ring = "Chirich Ring +1",
        back = back.tp
    }
    sets.TP.TH = set_combine(sets.TP.Att, th_gear)

    -- =========================================================================================================
    -- ***Weapon Skill Sets***
    -- =========================================================================================================
    sets.WS.Generic = {
        range = linos.strws,
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Bard's Charm +2",
        waist = "Sailfi Belt +1",
        left_ear = "Moonshade Earring",
        right_ear = "Ishvara Earring",
        left_ring = "Ilabrat Ring",
        right_ring = "Epaminondas's Ring",
        back = back.strws
    }
    sets.WS.MAB = {
        range = linos.strws,
        head = nyame.head,
        body = nyame.body,
        hands = bunzi.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Sibyl Scarf",
        waist = "Eschan Stone",
        left_ear = "Regal Earring",
        right_ear = "Friomisi Earring",
        left_ring = "Metamor. Ring +1",
        right_ring = "Shiva Ring +1",
        back = back.strws
    }
    sets.WS["Savage Blade"] = {
        range = linos.strws,
        head = nyame.head,
        body = relic.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Bard's Charm +2",
        waist = "Sailfi Belt +1",
        left_ear = "Moonshade Earring",
        right_ear = "Ishvara Earring",
        left_ring = "Metamor. Ring +1",
        right_ring = "Epaminondas's Ring",
        back = back.strws
    }
    sets.WS["Rudra's Storm"] = {
        range = linos.dexws,
        head = nyame.head,
        body = relic.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Bard's Charm +2",
        waist = kentarch.belt,
        left_ear = "Moonshade Earring",
        right_ear = "Mache Earring +1",
        left_ring = "Epaminondas's Ring",
        right_ring = "Ilabrat Ring",
        back = back.strws
    }
    sets.WS["Mordant Rime"] = {
        range = linos.chrws,
        head = nyame.head,
        body = relic.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Bard's Charm +2",
        waist = kentarch.belt,
        left_ear = "Regal Earring",
        right_ear = "Ishvara Earring",
        left_ring = "Metamor. Ring +1",
        right_ring = "Epaminondas's Ring",
        back = back.chrws
    }
    sets.WS.Evisceration = {
        range = linos.dexws,
        head = "Blistering Sallet +1",
        body = ayanmo.body,
        hands = bunzi.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Moonshade Earring",
        right_ear = "Brutal Earring",
        left_ring = "Hetairoi Ring",
        right_ring = "Begrudging Ring",
        back.tp
    }
    -- sets.WS.Evisceration.DT1H = {
    --     head = ayanmo.head,
    --     body = ayanmo.body,
    --     hands = bunzi.hands,
    --     legs = ayanmo.legs,
    --     feet = ayanmo.feet,
    --     neck = "Bard's Charm +2",
    --     waist = "Reiki Yotai",
    --     left_ear = "Telos Earring",
    --     right_ear = "Cessance Earring",
    --     left_ring = "Defending Ring",
    --     right_ring = "Chirich Ring +1",
    --     back = back.tp
    -- }

    -- =========================================================================================================
    -- ***Job Ability Sets***
    -- =========================================================================================================
    sets.JA.Troubadour = {
        body = relic.body
    }
    sets.JA['Soul Voice'] = {
        legs = relic.legs
    }
    sets.JA.Nightingale = {
        feet = relic.feet
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
    sets.precast.FastCast = { -- 75%
        head = bunzi.head, -- 10%
        body = inyanga.body, -- 14%
        hands = "Leyline Gloves", -- 8%
        legs = "Volte Brais", -- 8%
        feet = telchine.feet.enhfc, -- 5%
        neck = "Orunmila's Torque", -- 5%
        waist = "Embla Sash", -- 5%
        left_ear = "Enchntr. Earring +1", -- 2%
        right_ear = "Loquac. Earring", -- 2%
        left_ring = "Rahab Ring", -- 2%
        right_ring = "Kishar Ring", -- 4%
        back = back.maccfc -- 10%

    }
    sets.precast.BardSong = set_combine(sets.precast.FastCast, { -- 86%
        range = "Gjallarhorn",
        head = empy.head -- 15%, +5
        -- feet have an extra -6% song spellcasting time
    })
    sets.precast.BardSong['Harp'] = set_combine(sets.precast.BardSong, {
        range = "Daurdabla"
    })
    sets.precast.Mazurka = set_combine(sets.precast.BardSong, {
        range = "Marsyas"
    })
    sets.precast['Honor March'] = set_combine(sets.precast.BardSong, {
        range = "Marsyas"
    })
    sets.precast.Pianissimo = {}
    sets.precast.Pianissimo.Enmity = enmity_gear
    sets.precast.Tenuto = {}
    sets.precast.Tenuto.Enmity = enmity_gear

    -- =========================================================================================================
    -- ***Midcast Sets for Spells***
    -- =========================================================================================================
    sets.midcast.Cur = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        head = bunzi.head,
        body = kaykaus.body,
        hands = inyanga.hands,
        legs = vanya.legs,
        feet = vanya.feet,
        neck = "Incanter's Torque",
        waist = "Luminary Sash",
        left_ear = "Mendi. Earring",
        right_ear = "Meili Earring",
        left_ring = "Menelaus's Ring",
        right_ring = "Stikini Ring +1",
        back = "Aurist's Cape +1"
    }
    sets.midcast.CureSelf = set_combine(sets.midcast.Cur, {
        neck = "Phalaina Locket",
        waist = "Gishdubar Sash"
    })
    sets.midcast.Healing = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        head = vanya.head,
        body = bunzi.body,
        hands = "Hieros Mittens",
        legs = vanya.legs,
        feet = vanya.feet,
        neck = "Incanter's Torque",
        waist = "Luminary Sash",
        left_ear = "Mendi. Earring",
        right_ear = "Meili Earring",
        left_ring = "Haoma's Ring",
        right_ring = "Haoma's Ring",
        back = back.maccfc
    }
    sets.midcast.Cursna = set_combine(sets.midcast.Healing, {
        neck = "Debilis Medallion"
    })

    sets.midcast.Enhancing = {
        main = "Pukulatmuj +1",
        sub = "Ammurapi Shield",
        head = telchine.head.enhfc,
        body = telchine.body.enhfc,
        hands = inyanga.hands,
        legs = telchine.legs.enhfc,
        feet = telchine.feet.enhfc,
        neck = "Incanter's Torque",
        waist = "Olympus Sash",
        left_ear = "Andoaa Earring",
        right_ear = "Mimir Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = "Fi Follet Cape +1"
    }
    sets.midcast.EnhancingDuration = set_combine(sets.midcast.Enhancing, {
        hands = telchine.hands.enhfc,
        waist = "Embla Sash"
    })
    sets.midcast.Stoneskin = set_combine(sets.midcast.Enhancing, {
        waist = "Siegel Sash"
    })

    sets.midcast.Enfeebling = {
        main = "Carnwenhan",
        sub = "Ammurapi Shield",
        head = af.head,
        body = af.body,
        hands = inyanga.hands,
        legs = af.legs,
        feet = af.feet,
        neck = "Incanter's Torque",
        waist = "Acuity Belt +1",
        left_ear = "Regal Earring",
        right_ear = "Digni. Earring",
        left_ring = "Metamor. Ring +1",
        right_ring = "Stikini Ring +1",
        back = back.maccfc
    }

    sets.midcast.Songs.Buff = {
        main = "Carnwenhan",
        sub = "Kali",
        head = empy.head,
        body = empy.body,
        hands = empy.hands,
        legs = inyanga.legs,
        feet = af.feet,
        neck = "Mnbw. Whistle +1",
        right_ear = "Etiolation Earring",
        left_ring = "Defending Ring",
        right_ring = "Gelatinous Ring +1",
        waist = "Flume Belt +1",
        back = back.maccfc
    }
    sets.midcast.Paeon = set_combine(sets.midcast.Songs.Buff, {
        head = af.head
    })
    sets.midcast.Madrigal = set_combine(sets.midcast.Songs.Buff, {
        head = empy.head
    })
    sets.midcast.Minuet = set_combine(sets.midcast.Songs.Buff, {
        body = empy.body
    })
    sets.midcast.March = set_combine(sets.midcast.Songs.Buff, {
        hands = empy.hands
    })
    sets.midcast.Ballad = set_combine(sets.midcast.Songs.Buff, {
        legs = empy.legs
    })
    sets.midcast.Scherzo = set_combine(sets.midcast.Songs.Buff, {
        feet = empy.feet
    })
    sets.midcast.Etude = set_combine(sets.midcast.Songs.Buff, {
        head = mousai.head
    })
    sets.midcast.Minne = set_combine(sets.midcast.Songs.Buff, {
        legs = mousai.legs
    })
    sets.midcast.Carol = set_combine(sets.midcast.Songs.Buff, {
        hands = mousai.hands
    })
    sets.midcast.Mambo = set_combine(sets.midcast.Songs.Buff, {
        feet = mousai.feet
    })

    sets.midcast.Songs.Debuff = set_combine(sets.midcast.Enfeebling, {
        main = "Carnwenhan",
        sub = "Ammurapi Shield",
        range = "Gjallarhorn",
        neck = "Mnbw. Whistle +1",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1"
    })
    sets.midcast.Threnody = set_combine(sets.midcast.Songs.Debuff, {
        body = mousai.body
    })
    sets.midcast['Foe Lullaby'] = set_combine(sets.midcast.Songs.Debuff, {
        body = empy.body,
        hands = af.hands,
        legs = inyanga.legs
    })
    sets.midcast['Foe Lullaby'].TH = set_combine(sets.midcast['Foe Lullaby'], th_gear)
    sets.midcast['Foe Lullaby'].Enmity = set_combine(sets.midcast['Foe Lullaby'], enmity_gear, {
        ammo = empty
    })
    sets.midcast['Horde Lullaby'] = set_combine(sets.midcast['Foe Lullaby'], {
        range = "Daurdabla",
        body = af.body
    })
    sets.midcast['Horde Lullaby'].TH = set_combine(sets.midcast['Horde Lullaby'], th_gear)
    sets.midcast['Horde Lullaby'].Enmity = set_combine(sets.midcast['Horde Lullaby'], enmity_gear, {
        ammo = empty
    })

    -- =========================================================================================================
    -- ***Weather Gear***
    -- =========================================================================================================
    sets.Weather = {
        waist = "Hachirin-no-obi",
        back = "Twilight Cape"
    }

    sets.Distance = {
        waist = "Orpheus's Sash"
    }

end
