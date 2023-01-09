include('augments')
include('set-behavior')

-- Set this to to /equipset you want to use for your lockstyle
lockstyleset = 19

function define_sets()
    Melee_Modes = T {'Club', 'Staff'}
    Idle_Modes = T {'Speed', 'Refresh'}
    Magic_Modes = T {'MAB', 'Acc'}

    fastcast = .8 -- This defines how much fast cast you have, which is used when canceling spell effects (.8 = 80%)

    af = {
        head = "Geomancy Galero +1",
        body = "Geomancy Tunic +1",
        hands = "Geomancy Mitaines +1",
        legs = "Geomancy Pants +1",
        feet = "Geomancy Sandals +1"
    }

    relic = {
        head = "Bagua Galero +1",
        body = "Bagua Tunic +1",
        hands = "Bagua Mitaines +1",
        legs = "Bagua Pants +1",
        feet = "Bagua Sandals +1"
    }

    empy = {
        head = "Azimuth Hood +2",
        body = "Azimuth Coat +1",
        hands = "Azimuth Gloves +1",
        legs = "Azimuth Tights +1",
        feet = "Azimuth Gaiters +2"
    }

    back = {
        luopan = {},
        mab = {},
        macc = {},
        tp = {},
        strws = {},
        mabws = {},
        indi = "Lifestream Cape"
    }

    th = {
        ammo = "Per. Lucky Egg",
        waist = "Chaac Belt",
        legs = "Volte Hose"
    }

    -- =========================================================================================================
    -- ***Not Engaged Sets***
    -- =========================================================================================================
    sets.Idle = { -- 83% PDT, 76% MDT, Refresh +3
        main = "Malignance Pole", -- 20% DT
        sub = "Khonsu", -- 6% DT
        ammo = "Staunch Tathlum +1", -- 3% DT
        head = nyame.head, -- 7% DT
        body = nyame.body, -- 9% DT
        hands = nyame.hands, -- 7% DT
        legs = nyame.legs, -- 8% DT
        feet = nyame.feet, -- 7% DT
        neck = "Loricate Torque +1", -- 6% DT
        waist = "Fucho-no-Obi", -- Refresh +1
        left_ear = "Etiolation Earring", -- 3% MDT
        right_ear = "Halasz Earring", -- MP +45
        left_ring = "Stikini Ring +1", -- Refresh +1
        right_ring = "Stikini Ring +1", -- Refresh +1
        back = back.tp -- 10% PDT
    }
    sets.Idle.Speed = set_combine(sets.Idle, {
        feet = af.feet
    })
    sets.Idle.Refresh = set_combine(sets.Idle, { -- +10~14
        main = "Contemplator +1", -- +1~2
        sub = "Oneiros Grip", -- +1 sub 75%
        head = chironic.head.refresh, -- +2
        body = jhakri.body, -- +4
        legs = "Assiduity Pants +1", -- +1~2
        waist = "Fucho-no-Obi", -- +1 sub 50%
        left_ring = "Stikini Ring +1", -- +1
        right_ring = "Stikini Ring +1" -- +1
    })

    -- With a luopan out
    sets.Idle_Pet = {
        main = "Solstice",
        sub = "Genmei Shield",
        ammo = "Staunch Tathlum +1",
        head = empy.head,
        body = af.body,
        hands = af.hands,
        legs = nyame.legs,
        feet = relic.feet,
        neck = "Loricate Torque +1",
        waist = "Isa Belt",
        left_ear = "Etiolation Earring",
        right_ear = "Halasz Earring",
        left_ring = "Defending Ring",
        right_ring = "Stikini Ring +1",
        back = back.luopan
    }

    -- =========================================================================================================
    -- ***Engaged Sets***
    -- =========================================================================================================
    sets.TP.Club = {
        main = "Maxentius",
        sub = "Genmei Shield",
        ammo = "Amar Cluster",
        head = nyame.head,
        body = nyame.body,
        hands = gazu.bracelet,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Combatant's Torque",
        waist = "Grunfeld Rope",
        left_ear = "Telos Earring",
        right_ear = "Crepuscular Earring",
        left_ring = "Chirich Ring +1",
        right_ring = "Chirich Ring +1",
        back = back.tp
    }
    sets.TP.Staff = {
        main = "Malignance Pole",
        sub = "Khonsu",
        ammo = "Amar Cluster",
        head = nyame.head,
        body = nyame.body,
        hands = gazu.bracelet,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Combatant's Torque",
        waist = "Grunfeld Rope",
        left_ear = "Telos Earring",
        right_ear = "Crepuscular Earring",
        left_ring = "Chirich Ring +1",
        right_ring = "Chirich Ring +1",
        back = back.tp
    }

    -- =========================================================================================================
    -- ***Weapon Skill Sets***
    -- =========================================================================================================
    sets.WS.Generic = set_combine(geo, {
        ammo = "Amar Cluster",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Rep. Plat. Medal",
        waist = "Grunfeld Rope",
        left_ear = "Moonshade Earring",
        right_ear = "Ishvara Earring",
        left_ring = "Metamor. Ring +1",
        right_ring = "Rufescent Ring",
        back = back.strws
    }) -- Any physical weapon skill that isn't otherwise specified
    sets.WS.MAB = {
        ammo = "Ghastly Tathlum +1",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Sibyl Scarf",
        waist = "Orpheus's Sash",
        left_ear = "Moonshade Earring",
        right_ear = "Regal Earring",
        left_ring = "Metamor. Ring +1",
        right_ring = "Freke Ring",
        back = back.mabws

    } -- Any magical weapon skill that isn't otherwise specified

    -- =========================================================================================================
    -- ***Job Ability Sets***
    -- =========================================================================================================
    sets.JA["Life Cycle"] = {
        body = af.body,
        back = back.luopan
    }
    sets.JA.Bolster = {
        body = relic.body
    }
    sets.JA["Mending Halation"] = {
        legs = relic.legs
    }
    sets.JA["Radial Arcana"] = {
        feet = relic.feet
    }
    sets.JA["Full Circle"] = {
        head = empy.head
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
    sets.precast.FastCast = { -- 83%
        main = "Solstice", -- 5%
        sub = "Genmei Shield",
        range = "Dunna", -- 3%
        head = amalric.head, -- 11%
        body = "Zendik Robe", -- 13%
        hands = agwu.hands, -- 6%
        legs = af.legs, -- 9~15%
        feet = amalric.feet, -- 6%,
        neck = "Orunmila's Torque", -- 5%,
        waist = "Embla Sash", -- 5%,
        left_ear = "Malignance Earring", -- 4%
        right_ear = "Etiolation Earring", -- 1%
        left_ring = "Kishar Ring", -- 4%,
        right_ring = "Rahab Ring", -- 2%
        back = "Fi Follet Cape +1" -- 10%
    }
    sets.precast.Geomancy = set_combine(sets.precast.FastCast, {
        range = "Dunna",
        ammo = empty
    })
    sets.precast.Impact = set_combine(sets.precast.FastCast, {
        head = empty,
        body = "Crepuscular Cloak"
    })

    -- =========================================================================================================
    -- ***Midcast Sets for Spells***
    -- =========================================================================================================
    sets.midcast["Indi-"] = {
        main = "Solstice",
        sub = "Genmei Shield",
        range = "Dunna",
        ammo = empty,
        head = empy.head,
        body = relic.body,
        hands = af.hands,
        legs = relic.legs,
        feet = empy.feet,
        neck = "Incanter's Torque",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = back.indi
    }
    sets.midcast["Geo-"] = {
        main = "Solstice",
        sub = "Genmei Shield",
        range = "Dunna",
        ammo = empty,
        head = empy.head,
        body = relic.body,
        hands = af.hands,
        legs = relic.legs,
        feet = "Medium's Sabots",
        neck = "Incanter's Torque",
        -- neck = "Bagua Charm +2",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = back.indi
    }

    sets.midcast.Healing = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        ammo = "Psilomene",
        head = vanya.head,
        body = "Vrikodara Jupon",
        hands = vanya.hands,
        legs = vanya.legs,
        feet = vanya.feet,
        neck = "Incanter's Torque",
        waist = "Luminary Sash",
        left_ear = "Meili Earring",
        right_ear = "Mendicant's Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = "Altruistic Cape"
    }

    sets.midcast.Cur = set_combine(sets.midcast.Healing, {
        legs = "Gyve Trousers"
        -- back = back.macc
    })
    sets.midcast.CurSelf = set_combine(sets.midcast.Cur, {
        neck = "Phalaina Locket",
        waist = "Gishdubar Sash",
        left_ring = "Kunaji Ring"
    })

    sets.midcast.Cursna = set_combine(sets.midcast.Healing, {
        hands = "Hieros Mittens",
        feet = vanya.feet,
        neck = "Debilis Medallion",
        left_ring = "Haoma's Ring",
        right_ring = "Menelaus's Ring"
    })

    sets.midcast.Enhancing = {
        main = "Gada",
        sub = "Ammurapi Shield",
        ammo = "Pemphredo Tathlum",
        head = "Befouled Crown",
        body = telchine.body.enhfc,
        hands = telchine.hands.enhfc,
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
        main = "Gada",
        sub = "Ammurapi Shield",
        head = telchine.head.enhfc,
        body = telchine.body.enhfc,
        hands = telchine.hands.enhfc,
        legs = telchine.legs.enhfc,
        feet = telchine.feet.enhfc
    })

    sets.midcast.Stoneskin = set_combine(sets.midcast.Enhancing, {
        legs = "Shedir Seraweels",
        neck = "Nodens Gorget",
        waist = "Siegel Sash"
    })
    sets.midcast.Aquaveil = set_combine(sets.midcast.Enhancing, {
        head = amalric.head,
        hands = "Regal Cuffs"
    })
    sets.midcast.Refresh = set_combine(sets.midcast.EnhancingDuration, {
        head = amalric.head
    })
    sets.midcast.Regen = set_combine(sets.midcast.EnhancingDuration, {
        main = "Bolelabunga",
        sub = "Ammurapi Shield"
    })

    sets.midcast.Enfeebling = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        ammo = "Pemphredo Tathlum",
        head = "Cath Palug Crown",
        body = agwu.body,
        hands = "Regal Cuffs",
        legs = "Psycloth Lappas",
        -- legs = af.legs,
        feet = agwu.feet,
        neck = "Incanter's Torque",
        waist = "Luminary Sash",
        left_ear = "Malignance Earring",
        right_ear = "Regal Earring",
        left_ring = "Kishar Ring",
        right_ring = "Stikini Ring +1",
        back = back.macc
    }

    sets.midcast.Dispelga = set_combine(sets.midcast.Enfeebling, {
        main = "Daybreak",
        sub = "Ammurapi Shield"
    })

    sets.midcast.Elemental = {
        main = bunzi.rod,
        sub = "Ammurapi Shield",
        ammo = "Ghastly Tathlum +1",
        head = agwu.head,
        body = amalric.body,
        hands = amalric.hands,
        legs = agwu.legs,
        feet = agwu.feet,
        neck = "Baetyl Pendant",
        waist = "Sacro Cord",
        left_ear = "Malignance Earring",
        right_ear = "Regal Earring",
        left_ring = "Shiva Ring +1",
        right_ring = "Freke Ring",
        back = back.mab
    }
    sets.midcast.ElementalMB = {
        main = bunzi.rod,
        sub = "Ammurapi Shield",
        ammo = "Ghastly Tathlum +1",
        head = agwu.head,
        -- head = ea.head,
        body = amalric.body,
        -- body = ea.body,
        hands = amalric.hands,
        legs = agwu.legs,
        -- legs = ea.legs,
        feet = agwu.feet,
        -- feet = relic.feet,
        neck = "Mizukage-no-Kubikazari",
        waist = "Sacro Cord",
        left_ear = "Malignance Earring",
        right_ear = "Regal Earring",
        left_ring = "Mujin Band",
        right_ring = "Freke Ring",
        back = back.mab
    }
    sets.midcast.Elemental.Acc = {
        main = bunzi.rod,
        sub = "Ammurapi Shield",
        ammo = "Pemphredo Tathlum",
        head = agwu.head,
        body = agwu.body,
        hands = agwu.hands,
        legs = agwu.legs,
        feet = agwu.feet,
        neck = "Baetyl Pendant",
        waist = "Sacro Cord",
        left_ear = "Malignance Earring",
        right_ear = "Barkarole Earring",
        left_ring = "Metamor. Ring +1",
        right_ring = "Freke Ring",
        back = back.mab
    }
    sets.midcast.ElementalMB.Acc = {
        main = bunzi.rod,
        sub = "Ammurapi Shield",
        ammo = "Pemphredo Tathlum",
        head = agwu.head,
        -- head = ea.head,
        body = agwu.body,
        -- body = ea.body,
        hands = agwu.hands,
        legs = agwu.legs,
        -- legs = ea.legs,
        feet = agwu.feet,
        -- feet = relic.feet,
        neck = "Mizukage-no-Kubikazari",
        waist = "Sacro Cord",
        left_ear = "Malignance Earring",
        right_ear = "Barkarole Earring",
        left_ring = "Mujin Band",
        right_ring = "Freke Ring",
        back = back.mab
    }
    sets.midcast.Stone = set_combine(sets.midcast.Elemental, {
        neck = "Quanpur Necklace"
    })
    sets.midcast.Stone.Acc = set_combine(sets.midcast.Elemental, {
        neck = "Quanpur Necklace"
    })

    sets.midcast.Impact = set_combine(sets.midcast.Elemental.Acc, {
        head = empty,
        body = "Crepuscular Cloak"
    })

    sets.midcast.DarkMagic = {
        main = "Rubicundity",
        sub = "Ammurapi Shield",
        ammo = "Pemphredo Tathlum",
        head = "Cath Palug Crown",
        body = amalric.body,
        hands = agwu.hands,
        legs = agwu.legs,
        feet = agwu.feet,
        neck = "Incanter's Torque",
        waist = "Acuity Belt +1",
        left_ear = "Regal Earring",
        right_ear = "Mani Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Archon Ring",
        back = "Aurist's Cape +1"
    }
    sets.midcast.Drain = set_combine(sets.midcast.DarkMagic, {
        head = relic.head,
        body = merlinic.body.drainaspir,
        hands = merlinic.hands.drainaspir,
        feet = agwu.feet,
        neck = "Erra Pendant",
        waist = "Fucho-no-Obi",
        left_ring = "Evanescence Ring"
    })
    sets.midcast.Aspir = sets.midcast.Drain

    -- =========================================================================================================
    -- ***Special Gear***
    -- =========================================================================================================
    sets.Weather = {
        waist = "Hachirin-no-obi",
        back = "Twilight Cape"
    }

    sets.Distance = {
        waist = "Orpheus's Sash"
    }

    sets.WakeUp = {}

end
