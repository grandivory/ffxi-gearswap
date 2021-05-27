include('set-behavior')
include('organizer-lib')
include('utils')
include('augments')

function define_sets()
    Melee_Modes = T {'DT', 'DTTH', 'TH', 'Crit', 'Att', 'Acc'}
    fastcast = .34

    -- Ambu capes
    back = {
        tp = {
            name = "Toutatis's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Phys. dmg. taken-10%'}
        },
        dexws = {
            name = "Toutatis's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'DEX+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        },
        agida = {
            name = "Toutatis's Cape",
            augments = {'AGI+20', 'Accuracy+20 Attack+20', 'AGI+10', '"Dbl.Atk."+10', 'Damage taken-5%'}
        }
    }

    sets.Idle = { -- 50% DT, 4 MDB
        ammo = "Vanir Battery", -- MDB +4
        head = "Malignance Chapeau", -- 6% DT
        body = "Malignance Tabard", -- 9% DT
        hands = "Malignance Gloves", -- 5% DT
        legs = "Malignance Tights", -- 7% DT
        feet = "Jute Boots +1",
        neck = "Loricate Torque +1", -- 6% DT
        waist = "Flume Belt +1", -- 4% PDT
        left_ear = "Odnowa Earring +1", -- 2% MDT
        left_ring = "Defending Ring",
        right_ring = {
            name = "Dark Ring",
            augments = {'Phys. dmg. taken -5%', 'Magic dmg. taken -6%'}
        },
        back = back.tp
    }

    -- Engaged Sets
    sets.TP.Att = {
        main = "Aeneas",
        sub = "Gleti's Knife",
        ammo = "Ginsen",
        head = "Adhemar Bonnet +1",
        body = "Pillager's Vest +3",
        hands = "Adhemar Wrist. +1",
        legs = "Samnuha Tights",
        feet = "Plunderer's Poulaines +3",
        neck = "Asn. Gorget +2",
        waist = "Reiki Yotai",
        left_ear = "Sherida Earring",
        right_ear = "Cessance Earring",
        left_ring = "Petrov Ring",
        right_ring = "Epona's Ring",
        back = back.tp
    }
    sets.TP.Acc = {
        main = "Aeneas",
        sub = "Gleti's Knife",
        ammo = "Cath Palug Stone",
        head = "Pillager's Bonnet +3",
        body = "Pillager's Vest +3",
        hands = "Adhemar Wrist. +1",
        legs = "Samnuha Tights",
        feet = "Malignance Boots",
        neck = "Assassin's Gorget +2",
        waist = "Reiki Yotai",
        left_ear = "Sherida Earring",
        right_ear = "Telos Earring",
        left_ring = "Ilabrat Ring",
        right_ring = "Regal Ring",
        back = back.tp
    }
    TH_Gear = {
        -- sub = "Sandung",
        hands = "Plunderer's Armlets +3"
        -- feet = "Skulker's Poulaines +1"
    }
    sets.TP.TH = set_combine(sets.TP.Att, TH_Gear)
    sets.TP.DT = set_combine(sets.TP.Att, { -- 50% DT
        head = "Malignance Chapeau", -- 6% DT
        body = "Malignance Tabard", -- 9% DT
        hands = "Malignance Gloves", -- 5% DT
        legs = "Malignance Tights", -- 7% DT
        feet = "Malignance Boots", -- 4% DT
        left_ring = "Defending Ring", -- 10% DT
        back = back.tp -- 10% PDT
        
    })
    sets.TP.DTTH = set_combine(sets.TP.DT, TH_Gear, {
        sub = "Sandung"
    })
    sets.TP.Crit = set_combine(sets.TP.Att, {
        head = "Mummu Bonnet +2",
        body = "Mummu Jacket +2",
        hands = "Mummu Wrists +2",
        legs = "Mummu Kecks +2",
        feet = "Mummu Gamash. +2",
        left_ring = "Mummu Ring",
        right_ring = "Epona's Ring",
        back = back.tp
    })
    for mode, set in pairs(sets.TP) do
        -- Add in special gear for Sneak/Trick attack
        if not string.find(mode, 'TH') then
            set.withBuffs = {}
            set.withBuffs['Sneak Attack'] = set_combine(set, {
                head = "Adhemar Bonnet +1",
                body = "Malignance Tabard",
                hands = "Adhemar Wrist. +1",
                feet = "Malignance Boots",
                neck = "Assassin's Gorget +2",
                waist = "Wanion Belt",
                left_ear = "Brutal Earring",
                right_ear = "Odr Earring",
                left_ring = "Ilabrat Ring",
                right_ring = "Regal Ring",
                back = back.tp
            })
            set.withBuffs['Trick Attack'] = set_combine(set, {
                head = "Adhemar Bonnet +1",
                body = "Plunderer's Vest +3",
                hands = "Malignance Gloves",
                legs = "Mummu Kecks +2",
                feet = "Mummu Gamash. +2",
                neck = "Assassin's Gorget +2",
                left_ring = "Ilabrat Ring",
                right_ring = "Regal Ring"
            })
        end
    end

    -- JA Sets; equip on use
    sets.JA['Sneak Attack'] = set_combine(set, {
        head = "Adhemar Bonnet +1",
        body = "Malignance Tabard",
        hands = "Adhemar Wrist. +1",
        feet = "Malignance Boots",
        neck = "Assassin's Gorget +2",
        waist = "Wanion Belt",
        left_ear = "Brutal Earring",
        right_ear = "Odr Earring",
        left_ring = "Ilabrat Ring",
        right_ring = "Regal Ring",
        back = back.dexws
    })
    sets.JA['Trick Attack'] = set_combine(set, {
        head = "Adhemar Bonnet +1",
        body = "Plunderer's Vest +3",
        hands = "Malignance Gloves",
        legs = "Mummu Kecks +2",
        feet = "Mummu Gamash. +1",
        neck = "Assassin's Gorget +2",
        left_ring = "Ilabrat Ring",
        right_ring = "Regal Ring"
    })
    sets.JA.Steal = {
        ammo = "Barathrum",
        head = "Plun. Bonnet +3"
    }
    sets.JA.Mug = {
        head = "Plun. Bonnet +3"
    }
    sets.JA.Hide = {
        body = "Pillager's Vest +3"
    }
    sets.JA.Conspirator = {
        body = "Raider's Vest +2"
    }
    sets.JA["Perfect Dodge"] = {
        hands = "Plunderer's Armlets +3"
    }
    sets.JA.Despoil = {
        feet = "Skulker's Poulaines +1"
    }
    sets.JA.Bully = {
        hands = "Plunderer's Armlets +3",
        feet = "Skulker's Poulaines +1"
    }

    -- Non-THF JAs
    sets.JA['Waltz'] = {
        ammo = "Yamarang",
        head = "Mummu Bonnet +2",
        body = "Passion Jacket",
        hands = "Meg. Gloves +2",
        legs = "Meg. Chausses +1",
        waist = "Gishdubar Sash",
        left_ear = "Odnowa Earring +1",
        left_ring = "Petrov Ring"
    }

    -- WS Sets
    rudras = {
        ammo = "Seeth. Bomblet +1",
        head = "Plun. Bonnet +3",
        body = "Plunderer's Vest +3",
        hands = "Meg. Gloves +2",
        legs = "Plun. Culottes +3",
        feet = "Plun. Poulaines +3",
        neck = "Asn. Gorget +2",
        waist = "Grunfeld Rope",
        left_ear = "Sherida Earring",
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        left_ring = "Ilabrat Ring",
        right_ring = "Regal Ring",
        back = back.dexws
    }
    sets.WS["Rudra's Storm"] = copy(rudras)
    sets.WS["Rudra's Storm"].withBuffs = {}
    sets.WS["Rudra's Storm"].withBuffs["Sneak Attack"] = set_combine(rudras, {
        ammo = "Yetshila +1",
        head = "Pillager's Bonnet +3",
        feet = "Lustra. Leggings +1",
        left_ear = "Odr Earring"
    })
    sets.WS["Mandalic Stab"] = copy(rudras)
    sets.WS["Mandalic Stab"].withBuffs = {}
    sets.WS["Mandalic Stab"].withBuffs["Sneak Attack"] = set_combine(rudras, {
        right_ear = "Odr Earring"
    })

    sets.WS.Evisceration = {
        ammo = "Yetshila +1",
        head = "Pill. Bonnet +3",
        body = "Plunderer's Vest +3",
        hands = "Mummu Wrists +2",
        legs = "Gleti's Breeches",
        feet = "Gleti's Boots",
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Odr Earring",
        left_ring = "Begrudging Ring",
        right_ring = "Regal Ring",
        back = back.dexws
    }
    sets.WS.Exenterator = {
        ammo = "Seeth. Bomblet +1",
        head = "Plun. Bonnet +3",
        body = "Plunderer's Vest +3",
        hands = herc.hands.agiws,
        legs = "Meg. Chausses +1",
        feet = "Plun. Poulaines +3",
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Sherida Earring",
        right_ear = "Brutal Earring",
        left_ring = "Ilabrat Ring",
        right_ring = "Regal Ring",
        back = back.agida
    }
    sets.WS["Savage Blade"] = {
        ammo = "Seeth. Bomblet +1",
        head = "Pillager's Bonnet +3",
        body = "Meg. Cuirie +2",
        hands = "Meg. Gloves +2",
        legs = "Meg. Chausses +1",
        feet = herc.feet.strws,
        neck = "Caro Necklace",
        waist = "Sailfi Belt +1",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Ishvara Earring",
        left_ring = "Regal Ring",
        right_ring = "Rufescent Ring",
        back = back.dexws
    }
    sets.WS.Generic = copy(rudras)
    sets.WS.MAB = {
        ammo = "Ghastly Tathlum +1",
        head = "Pillager's Bonnet +3",
        body = herc.body.wsdmab,
        hands = "Leyline Gloves",
        legs = herc.legs.mab,
        feet = herc.feet.thmab,
        neck = "Baetyl Pendant",
        waist = "Eschan Stone",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Friomisi Earring",
        left_ring = "Metamorph Ring +1",
        right_ring = "Shiva Ring +1",
        back = back.dexws
    }

    -- Pieces to switch out when the day/weather matches
    sets.Weather = {
        waist = "Hachirin-no-obi"
    }

    sets.precast.FastCast = { -- 34%
        ammo = "Sapience Orb", -- 2%
        head = "Herculean Helm", -- 7%
        body = taeon.body.fc, -- 9%
        hands = "Leyline Gloves", -- 7%
        neck = "Orunmila's Torque", -- 5%
        left_ear = "Loquac. Earring", -- 2%
        right_ear = "Enchntr. Earring +1", -- 2%
        left_ring = "Rahab Ring"
    }

    sets.precast.Utsusemi = set_combine(sets.precast.FastCast, {
        body = "Passion Jacket"
    })

    sets.midcast.Poisonga = TH_Gear

    organizer_items = {
        attfood = "Red Curry Bun",
        accfood = "Sublime Sushi",
        bseals = "Beastmen's Seal",
        kseals = "Kindred's Seal",
        kcrests = "Kindred's Crest",
        hkcrests = "High Kindred's Crest",
        skcrest = "Sacred Kindred's Crest",
        warp_ring = "Warp Ring",
        caliber_ring = "Caliber Ring",
        vocation_ring = "Vocation Ring",
        facility_ring = "Facility Ring",
        aptitude_mantle = "Aptitude Mantle",
        monomi = "Sanjaku-tenugui",
        tonko = "Shinobi-tabi"
    }
end
