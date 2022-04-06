include('set-behavior')
include('organizer-lib')
include('augments')

lockstyleset = 10

function define_sets()
    Melee_Modes = T {'Att', 'DT', 'TH', 'DT1H'}
    Idle_Modes = T {'Speed', 'DT', 'Refresh', 'Evasion'}
    Magic_Modes = T {'G.Horn', 'Harp', 'TH', 'Enmity'}

    fastcast = .71 -- This defines how much fast cast you have, which is used when canceling spell effects (.8 = 80%)

    back = {
        tp = {
            name = "Intarabus's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'DEX+10', '"Store TP"+10', 'Phys. dmg. taken-10%'}
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
            augments = {'Accuracy+14 Attack+14', 'Weapon skill damage +3%', 'STR+8'}
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
        right_ear = "Cryptic Earring",
        left_ring = "Supershear Ring",
        right_ring = "Eihwaz Ring",
        back = back.eva
    }

    -- =========================================================================================================
    -- ***Not Engaged Sets***
    -- =========================================================================================================
    sets.Idle.DT = {
        sub = "Genmei Shield",
        head = "Bunzi's Hat",
        body = bunzi.body,
        hands = bunzi.hands,
        legs = "Assid. Pants +1",
        feet = nyame.feet,
        neck = "Loricate Torque +1",
        waist = "Slipor Sash",
        left_ear = "Etiolation Earring",
        right_ear = "Mendi. Earring",
        left_ring = "Defending Ring",
        right_ring = "Kunaji Ring",
        back = back.tp
    }
    sets.Idle.Speed = set_combine(sets.Idle.DT, {
        feet = "Fili Cothurnes +1"
    })
    sets.Idle.Refresh = set_combine(sets.Idle.DT, {
        main = {
            name = "Contemplator +1",
            augments = {'Path: A'}
        },
        sub = "Oneiros Grip",
        right_ring = "Stikini Ring +1"
    })
    sets.Idle.RP = set_combine(sets.Idle.Speed, {
        neck = "Bard's Charm +2"
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
        head = "Bunzi's Hat",
        body = ayanmo.body,
        hands = bunzi.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Bard's Charm +2",
        waist = "Reiki Yotai",
        left_ear = "Telos Earring",
        right_ear = "Eabani Earring",
        left_ring = "Chirich Ring +1",
        right_ring = "Chirich Ring +1",
        back = back.tp
    }
    sets.TP.DT = {
        main = "Naegling",
        sub = tpdagger,
        range = linos.tp,
        head = "Bunzi's Hat",
        body = ayanmo.body,
        hands = bunzi.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Bard's Charm +2",
        waist = "Reiki Yotai",
        left_ear = "Telos Earring",
        right_ear = "Eabani Earring",
        left_ring = "Defending Ring",
        right_ring = "Chirich Ring +1",
        back = back.tp
    }
    sets.TP.DT1H = {
        main = "Naegling",
        sub = "Genmei Shield",
        range = linos.tp,
        head = "Bunzi's Hat",
        body = ayanmo.body,
        hands = bunzi.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Bard's Charm +2",
        waist = "Windbuffet Belt +1",
        left_ear = "Telos Earring",
        right_ear = "Cessance Earring",
        left_ring = "Chirich Ring +1",
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
        range = linos.strws,
        head = nyame.head,
        body = nyame.body,
        hands = bunzi.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Baetyl Pendant",
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
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Bard's Charm +2",
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
    sets.WS["Rudra's Storm"] = {
        range = linos.dexws,
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = "Lustr. Subligar +1",
        feet = "Lustra. Leggings +1",
        neck = "Bard's Charm +2",
        waist = "Grunfeld Rope",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Ishvara Earring",
        left_ring = "Epaminondas's Ring",
        right_ring = "Ilabrat Ring",
        back = back.strws
    }
    sets.WS["Mordant Rime"] = {
        range = linos.chrws,
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Bard's Charm +2",
        waist = "Grunfeld Rope",
        left_ear = "Regal Earring",
        right_ear = "Ishvara Earring",
        left_ring = "Metamor. Ring +1",
        right_ring = "Epaminondas's Ring",
        back = back.chrws
    }
    sets.WS.Evisceration = {
        range = linos.dexws,
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = "Lustr. Subligar +1",
        feet = "Lustra. Leggings +1",
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Brutal Earring",
        left_ring = "Ilabrat Ring",
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
        body = "Bihu Jstcorps. +3"
    }
    sets.JA['Soul Voice'] = {
        legs = "Bihu Cannions +1"
    }
    sets.JA.Nightingale = {
        feet = "Bihu Slippers +1"
    }

    -- =========================================================================================================
    -- ***Precast Sets for Spells***
    -- =========================================================================================================
    sets.precast.FastCast = { -- 71%
        -- main = "Kali", -- 7%
        -- sub = "Genmei Shield",
        head = "Bunzi's Hat", -- 10%
        body = inyanga.body, -- 14%
        hands = "Leyline Gloves", -- 7%
        legs = "Volte Brais", -- 5%
        feet = telchine.feet.enhfc, -- 5%
        neck = "Orunmila's Torque", -- 5%
        waist = "Embla Sash", -- 5%
        left_ear = "Enchntr. Earring +1", -- 2%
        right_ear = "Loquac. Earring", -- 2%
        left_ring = "Rahab Ring", -- 2%
        right_ring = "Kishar Ring", -- 4%
        back = back.maccfc -- 10%

    }
    sets.precast.BardSong = set_combine(sets.precast.FastCast, { -- 81%
        range = "Gjallarhorn",
        head = "Fili Calot +1" -- 14%, +4
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
        head = "Bunzi's Hat",
        body = bunzi.body,
        legs = bunzi.legs,
        feet = nyame.feet, -- 7% DT
        neck = "Incanter's Torque",
        waist = "Luminary Sash",
        left_ear = "Mendi. Earring",
        right_ear = "Meili Earring",
        left_ring = "Haoma's Ring",
        right_ring = "Haoma's Ring",
        back = "Aurist's Cape +1"
    }
    sets.midcast.CureSelf = set_combine(sets.midcast.Cur, {
        neck = "Phalaina Locket",
        waist = "Gishdubar Sash"
    })
    sets.midcast.Healing = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        head = "Bunzi's Hat",
        body = bunzi.body,
        legs = bunzi.legs,
        feet = nyame.feet, -- 7% DT
        neck = "Incanter's Torque",
        waist = "Luminary Sash",
        left_ear = "Mendi. Earring",
        right_ear = "Meili Earring",
        left_ring = "Haoma's Ring",
        right_ring = "Haoma's Ring",
        back = back.maccfc
    }
    sets.midcast.Enhancing = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        head = telchine.head.enhfc,
        body = telchine.body.enhfc,
        hands = "Inyan. Dastanas +2",
        legs = telchine.legs.enhfc,
        feet = telchine.feet.enhfc,
        neck = "Incanter's Torque",
        waist = "Embla Sash",
        left_ear = "Andoaa Earring",
        right_ear = "Etiolation Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = "Fi Follet Cape +1"
    }
    sets.midcast.EnhancingDuration = set_combine(sets.midcast.Enhancing, {
        hands = telchine.hands.enhfc
    })
    sets.midcast.Stoneskin = set_combine(sets.midcast.Enhancing, {
        waist = "Siegel Sash"
    })

    sets.midcast.Enfeebling = {
        main = "Carnwenhan",
        sub = "Ammurapi Shield",
        head = "Brioso Roundlet +3",
        body = "Brioso Justau. +3",
        hands = "Inyan. Dastanas +2",
        legs = "Brioso Cannions +3",
        feet = "Brioso Slippers +3",
        neck = "Incanter's Torque",
        waist = "Acuity Belt +1",
        left_ear = "Enchntr. Earring +1",
        right_ear = "Digni. Earring",
        left_ring = "Metamor. Ring +1",
        right_ring = "Stikini Ring +1",
        back = back.maccfc
    }

    sets.midcast.Songs.Buff = {
        main = "Carnwenhan",
        sub = "Kali",
        head = "Fili Calot +1",
        body = "Fili Hongreline +1",
        hands = "Fili Manchettes +1",
        legs = inyanga.legs,
        feet = "Brioso Slippers +3",
        neck = "Mnbw. Whistle +1",
        right_ear = "Etiolation Earring",
        left_ring = "Defending Ring",
        right_ring = "Kunaji Ring",
        waist = "Flume Belt +1"
    }
    sets.midcast.Paeon = set_combine(sets.midcast.Songs.Buff, {
        head = "Brioso Roundlet +3"
    })
    sets.midcast.Madrigal = set_combine(sets.midcast.Songs.Buff, {
        head = "Fili Calot +1"
    })
    sets.midcast.Minuet = set_combine(sets.midcast.Songs.Buff, {
        body = "Fili Hongreline +1"
    })
    sets.midcast.March = set_combine(sets.midcast.Songs.Buff, {
        head = "Fili Manchettes +1"
    })
    sets.midcast.Ballad = set_combine(sets.midcast.Songs.Buff, {
        legs = "Fili Rhingrave +1"
    })
    sets.midcast.Scherzo = set_combine(sets.midcast.Songs.Buff, {
        feet = "Fili Cothurnes +1"
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
        body = "Fili Hongreline +1",
        hands = "Brioso Cuffs +3",
        legs = inyanga.legs
    })
    sets.midcast['Foe Lullaby'].TH = set_combine(sets.midcast['Foe Lullaby'], th_gear)
    sets.midcast['Foe Lullaby'].Enmity = set_combine(sets.midcast['Foe Lullaby'], enmity_gear, {
        ammo = empty
    })
    sets.midcast['Horde Lullaby'] = set_combine(sets.midcast['Foe Lullaby'], {
        range = "Blurred Harp +1"
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

    -- =========================================================================================================
    -- ***Items to Keep***
    -- =========================================================================================================
    organizer_items = {
        -- Medicines
        echodrops = "Echo Drops",

        -- Food
        attfood = "Red Curry Bun",
        accfood = "Sublime Sushi",
        accfoodHQ = "Sublime Sushi +1",
        petfood = "Grape Daifuku +1",
        craftfood = "Coconut Rusk",
        fishfood = "Fisherman's Feast",
        magicfood = "Tropical Crepe",

        -- Seals
        bseals = "Beastmen's Seal",
        kseals = "Kindred's Seal",
        kcrests = "Kindred's Crest",
        hkcrests = "High Kindred's Crest",
        skcrest = "Sacred Kindred's Crest",

        -- Exp Rings
        caliber_ring = "Caliber Ring",
        vocation_ring = "Vocation Ring",
        facility_ring = "Facility Ring",

        -- Tools
        shihei = "Shihei",
        monomi = "Sanjaku-tenugui",
        tonko = "Shinobi-tabi",

        -- Other
        forbiddenkeys = "Forbidden Key",
        dialkey1 = "Dial Key #Ab",
        silvervoucher = "Silver Voucher",
        coppervoucher = "Copper Voucher"
    }

end
