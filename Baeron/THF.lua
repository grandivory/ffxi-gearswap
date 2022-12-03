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

    af = {
        head = "Pill. Bonnet +3",
        body = "Pillager's Vest +3",
        legs = "Pill. Culottes +3"
    }

    relic = {
        head = "Plun. Bonnet +3",
        body = "Plunderer's Vest +3",
        hands = "Plun. Armlets +3",
        legs = "Plun. Culottes +3",
        feet = "Plun. Poulaines +3"
    }

    empy = {
        head = "Skulker's Bonnet +2",
        body = "Skulker's Vest +2",
        hands = "Skulk. Armlets +1",
        legs = "Skulk. Culottes +2",
        feet = "Skulk. Poulaines +2"
    }

    -- =========================================================================================================
    -- ***Not Engaged Sets***
    -- =========================================================================================================

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

    -- =========================================================================================================
    -- ***Engaged Sets***
    -- =========================================================================================================
    sets.TP.Att = {
        main = "Twashtar",
        sub = "Gleti's Knife",
        ammo = "Aurgelmir Orb +1",
        head = empy.head,
        body = af.body,
        hands = adhemar.hands,
        legs = af.legs,
        feet = relic.feet,
        neck = "Asn. Gorget +2",
        waist = "Reiki Yotai",
        left_ear = "Sherida Earring",
        right_ear = "Telos Earring",
        left_ring = "Gere Ring",
        right_ring = "Hetairoi Ring",
        back = back.tp
    }
    sets.TP.Acc = {
        main = "Twashtar",
        sub = "Gleti's Knife",
        ammo = "Cath Palug Stone",
        head = empy.head,
        body = af.body,
        hands = adhemar.hands,
        legs = af.legs,
        feet = empy.feet,
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
        feet = empy.feet
    }
    sets.TP.TH = set_combine(sets.TP.Att, {
        ammo = "Per. Lucky Egg",
        head = adhemar.head,
        body = af.body,
        hands = relic.hands,
        legs = af.legs,
        feet = relic.feet,
        neck = "Assassin's Gorget +2",
        waist = "Reiki Yotai",
        left_ear = "Sherida Earring",
        right_ear = "Telos Earring",
        left_ring = "Gere Ring",
        right_ring = "Hetairoi Ring",
        back = back.tp
    })
    sets.TP.DT = set_combine(sets.TP.Att, { -- 50% DT
        head = malignance.head, -- 6% DT
        body = malignance.body, -- 9% DT
        hands = malignance.hands, -- 5% DT
        legs = malignance.legs, -- 7% DT
        feet = malignance.feet, -- 4% DT
        left_ring = "Moonlight Ring",
        right_ring = "Moonlight Ring",
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
    sets.TP.Evasion = { -- 787 Evasion
        main = "Gandring", -- 100 evasion
        sub = malevolence,
        ammo = "Yamarang", -- 15 Evasion
        head = malignance.head, -- 91 Evasion
        body = malignance.body, -- 102 Evasion
        hands = malignance.hands, -- 80 Evasion
        legs = malignance.legs, -- 85 Evasion
        feet = malignance.feet, -- 119 Evasion
        neck = "Asn. Gorget +2", -- 25 Evasion
        waist = "Flume Belt +1", -- PDT -4%
        left_ear = "Eabani Earring", -- 15 Evasion
        right_ear = "Infused Earring", -- 10 Evasion
        left_ring = "Defending Ring", -- DT -10%
        right_ring = "Ilabrat Ring", -- AGI +10
        back = back.evasion -- 45 Evasion
    }

    sets.TPMod.Feint = {
        legs = relic.legs
    }
    sets.mod.TH = th_gear

    -- =========================================================================================================
    -- ***Job Ability Sets***
    -- =========================================================================================================
    sets.JA['Sneak Attack'] = set_combine(set, {
        head = adhemar.head,
        body = relic.body,
        hands = adhemar.hands,
        legs = af.legs,
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
        body = relic.body,
        hands = malignance.hands,
        legs = malignance.legs,
        feet = malignance.feet,
        neck = "Assassin's Gorget +2",
        left_ring = "Ilabrat Ring",
        right_ring = "Regal Ring"
    })
    sets.JA.Steal = {
        head = relic.head
    }
    -- TODO: Redo this set to max out DEX+AGI
    sets.JA.Mug = {
        head = relic.head
    }
    sets.JA.Hide = {
        body = af.body
    }
    sets.JA.Accomplice = {
        head = empy.head
    }
    sets.JA.Collaborator = {
        head = empy.head
    }
    sets.JA.Conspirator = {
        body = empy.body
    }
    sets.JA["Perfect Dodge"] = {
        hands = relic.hands
    }
    sets.JA.Despoil = {
        legs = empy.legs,
        feet = empy.feet
    }
    sets.JA.Bully = th_gear

    -- Non-THF JAs
    sets.JA['Waltz'] = {
        ammo = "Yamarang",
        hands = meghanada.hands,
        waist = "Gishdubar Sash",
        left_ear = "Odnowa Earring +1",
        left_ring = "Petrov Ring"
    }

    -- =========================================================================================================
    -- ***Weapon Skill Sets***
    -- =========================================================================================================
    sets.WS.Generic = {
        ammo = "Seeth. Bomblet +1",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Asn. Gorget +2",
        waist = "Kentarch Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Moonshade Earring",
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
        neck = "Sibyl Scarf",
        waist = "Orpheus's Sash",
        left_ear = "Moonshade Earring",
        right_ear = "Friomisi Earring",
        left_ring = "Metamorph Ring +1",
        right_ring = "Epaminondas's Ring",
        back = back.dexws
    }

    rudras = {
        ammo = "Aurgelmir Orb +1",
        head = nyame.head,
        body = empy.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Asn. Gorget +2",
        waist = "Kentarch Belt +1",
        left_ear = "Odr Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Epaminondas's Ring",
        right_ring = "Regal Ring",
        back = back.dexws
    }
    sets.WS["Rudra's Storm"] = copy(rudras)
    sets.WS["Rudra's Storm"].withBuffs = {}
    sets.WS["Rudra's Storm"].withBuffs["Sneak Attack"] = set_combine(rudras, {
        ammo = "Yetshila +1"
    })
    sets.WS["Mandalic Stab"] = sets.WS["Rudra's Storm"]

    sets.WS.Evisceration = {
        ammo = "Yetshila +1",
        head = adhemar.head,
        body = relic.body,
        hands = mummu.hands,
        legs = empy.legs,
        feet = gleti.feet,
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Odr Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Ilabrat Ring",
        right_ring = "Regal Ring",
        back = back.dexws
    }
    sets.WS.Exenterator = {
        ammo = "Seeth. Bomblet +1",
        head = nyame.head,
        body = nyame.body,
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
        left_ear = "Moonshade Earring",
        right_ear = "Ishvara Earring",
        left_ring = "Regal Ring",
        right_ring = "Epaminondas's Ring",
        back = back.dexws
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
        back = back.dexws
    }

    sets.WS["Aeolian Edge"] = set_combine(sets.WS.MAB, th_gear);

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

    -- =========================================================================================================
    -- ***Midcast Sets***
    -- =========================================================================================================
    sets.midcast.Poisonga = th_gear

    -- =========================================================================================================
    -- ***Special Sets***
    -- =========================================================================================================
    sets.Weather = {
        waist = "Hachirin-no-obi"
    }

end
