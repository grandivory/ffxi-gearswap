include('set-behavior')
include('augments')

-- Set this to to /equipset you want to use for your lockstyle
lockstyleset = 2

function define_sets()
    Melee_Modes = T {'DT', 'Godhands', 'Counter', 'Att', 'Staff'}
    stances.MNK = S {'Impetus'}
    stances.Footwork = S {'Footwork'}
    stances.Berserk = S {'Berserk'}
    stances.Aggressor = S {'Aggressor'}

    th_gear = {
        ammo = "Per. Lucky Egg",
        legs = "Volte Hose",
        feet = herc.feet.thmab
    }

    back = {
        vitws = {
            name = "Segomo's Mantle",
            augments = {'VIT+20', 'Accuracy+20 Attack+20', 'VIT+10', 'Weapon skill damage +10%', 'Phys. dmg. taken-10%'}
        },
        strda = {
            name = "Segomo's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        },
        strcrit = {
            name = "Segomo's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Crit.hit rate+10', 'Phys. dmg. taken-10%'}
        },
        dexda = {
            name = "Segomo's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'DEX+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        }
    }

    af = {
        body = "Anch. Cyclas +1",
        feet = "Anch. Gaiters +3"
    }

    relic = {
        hands = "Hes. Gloves +1",
        legs = "Hes. Hose +3"
    }

    empy = {
        head = "Bhikku Crown +2",
        body = "Bhikku Cyclas +2",
        legs = "Bhikku Hose +3",
        feet = "Bhikku Gaiters +2"
    }

    -- =========================================================================================================
    -- ***Not Engaged Sets***
    -- =========================================================================================================
    sets.Idle = { -- 65% PDT, 57% MDT, +4 Regen
        ammo = "Staunch Tathlum +1", -- 3% DT
        head = empy.head, -- 10% DT
        body = malignance.body, -- 9% DT
        hands = malignance.hands, -- 5% DT
        legs = empy.legs, -- 13% DT
        feet = "Herald's Gaiters", -- 12% Movement Speed
        neck = "Loricate Torque +1", -- 6% DT
        waist = "Moonbow Belt +1", -- 6% DT
        left_ear = "Odnowa Earring +1", -- 3% DT, 2% MDT
        right_ear = "Tuisto Earring", -- DEF, VIT, HP
        left_ring = "Chirich Ring +1", -- +2 Regen
        right_ring = "Chirich Ring +1", -- +2 Regen
        back = back.vitws -- 10% PDT
    }
    sets.Idle.withBuffs = {}
    sets.Idle.withBuffs["Boost"] = set_combine(sets.Idle, {
        waist = "Ask Sash"
    })

    -- =========================================================================================================
    -- ***Engaged Sets***
    -- =========================================================================================================
    sets.TP.Att = {
        main = "Verethragna",
        ammo = "Coiste Bodhar",
        head = adhemar.head,
        body = mpaca.body,
        hands = adhemar.hands,
        legs = empy.legs,
        feet = af.feet,
        neck = "Mnk. Nodowa +2",
        waist = "Moonbow Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Schere Earring",
        left_ring = "Gere Ring",
        right_ring = "Niqmaddu Ring",
        back = back.dexda
    }
    sets.TP.Att.withBuffs = {}
    sets.TP.Att.withBuffs.Impetus = set_combine(sets.TP.Att, {
        body = empy.body
    })
    sets.TP.DT = { -- 50% PDT, 32% MDT
        main = "Verethragna",
        ammo = "Crepuscular Pebble",
        -- ammo = "Coiste Bodhar",
        head = empy.head, -- 10% DT
        body = kendatsuba.body,
        hands = mpaca.hands, -- 8% PDT
        legs = empy.legs, -- 13%
        feet = af.feet,
        neck = "Monk's Nodowa +2",
        waist = "Moonbow Belt +1", -- 6%
        left_ear = "Sherida Earring",
        right_ear = "Schere Earring",
        left_ring = "Gere Ring",
        right_ring = "Niqmaddu Ring",
        back = back.dexda -- 10% PDT
    }
    sets.TP.DT.withBuffs = {}
    sets.TP.DT.withBuffs.Impetus = set_combine(sets.TP.DT, {
        body = empy.body
    })

    sets.TP.Staff = {
        ammo = "Crepuscular Pebble",
        -- ammo = "Coiste Bodhar",
        head = empy.head,
        body = kendatsuba.body,
        hands = mpaca.hands, -- 8% PDT
        legs = empy.legs, -- 13%
        feet = malignance.feet,
        neck = "Monk's Nodowa +2",
        waist = "Moonbow Belt +1", -- 6%
        left_ear = "Sherida Earring",
        right_ear = "Schere Earring",
        left_ring = "Gere Ring",
        right_ring = "Niqmaddu Ring",
        back = back.dexda -- 10% PDT
    }

    -- sets.TP.PDT = { -- 51% PDT, 23% MDT
    --     main = "Verethragna",
    --     ammo = "Coiste Bodhar",
    --     head = adhemar.head,
    --     body = mpaca.body, -- 10% PDT
    --     hands = mpaca.hands, -- 8% PDT
    --     legs = empy.legs, -- 13%
    --     feet = malignance.feet, -- 4%
    --     neck = "Monk's Nodowa +2",
    --     waist = "Moonbow Belt +1", -- 6%
    --     left_ear = "Sherida Earring",
    --     right_ear = "Schere Earring",
    --     left_ring = "Gere Ring",
    --     right_ring = "Niqmaddu Ring",
    --     back = back.dexda -- 10%
    -- }
    -- sets.TP.PDT.withBuffs = {}
    -- sets.TP.PDT.withBuffs.Impetus = set_combine(sets.TP.PDT, {
    --     body = empy.body, -- -10
    --     left_ring = "Defending Ring" -- +10
    -- })
    -- sets.TP.PDT.withBuffs.Footwork = set_combine(sets.TP.PDT, {
    --     feet = af.feet
    -- })

    sets.TP.Godhands = set_combine(sets.TP.DT, {
        right_ear = "Mache Earring +1"
    })
    sets.TP.Godhands.withBuffs = {}
    sets.TP.Godhands.withBuffs.Impetus = set_combine(sets.TP.Godhands, {
        body = empy.body,
        left_ring = "Defending Ring"
    })
    sets.TP.Godhands.withBuffs.Footwork = set_combine(sets.TP.Godhands, {
        feet = af.feet
    })

    sets.TP.Counter = {
        main = "Verethragna",
        ammo = "Amar Cluster",
        head = empy.head,
        body = mpaca.body,
        hands = mpaca.hands,
        legs = empy.legs,
        feet = malignance.feet,
        neck = "Bathy Choker +1",
        waist = "Moonbow Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Cryptic Earring",
        left_ring = "Defending Ring",
        right_ring = "Niqmaddu Ring",
        back = back.dexda
    }

    -- =========================================================================================================
    -- ***Weapon Skill Sets***
    -- =========================================================================================================
    sets.WS["Victory Smite"] = {
        ammo = "Knobkierrie",
        head = adhemar.head,
        body = kendatsuba.body,
        hands = ryuo.hands,
        legs = mpaca.legs,
        feet = herc.feet.strcrit,
        neck = "Fotia Gorget",
        waist = "Moonbow Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Odr Earring",
        left_ring = "Gere Ring",
        right_ring = "Niqmaddu Ring",
        -- back = back.strcrit
        back.strws
    }
    sets.WS["Victory Smite"].withBuffs = {}
    sets.WS["Victory Smite"].withBuffs.Impetus = set_combine(sets.WS["Victory Smite"], {
        ammo = "Coiste Bodhar",
        body = empy.body,
        right_ear = "Schere Earring",
        back = back.strda
    })
    sets.WS["Raging Fists"] = {
        ammo = "Knobkierrie",
        head = kendatsuba.head,
        body = mpaca.body,
        hands = adhemar.hands,
        legs = mpaca.legs,
        feet = mpaca.feet,
        neck = "Fotia Gorget",
        waist = "Moonbow Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Gere Ring",
        right_ring = "Niqmaddu Ring",
        back = back.strda
    }
    sets.WS["Shijin Spiral"] = {
        ammo = "Aurgelmir Orb +1",
        head = kendatsuba.head,
        body = malignance.body,
        hands = malignance.hands,
        legs = mpaca.legs,
        feet = herc.feet.dexta,
        neck = "Fotia Gorget",
        waist = "Moonbow Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Mache Earring +1",
        left_ring = "Gere Ring",
        right_ring = "Niqmaddu Ring",
        back = back.dexda
    }
    sets.WS["Howling Fist"] = {
        ammo = "Knobkierrie",
        head = mpaca.head,
        body = tatenashi.body,
        hands = mpaca.hands,
        legs = mpaca.legs,
        feet = mpaca.feet,
        neck = "Fotia Gorget",
        waist = "Moonbow Belt +1",
        left_ear = "Moonshade Earring",
        right_ear = "Schere Earring",
        left_ring = "Gere Ring",
        right_ring = "Niqmaddu Ring",
        back = back.strda
    }
    sets.WS["Tornado Kick"] = {
        ammo = "Coiste Bodhar",
        head = mpaca.head,
        body = tatenashi.body,
        hands = adhemar.hands,
        legs = mpaca.legs,
        feet = af.feet,
        neck = "Monk's Nodowa +2",
        waist = "Moonbow Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Gere Ring",
        right_ring = "Niqmaddu Ring",
        back = back.strda
    }
    sets.WS["Shell Crusher"] = {
        ammo = "Pemphredo Tathlum",
        head = malignance.head,
        body = malignance.body,
        hands = malignance.hands,
        legs = malignance.legs,
        feet = malignance.feet,
        neck = "Moonlight Necklace",
        waist = "Acuity Belt +1",
        ear1 = "Digni. Earring",
        ear2 = "Crep. Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Metamor. Ring +1",
        back = back.vitws
    }
    sets.WS.Cataclysm = {
        ammo = "Pemphredo Tathlum",
        head = "Pixie Hairpin +1",
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Sibyl Scarf",
        waist = "Orpheus's Sash",
        left_ear = "Friomisi Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Archon Ring",
        right_ring = "Metamor. Ring +1",
        back = back.vitws
    }
    sets.WS.Generic = {
        ammo = "Knobkierrie",
        head = mpaca.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Monk's Nodowa +2",
        waist = "Moonbow Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = back.strda
    }
    sets.WS.MAB = {
        ammo = "Ghastly Tathlum +1",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = herc.feet.thmab,
        neck = "Sibyl Scarf",
        waist = "Eschan Stone",
        left_ear = "Friomisi Earring",
        right_ear = "Ishvara Earring",
        left_ring = "Metamor. Ring +1",
        right_ring = "Epaminondas's Ring",
        back = back.vitws
    }

    -- =========================================================================================================
    -- ***Job Ability Sets***
    -- =========================================================================================================
    sets.JA.Boost = {
        head = empty,
        body = empty,
        hands = empty,
        legs = empty,
        feet = empty,
        waist = "Ask Sash"
    }
    sets.JA["Hundred Fists"] = {
        legs = relic.legs
    }
    sets.JA.Chakra = {
        ammo = "Aurgelmir Orb +1",
        head = mpaca.head,
        body = af.body,
        hands = relic.hands,
        legs = tatenashi.legs,
        feet = mpaca.feet,
        neck = "Unmoving Collar +1",
        left_ear = "Tuisto Earring",
        right_ear = "Odnowa Earring +1",
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = back.vitws
    }
    sets.JA["Chi Blast"] = th_gear

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
    sets.precast.FastCast = {
        ammo = "Sapience Orb",
        head = herc.head.refresh,
        body = taeon.body.fcphalanx,
        hands = "Leyline Gloves",
        neck = "Orunmila's Torque",
        waist = "Moonbow Belt +1",
        left_ear = "Enchntr. Earring +1",
        right_ear = "Loquac. Earring",
        right_ring = "Rahab Ring"
    }

    sets.midcast[": Ni"] = th_gear

    -- =========================================================================================================
    -- ***Special Sets***
    -- =========================================================================================================
    sets.Distance = {
        waist = "Orpheus's Sash"
    }

end
