include('set-behavior')
include('organizer-lib')
include('utils')
include('augments')

function define_sets()
    Melee_Modes = T {'DTTH', 'DT', 'TH', 'Crit', 'Att', 'Acc', 'Evasion'}
    Idle_Modes = T {'Speed', 'Regen', 'Evasion'}
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
        },
        evasion = {
            name = "Toutatis's Cape",
            augments = {'AGI+20', 'Eva.+20 /Mag. Eva.+20', 'Evasion+10', '"Store TP"+10', 'Evasion+15'}
        }
    }

    -- sets.Idle.Speed = { -- 50% DT, 4 MDB
    --     ammo = "Vanir Battery", -- MDB +4
    --     head = malignance.head, -- 6% DT
    --     body = malignance.body, -- 9% DT
    --     hands = malignance.hands, -- 5% DT
    --     legs = malignance.legs, -- 7% DT
    --     feet = "Jute Boots +1",
    --     neck = "Loricate Torque +1", -- 6% DT
    --     waist = "Flume Belt +1", -- 4% PDT
    --     left_ear = "Odnowa Earring +1", -- 2% MDT
    --     left_ring = "Defending Ring",
    --     right_ring = {
    --         name = "Dark Ring",
    --         augments = {'Phys. dmg. taken -5%', 'Magic dmg. taken -6%'}
    --     },
    --     back = back.tp
    -- }
    sets.Idle.Evasion = { -- 50% PDT, 47% MDT, +215 AGI, +582~592 Evasion
        ammo = "Yamarang", -- 15 Evasion
        head = malignance.head, -- 33 AGI, 91 Evasion, 6% DT
        body = malignance.body, -- 42 AGI, 102 Evasion, 9% DT
        hands = malignance.hands, -- 24 AGI, 80 Evasion, 5% DT
        legs = malignance.legs, -- 42 AGI, 85 Evasion, 7% DT
        feet = malignance.feet, -- 49 AGI, 119 Evasion, 4% DT
        neck = "Bathy Choker +1", -- 20~30 Evasion, +3 Regen
        waist = "Flume Belt +1", -- 4% PDT
        left_ear = "Eabani Earring", -- 15 Evasion
        right_ear = "Infused Earring", -- 4 AGI, 10 Evasion, +1 Regen
        left_ring = "Defending Ring", -- 10% DT
        right_ring = { -- AGI +1, 5% PDT, 6% MDT
            name = "Dark Ring",
            augments = {'Phys. dmg. taken -5%', 'Magic dmg. taken -6%'}
        },
        back = back.evasion -- 20 AGI, 45 Evasion
    }
    sets.Idle.Speed = set_combine(sets.Idle.Evasion, {
        feet = "Jute Boots +1"
    })
    sets.Idle.Regen = set_combine(sets.Idle.Speed, {
        left_ring = "Chirich Ring +1",
        right_ring = "Chirich Ring +1"
    })

    -- Engaged Sets
    sets.TP.Att = {
        main = "Aeneas",
        sub = "Gleti's Knife",
        ammo = "Aurgelmir Orb +1",
        head = adhemar.head,
        body = "Pillager's Vest +3",
        hands = adhemar.hands,
        legs = "Samnuha Tights",
        feet = "Plunderer's Poulaines +3",
        neck = "Asn. Gorget +2",
        waist = "Reiki Yotai",
        left_ear = "Sherida Earring",
        right_ear = "Cessance Earring",
        left_ring = "Gere Ring",
        right_ring = "Epona's Ring",
        back = back.tp
    }
    sets.TP.Acc = {
        main = "Aeneas",
        sub = "Gleti's Knife",
        ammo = "Cath Palug Stone",
        head = "Pillager's Bonnet +3",
        body = "Pillager's Vest +3",
        hands = adhemar.hands,
        legs = "Samnuha Tights",
        feet = malignance.feet,
        neck = "Assassin's Gorget +2",
        waist = "Reiki Yotai",
        left_ear = "Sherida Earring",
        right_ear = "Telos Earring",
        left_ring = "Ilabrat Ring",
        right_ring = "Regal Ring",
        back = back.tp
    }
    th_gear = {
        ammo = "Per. Lucky Egg",
        hands = "Plunderer's Armlets +3"
    }
    sets.TP.TH = set_combine(sets.TP.Att, th_gear)
    sets.TP.DT = set_combine(sets.TP.Att, { -- 50% DT
        head = malignance.head, -- 6% DT
        body = malignance.body, -- 9% DT
        hands = malignance.hands, -- 5% DT
        legs = malignance.legs, -- 7% DT
        feet = malignance.feet, -- 4% DT
        left_ring = "Defending Ring", -- 10% DT
        back = back.tp -- 10% PDT

    })
    sets.TP.DTTH = set_combine(sets.TP.DT, th_gear)
    sets.TP.Crit = set_combine(sets.TP.Att, {
        main = "Tauret",
        head = gleti.head,
        body = gleti.body,
        hands = gleti.hands,
        legs = gleti.legs,
        feet = gleti.feet
    })
    -- for mode, set in pairs(sets.TP) do
    --     -- Add in special gear for Sneak/Trick attack
    --     if not string.find(mode, 'TH') then
    --         set.withBuffs = {}
    --         set.withBuffs['Sneak Attack'] = set_combine(set, {
    --             head = adhemar.head,
    --             body = malignance.body,
    --             hands = adhemar.hands,
    --             feet = malignance.feet,
    --             neck = "Assassin's Gorget +2",
    --             waist = "Wanion Belt",
    --             left_ear = "Brutal Earring",
    --             right_ear = "Odr Earring",
    --             left_ring = "Ilabrat Ring",
    --             right_ring = "Regal Ring",
    --             back = back.tp
    --         })
    --         set.withBuffs['Trick Attack'] = set_combine(set, {
    --             head = adhemar.head,
    --             body = "Plunderer's Vest +3",
    --             hands = malignance.hands,
    --             legs = malignance.legs,
    --             feet = malignance.feet,
    --             neck = "Assassin's Gorget +2",
    --             left_ring = "Ilabrat Ring",
    --             right_ring = "Regal Ring"
    --         })
    --     end
    -- end
    sets.TP.Evasion = {
        main = "Aeneas",
        sub = "Gleti's Knife",
        ammo = "Yamarang",
        head = malignance.head,
        body = malignance.body,
        hands = malignance.hands,
        legs = malignance.legs,
        feet = malignance.feet,
        neck = "Asn. Gorget +2",
        waist = "Flume Belt +1",
        left_ear = "Eabani Earring",
        right_ear = "Infused Earring",
        left_ring = "Defending Ring",
        right_ring = "Ilabrat Ring",
        back = back.evasion
    }

    sets.mod.TH = th_gear

    -- JA Sets; equip on use
    sets.JA['Sneak Attack'] = set_combine(set, {
        head = adhemar.head,
        body = malignance.body,
        hands = adhemar.hands,
        feet = malignance.feet,
        neck = "Assassin's Gorget +2",
        waist = "Wanion Belt",
        left_ear = "Brutal Earring",
        right_ear = "Odr Earring",
        left_ring = "Ilabrat Ring",
        right_ring = "Regal Ring",
        back = back.dexws
    })
    sets.JA['Trick Attack'] = set_combine(set, {
        head = adhemar.head,
        body = "Plunderer's Vest +3",
        hands = malignance.hands,
        legs = malignance.legs,
        feet = malignance.feet,
        neck = "Assassin's Gorget +2",
        left_ring = "Ilabrat Ring",
        right_ring = "Regal Ring"
    })
    sets.JA.Steal = {
        head = "Plun. Bonnet +3"
    }
    -- TODO: Redo this set to max out DEX+AGI
    sets.JA.Mug = {
        head = "Plun. Bonnet +3"
    }
    sets.JA.Hide = {
        body = "Pillager's Vest +3"
    }
    -- sets.JA.Conspirator = {
    --     body = "Raider's Vest +2"
    -- }
    sets.JA["Perfect Dodge"] = {
        hands = "Plunderer's Armlets +3"
    }
    sets.JA.Despoil = {
        feet = "Skulker's Poulaines +1"
    }
    sets.JA.Bully = th_gear

    -- Non-THF JAs
    sets.JA['Waltz'] = {
        ammo = "Yamarang",
        hands = meghanada.hands,
        -- legs = meghanada.legs,
        waist = "Gishdubar Sash",
        left_ear = "Odnowa Earring +1",
        left_ring = "Petrov Ring"
    }

    -- WS Sets
    rudras = {
        ammo = "Seeth. Bomblet +1",
        head = "Plun. Bonnet +3",
        body = "Plunderer's Vest +3",
        hands = meghanada.hands,
        legs = "Plun. Culottes +3",
        feet = nyame.feet,
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
        hands = gleti.hands,
        legs = gleti.feet,
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
        head = nyame.head,
        body = "Plunderer's Vest +3",
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
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
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Caro Necklace",
        waist = "Sailfi Belt +1",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Ishvara Earring",
        left_ring = "Regal Ring",
        right_ring = "Epaminondas's Ring",
        back = back.dexws
    }
    sets.WS.Generic = {
        ammo = "Seeth. Bomblet +1",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = "Plun. Culottes +3",
        feet = nyame.feet,
        neck = "Asn. Gorget +2",
        waist = "Grunfeld Rope",
        left_ear = "Sherida Earring",
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        left_ring = "Epaminondas's Ring",
        right_ring = "Regal Ring",
        back = back.dexws
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
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Friomisi Earring",
        left_ring = "Metamorph Ring +1",
        right_ring = "Epaminondas's Ring",
        back = back.dexws
    }
    sets.WS["Aeolian Edge"] = set_combine(sets.WS.MAB, th_gear);

    -- Pieces to switch out when the day/weather matches
    sets.Weather = {
        waist = "Hachirin-no-obi"
    }

    sets.Distance = {
        waist = "Orpheus's Sash"
    }

    sets.precast.FastCast = { -- 34%
        ammo = "Sapience Orb", -- 2%
        head = "Herculean Helm", -- 7%
        body = taeon.body.fcphalanx, -- 9%
        hands = "Leyline Gloves", -- 7%
        neck = "Orunmila's Torque", -- 5%
        left_ear = "Loquac. Earring", -- 2%
        right_ear = "Enchntr. Earring +1", -- 2%
        left_ring = "Rahab Ring"
    }

    sets.midcast.Poisonga = th_gear

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
