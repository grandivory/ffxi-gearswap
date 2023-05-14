include('set-behavior')
include('augments')

lockstyleset = 12

-- TODO: Jump sets, Empy +2
function define_sets()
    Melee_Modes = T {'Glass', 'DT'} -- , 'Acc', 'Omen', 'SB'}
    Idle_Modes = T {'Speed', 'DT'}

    fastcast = .32 -- This defines how much fast cast you have, which is used when canceling spell effects (.8 = 80%)

    -- =========================================================================================================
    -- ***Stances***
    -- =========================================================================================================
    stances.SAM = S {'Hasso', 'Seigan'}

    back = {
        tp = {
            name = "Smertrios's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Phys. dmg. taken-10%'}
        },
        glasstp = {
            name = "Takaha Mantle",
            augments = {'STR+5', '"Zanshin"+5', '"Store TP"+2'}
        },
        strws = {
            name = "Smertrios's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        },
        mab = {
            name = "Smertrios's Mantle",
            augments = {'STR+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Magic Damage +10', 'Weapon skill damage +10%',
                        'Damage taken-5%'}
        },
        ranged = {
            name = "Smertrios's Mantle",
            augments = {'AGI+20', 'Rng.Acc.+20 Rng.Atk.+20', 'AGI+10', 'Weapon skill damage +10%',
                        'Phys. dmg. taken-10%'}
        }
    }

    af = {
        head = "Wakido Kabuto +3",
        body = "Wakido Domaru +3",
        hands = "Wakido Kote +3",
        legs = "Wakido Haidate +3"
    }

    relic = {
        body = "Sakonji Domaru +3",
        hands = "Sakonji Kote +3"
    }

    empy = {
        head = "Kasuga Kabuto +2",
        body = "Kasuga Domaru +2",
        hands = "Kasuga Kote +3",
        legs = "Kasuga Haidate +2",
        ear = "Kasuga Earring +1"
    }

    jseneck = "Samurai's Nodowa +2"

    th_gear = {
        ammo = "Per. Lucky Egg",
        legs = "Volte Hose",
        waist = "Chaac Belt"
    }

    -- =========================================================================================================
    -- ***Not Engaged Sets***
    -- =========================================================================================================
    sets.Idle = { -- 59% PDT, 51% MDT, MDB+12, Regain +4, Regen +15
        main = "Masamune",
        sub = "Utu Grip",
        ammo = "Staunch Tathlum +1", -- 3% DT
        head = af.head, -- Regain +4
        body = "Sacro Breastplate", -- MDB +12, Regen +13
        hands = nyame.hands, -- 7% DT
        legs = empy.legs, -- 10% DT
        feet = nyame.feet, -- 7% DT
        neck = "Loricate Torque +1", -- 6% DT
        waist = "Plat. Mog. Belt", -- 3% DT
        left_ear = "Odnowa Earring +1", -- 3% DT, 2% MDT
        right_ear = "Tuisto Earring",
        left_ring = "Chirich Ring +1", -- Regen +2
        right_ring = "Defending Ring", -- 10% DT
        back = back.tp -- 10% PDT
    }

    sets.Idle.Speed = set_combine(sets.Idle, {
        feet = "Danzo Sune-ate"
    })

    -- =========================================================================================================
    -- ***Engaged Sets***
    -- =========================================================================================================
    sets.TP.DT = {
        main = "Masamune",
        sub = "Utu Grip",
        ammo = "Coiste Bodhar",
        head = empy.head,
        body = empy.body,
        hands = tatenashi.hands,
        legs = empy.legs,
        feet = ryuo.feet,
        neck = jseneck,
        waist = sailfi.belt,
        left_ear = "Schere Earring",
        right_ear = empy.ear,
        left_ring = "Defending Ring",
        right_ring = "Niqmaddu Ring",
        back = back.tp
    }

    sets.TP.Acc = {
        main = "Masamune",
        sub = "Utu Grip",
        ammo = "Coiste Bodhar",
        head = empy.head,
        body = empy.body,
        hands = tatenashi.hands,
        legs = empy.legs,
        feet = ryuo.feet,
        neck = jseneck,
        waist = "Ioskeha Belt +1",
        left_ear = "Schere Earring",
        right_ear = empy.ear,
        left_ring = "Defending Ring",
        right_ring = "Niqmaddu Ring",
        back = back.tp
    }

    sets.TP.Omen = sets.TP.DT

    sets.TP.Glass = {
        main = "Masamune",
        sub = "Utu Grip",
        ammo = "Coiste Bodhar",
        head = flamma.head,
        body = empy.body,
        hands = tatenashi.hands,
        legs = empy.legs,
        feet = ryuo.feet,
        neck = jseneck,
        waist = sailfi.belt,
        left_ear = "Schere Earring",
        right_ear = empy.ear,
        left_ring = "Chirich Ring +1",
        right_ring = "Niqmaddu Ring",
        back = back.glasstp
    }

    sets.TP.TH = set_combine(sets.TP.DT, th_gear)

    sets.TPMod.Seigan = {
        head = empy.head
    }

    sets.TP.SB = {
        sub = "Utu Grip",
        ammo = "Coiste Bodhar",
        head = kendatsuba.head,
        body = "Dagon Breastplate",
        hands = af.hands,
        legs = mpaca.legs,
        feet = ryuo.feet,
        neck = "Bathy Choker +1",
        waist = "Sarissaphoroi Belt",
        left_ear = "Schere Earring",
        right_ear = "Digni. Earring",
        left_ring = "Chirich Ring +1",
        right_ring = "Niqmaddu Ring",
        back = back.tp
    }

    sets.TP.SB.withBuffs = {}
    sets.TP.SB.withBuffs['Auspice'] = {
        sub = "Utu Grip",
        ammo = "Coiste Bodhar",
        head = kendatsuba.head,
        body = "Dagon Breastplate",
        hands = af.hands,
        legs = mpaca.legs,
        feet = ryuo.feet,
        neck = jseneck,
        waist = "Ioskeha Belt +1",
        left_ear = "Schere Earring",
        right_ear = empy.ear,
        left_ring = "Chirich Ring +1",
        right_ring = "Niqmaddu Ring",
        back = back.tp
    }

    sets.mod.TH = th_gear

    -- =========================================================================================================
    -- ***Ranged Attacks***
    -- =========================================================================================================
    ammo_threshold = 20 -- Below this, the lua will warn you that you're low on ammo
    sets.precast.RA = {
        -- head = acro.head.snapshot,
        -- body = acro.body.snapshot,
        -- hands = acro.hands.snapshot,
        -- legs = acro.legs.snapshot,
        -- feet = acro.feet.snapshot,
        -- belt = "Yemaya Belt",
        right_ring = "Crepuscular Ring"
        -- back = back.snapshot
    } -- Snapshot gear, etc.
    sets.midcast.RA = {
        sub = "Utu Grip",
        head = relic.head,
        body = af.body,
        -- hands = kendatsuba.hands,
        legs = relic.legs,
        feet = relic.feet,
        neck = jseneck,
        waist = "Yemaya Belt",
        left_ear = "Telos Earring",
        right_ear = "Crep. Earring",
        left_ring = "Regal Ring",
        right_ring = "Crepuscular Ring"
        -- back = back.ranged
    } -- What gear you want to have equipped when the ranged attack hits

    -- =========================================================================================================
    -- ***Weapon Skill Sets***
    -- =========================================================================================================
    sets.WS.Generic = {
        sub = "Utu Grip",
        ammo = "Knobkierrie",
        head = mpaca.head,
        body = nyame.body,
        hands = empy.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = jseneck,
        waist = sailfi.belt,
        left_ear = "Moonshade Earring",
        right_ear = "Thrud Earring",
        left_ring = "Beithir Ring",
        right_ring = "Niqmaddu Ring",
        back = back.strws
    }
    sets.WS.Generic.Acc = {
        sub = "Utu Grip",
        ammo = "Knobkierrie",
        head = mpaca.head,
        body = nyame.body,
        hands = empy.hands,
        legs = af.legs,
        feet = nyame.feet,
        neck = jseneck,
        waist = "Ioskeha Belt +1",
        left_ear = "Schere Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Regal Ring",
        right_ring = "Beithir Ring",
        back = back.strws
    }
    sets.WS.Generic.Omen = {
        sub = "Utu Grip",
        head = af.head,
        body = af.body,
        hands = ryuo.hands,
        legs = empty,
        feet = rao.feet,
        neck = "Sanctity Necklace",
        waist = "Ioskeha Belt +1",
        left_ear = "Telos Earring",
        right_ear = "Mache Earring +1",
        left_ring = "Chirich Ring +1",
        right_ring = "Chirich Ring +1",
        back = back.tp
    }
    sets.WS.MAB = {
        -- sub = "Utu Grip",
        ammo = "Knobkierrie",
        -- head = mpaca.head,
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Sibyl Scarf",
        waist = "Orpheus's Sash",
        left_ear = "Moonshade Earring",
        right_ear = "Friomisi Earring",
        left_ring = "Beithir Ring",
        right_ring = "Metamor. Ring +1",
        back = back.mab
    }
    sets.WS.MAB.Omen = {
        sub = "Utu Grip",
        head = af.head,
        body = af.body,
        hands = ryuo.hands,
        legs = empty,
        feet = rao.feet,
        neck = "Sanctity Necklace",
        waist = "Ioskeha Belt +1",
        left_ear = "Telos Earring",
        right_ear = "Mache Earring +1",
        left_ring = "Chirich Ring +1",
        right_ring = "Chirich Ring +1",
        back = back.tp
    }

    sets.WS["Tachi: Ageha"] = {
        sub = "Utu Grip",
        ammo = "Pemphredo Tathlum",
        head = mpaca.head,
        body = mpaca.body,
        hands = mpaca.hands,
        legs = mpaca.legs,
        feet = mpaca.feet,
        neck = "Sanctity Necklace",
        waist = "Eschan Stone",
        left_ear = "Crep. Earring",
        right_ear = "Digni. Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Metamorph Ring +1",
        back = back.mab
    }
    impulse_sonic = {
        sub = "Utu Grip",
        ammo = "Knobkierrie",
        head = mpaca.head,
        body = nyame.body,
        hands = empy.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = jseneck,
        waist = sailfi.belt,
        left_ear = "Moonshade Earring",
        right_ear = "Thrud Earring",
        left_ring = "Begrudging Ring",
        right_ring = "Niqmaddu Ring",
        back = back.strws
    }
    sets.WS["Impulse Drive"] = impulse_sonic
    sets.WS["Sonic Thrust"] = impulse_sonic

    sets.WS.Stardiver = {
        sub = "Utu Grip",
        ammo = "Knobkierrie",
        head = mpaca.head,
        body = tatenashi.body,
        hands = ryuo.hands,
        legs = mpaca.legs,
        feet = nyame.feet,
        neck = jseneck,
        waist = "Fotia Belt",
        left_ear = "Schere Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = back.strws
    }

    sets.WS["Namas Arrow"] = {
        sub = "Utu Grip",
        head = nyame.head,
        body = nyame.body,
        hands = empy.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = jseneck,
        waist = "Fotia Belt",
        left_ear = "Thrud Earring",
        right_ear = empy.ear,
        left_ring = "Regal Ring",
        right_ring = "Beithir Ring",
        back = back.strws
    }
    sets.WS["Empyreal Arrow"] = {
        sub = "Utu Grip",
        head = nyame.head,
        body = nyame.body,
        hands = empy.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = jseneck,
        waist = "Fotia Belt",
        left_ear = "Moonshade Earring",
        right_ear = "Thrud Earring",
        left_ring = "Regal Ring",
        right_ring = "Beithir Ring"
        -- back = back.ranged
    }

    -- =========================================================================================================
    -- ***Job Ability Sets***
    -- =========================================================================================================
    sets.JA['Warding Circle'] = {
        head = af.head
    }
    sets.JA.Meditate = {
        head = af.head,
        hands = relic.hands,
        back = back.tp
    }
    sets.JA['Blade Bash'] = {
        hands = relic.hands
    }

    -- DRG sub
    sets.JA.Jump = sets.TP.Glass

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
    sets.precast.FastCast = { -- 32%
        ammo = "Sapience Orb", -- 2%
        body = "Sacro Breastplate", -- 10%
        hands = "Leyline Gloves", -- 8%
        neck = "Orunmila's Torque", -- 5%
        left_ear = "Etiolation Earring", -- 1%
        right_ear = "Loquac. Earring", -- 5%
        left_ring = "Rahab Ring" -- 2%
    }

    -- =========================================================================================================
    -- ***Weather Gear***
    -- =========================================================================================================
    sets.Weather = {
        waist = "Hachirin-no-obi"
    }

    sets.Distance = {
        waist = "Orpheus's Sash"
    }

    sets.WakeUp = {
        neck = "Vim Torque"
    }

end
