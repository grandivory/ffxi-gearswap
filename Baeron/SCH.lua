include('set-behavior')
include('augments')

lockstyleset = 20

function define_sets()
    Idle_Modes = T {'Refresh', 'Hybrid'}
    Magic_Modes = T {'MAB', 'Acc', 'Vagary', 'Sortie'}
    fastcast = .8

    back = {
        nuke = {
            name = "Lugh's Cape",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', '"Mag.Atk.Bns."+10', 'Spell interruption rate down-10%'}
        }
    }

    af = {
        head = "Acad. Mortarboard +1",
        body = "Acad. Gown +1",
        hands = "Acad. Bracers +3",
        legs = "Acad. Pants +3",
        feet = "Acad. Loafers +3"
    }

    relic = {
        head = "Pedagogy Mortarboard +3",
        legs = "Peda. Pants +1"
    }

    empy = {
        head = "Arbatel Bonnet +3",
        hands = "Arbatel Bracers +2",
        feet = "Arbatel Loafers +3",
        ear = "Arbatel Earring +1"
    }

    -- Not Engaged
    sets.Idle.Refresh = { -- Refresh +11~13, PDT -6% , MDT -12% , MDB +3
        main = "Contemplator +1", -- Refresh +1~2
        sub = "Oneiros Grip", -- Refresh +1
        ammo = "Homiliary", -- Refresh +1
        head = "Befouled Crown", -- Refresh +1
        body = jhakri.body, -- Refresh +4
        hands = agwu.hands, -- Resist Silence +10
        legs = "Assiduity Pants +1", -- Refresh +1~2
        feet = "Herald's Gaiters",
        neck = "Loricate Torque +1", -- DT -6%
        waist = "Slipor Sash", -- MDT -3%, MDB +3
        left_ear = "Etiolation Earring", -- MDT -3%, Resist Silence +15
        right_ear = "Regal Earring",
        left_ring = "Stikini Ring +1", -- Refresh +1
        right_ring = "Stikini Ring +1", -- Refresh +1
        back = back.nuke
    }
    sets.Idle.Refresh.withBuffs = {}
    sets.Idle.Refresh.withBuffs["Sublimation: Activated"] = set_combine(sets.Idle.Refresh, {
        waist = "Embla Sash"
    })
    sets.Idle.Hybrid = { -- Refresh +7~8,
        main = "Malignance Pole", -- DT -20%
        sub = "Khonsu", -- DT -6%
        ammo = "Homiliary", -- Refresh +1
        head = nyame.head, -- DT -7%
        body = jhakri.body, -- Refresh +4
        hands = nyame.hands, -- DT -7%
        legs = "Assiduity Pants +1", -- Refresh +1~2
        feet = "Herald's Gaiters",
        neck = "Loricate Torque +1", -- DT -6%
        waist = "Slipor Sash", -- MDT -3%, MDB +3
        left_ear = "Etiolation Earring", -- MDT -3%, Resist Silence +15
        right_ear = "Regal Earring",
        left_ring = "Defending Ring", -- DT -10%
        right_ring = "Stikini Ring +1", -- Refresh +1
        back = back.nuke
    }
    sets.Idle.Hybrid.withBuffs = {}
    sets.Idle.Hybrid.withBuffs["Sublimation: Activated"] = set_combine(sets.Idle.Hybrid, {
        waist = "Embla Sash"
    })

    -- Engaged Sets
    sets.TP = {
        main = "Malignance Pole",
        sub = "Khonsu",
        ammo = "Amar Cluster",
        head = "Blistering Sallet +1",
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Sanctity Necklace",
        waist = "Windbuffet Belt +1",
        left_ear = "Crep. Earring",
        right_ear = "Telos Earring",
        left_ring = "Chirich Ring +1",
        right_ring = "Chirich Ring +1",
        back = back.nuke
    }

    -- WS Sets
    sets.WS["Myrkr"] = {
        ammo = "Ghastly Tathlum +1", -- MP +35
        head = "Pixie Hairpin +1", -- MP +120
        body = amalric.body, -- MP +153
        hands = "Vanya Cuffs", -- MP +94
        legs = psycloth.legs, -- MP +109
        feet = psycloth.feet, -- MP +124
        neck = "Sanctity Necklace", -- MP +35
        waist = "Fucho-no-obi", -- MP +30
        left_ear = { -- TP +250
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Etiolation Earring", -- MP +50v dfgsdfgdfs
        left_ring = "Lebeche Ring", -- MP +40
        right_ring = { -- MP +20
            name = "Dark Ring",
            augments = {'Phys. dmg. taken -5%', 'Magic dmg. taken -6%'}
        },
        back = "Aurist's Cape +1" -- MP +40
    }

    sets.JA["Tabula Rasa"] = {
        legs = relic.legs
    }

    -- =========================================================================================================
    -- ***Item Sets***
    -- =========================================================================================================
    sets.item["Holy Water"] = {
        neck = "Nicander's Necklace",
        left_ring = "Purity Ring",
        right_ring = "Blenmot's Ring +1"
    }

    -- Precast sets for spells
    sets.precast.FastCast = { -- 83%
        ammo = "Sapience Orb", -- 2%
        head = "Vanya Hood", -- 10%
        body = "Zendik Robe", -- 13%
        hands = af.hands, -- 9%
        legs = "Volte Brais", -- 8%
        feet = af.feet, -- 12%
        neck = "Orunmila's Torque", -- 5%
        waist = "Embla Sash", -- 5%
        left_ear = "Loquac. Earring", -- 2%
        right_ear = "Malignance Earring", -- 4%
        left_ring = "Kishar Ring", -- 4%
        right_ring = "Rahab Ring", -- 2%
        back = "Fi Follet Cape +1" -- 10%
    }
    sets.precast.Impact = set_combine(sets.precast.FastCast, {
        body = "Crepuscular Cloak"
    })
    sets.precast.Dispelga = set_combine(sets.precast.FastCast, {
        main = "Daybreak",
        sub = "Genmei Shield"
    })

    -- Midcast sets for spells
    sets.midcast.Cure = {
        head = "Vanya Hood", -- 10% Potency
        body = "Annointed Kalasiris", -- 10% Potency
        hands = "Vanya Cuffs", -- 7% Potency
        legs = af.legs, -- 15% Potency
        feet = "Vanya Clogs", -- 10% potency
        neck = "Incanter's Torque",
        waist = "Sacro Cord",
        left_ear = "Mendicant's Earring", -- 5%
        right_ear = "Regal Earring",
        left_ring = "Lebeche Ring", -- 3%
        right_ring = "Haoma's Ring"
    }
    sets.midcast.Curaga = sets.midcast.Cure
    sets.midcast.CureSelf = set_combine(sets.midcast.Cure, {
        neck = "Phalaina Locket",
        waist = "Gishdubar Sash",
        right_ring = "Kunaji Ring"
    })
    sets.midcast.Cursna = set_combine(sets.midcast.Cure, {
        main = "Gada",
        sub = "Genmei Shield",
        hands = "Hieros Mittens",
        legs = af.legs,
        feet = "Vanya Clogs",
        neck = "Incanter's Torque",
        waist = "Gishdubar Sash",
        left_ear = "Meili Earring",
        left_ring = "Menelaus's Ring",
        right_ring = "Haoma's Ring"
    })

    sets.midcast.Enhancing = { -- +121
        main = "Gada", -- +18, Duration +5%
        sub = "Ammurapi Shield", -- Duration +10%
        head = "Befouled Crown", -- +16
        body = telchine.body.enhfc, -- +12
        hands = "Chironic Gloves", -- +15
        legs = af.legs, -- +24
        feet = telchine.feet.enhfc,
        neck = "Incanter's Torque", -- +10
        waist = "Embla Sash", -- Duration +10%
        left_ear = "Andoaa Earring", -- +5
        left_ring = "Stikini Ring +1", -- +8
        right_ring = "Stikini Ring +1", -- +8
        back = "Fi Follet Cape +1" -- +9
    }
    sets.midcast.EnhancingDuration = set_combine(sets.midcast.Enhancing, {
        main = "Gada", -- +18, Duration +5%
        sub = "Ammurapi Shield", -- Duration +10%
        head = telchine.head.enhfc,
        body = telchine.body.enhfc,
        hands = telchine.hands.enhfc,
        legs = telchine.legs.enhfc,
        feet = telchine.feet.enhfc,
        waist = "Embla Sash" -- Duration +10%
    })
    sets.midcast.Regen = set_combine(sets.midcast.EnhancingDuration, {
        main = "Bolelabunga", -- 10% +1 Potency
        sub = "Ammurapi Shield", -- Duration +10
        head = empy.head,
        back = back.nuke -- Duration + 15
    })
    sets.midcast.Stoneskin = set_combine(sets.midcast.EnhancingDuration, {
        waist = "Siegel Sash"
    })

    sets.midcast.Elemental = {
        main = "Bunzi's Rod",
        sub = "Ammurapi Shield",
        ammo = "Pemphredo Tathlum",
        head = relic.head,
        body = amalric.body,
        hands = amalric.hands,
        legs = agwu.legs,
        feet = agwu.feet,
        neck = "Baetyl Pendant",
        waist = "Sacro Cord",
        left_ear = "Regal Earring",
        right_ear = empy.ear,
        left_ring = "Freke Ring",
        right_ring = "Metamorph Ring +1",
        back = back.nuke
    }
    sets.midcast.Aero = set_combine(sets.midcast.Elemental, {
        main = "Marin Staff +1",
        sub = "Enki Strap"
    })
    sets.midcast.Stone = set_combine(sets.midcast.Elemental, {
        neck = "Quanpur Necklace"
    })
    sets.midcast.Elemental.Acc = set_combine(sets.midcast.Elemental, {
        main = "Contemplator +1",
        sub = "Khonsu",
        hands = agwu.hands,
        feet = af.feet,
        left_ring = "Kishar Ring"
    })
    sets.midcast.Elemental.Vagary = {
        main = "Contemplator +1",
        sub = "Khonsu",
        ammo = "Pemphredo Tathlum",
        head = "Befouled Crown",
        body = jhakri.body,
        hands = jhakri.hands,
        legs = psycloth.legs,
        feet = af.feet,
        neck = "Loricate Torque +1",
        waist = "Luminary Sash",
        left_ear = "Etiolation Earring",
        right_ear = "Enchntr. Earring +1",
        left_ring = "Metamor. Ring +1",
        right_ring = "Rahab Ring",
        back = back.nuke
    }
    sets.midcast.ElementalMB = set_combine(sets.midcast.Elemental, {
        head = relic.head,
        body = amalric.body,
        hands = amalric.hands,
        legs = agwu.legs,
        feet = agwu.feet,
        right_ring = "Mujin Band"
    })
    sets.midcast.ElementalMB.Acc = set_combine(sets.midcast.ElementalMB, {
        main = "Contemplator +1"
    })
    sets.midcast.AeroMB = set_combine(sets.midcast.ElementalMB, {
        main = "Marin Staff +1",
        sub = "Enki Strap"
    })
    sets.midcast.StoneMB = set_combine(sets.midcast.ElementalMB, {
        neck = "Quanpur Necklace"
    })

    sets.midcast.helix = set_combine(sets.midcast.Elemental, {
        main = "Bunzi's Rod",
        sub = "Culminus",
        ammo = "Ghastly Tathlum +1",
        head = agwu.head,
        body = agwu.body,
        hands = agwu.hands,
        legs = agwu.legs,
        feet = agwu.feet,
        neck = "Argute Stole +2",
        waist = "Sacro Cord"
    })
    sets.midcast.helix.Sortie = { -- 63% FC
        main = "Malignance Pole",
        sub = "Khonsu",
        ammo = "Sapience Orb", -- 2% FC
        head = "Pixie Hairpin +1",
        body = "Zendik Robe", -- 13% FC
        hands = "Gendewitha Gages +1", -- 7% FC
        legs = "Psycloth Lappas", -- 7% FC
        feet = telchine.feet.enhfc, -- 5% FC
        neck = "Orunmila's Torque", -- 5% FC
        waist = "Embla Sash", -- 5% FC
        left_ear = "Etiolation Earring", -- 1% FC
        right_ear = "Loquac. Earring", -- 2% FC
        left_ring = "Kishar Ring", -- 4% FC
        right_ring = "Rahab Ring", -- 2% FC
        back = "Fi Follet Cape +1" -- 10% FC
    }
    sets.midcast.helixMB = set_combine(sets.midcast.helix, {
        head = relic.head,
        left_ring = "Mujin Band"
    })
    sets.midcast.Luminohelix = set_combine(sets.midcast.helix, {
        main = "Daybreak"
    })
    sets.midcast.Kaustra = set_combine(sets.midcast.Elemental, {
        head = "Pixie Hairpin +1",
        right_ring = "Archon Ring"
    })
    sets.midcast.Kaustra.Acc = set_combine(sets.midcast.Kaustra, {
        main = "Contemplator +1",
        sub = "Khonsu"
    })
    sets.midcast.Impact = set_combine(sets.midcast.Kaustra, {
        main = "Contemplator +1",
        sub = "Khonsu",
        head = empty,
        body = "Crepuscular Cloak"
    })

    sets.midcast.DarkMagic = {
        main = "Rubicundity",
        sub = "Genmei Shield",
        ammo = "Ghastly Tathlum +1",
        head = "Pixie Hairpin +1",
        body = jhakri.body,
        hands = jhakri.hands,
        legs = relic.legs,
        feet = amalric.feet,
        neck = "Erra Pendant",
        left_ear = "Regal Earring",
        right_ear = empy.ear,
        left_ring = "Archon Ring",
        right_ring = "Shiva Ring +1",
        back = "Bookworm's Cape"
    }
    sets.midcast.Drain = set_combine(sets.midcast.DarkMagic, {
        ammo = "Pemphredo Tathlum",
        feet = agwu.feet,
        neck = "Erra Pendant",
        right_ring = "Evanescence Ring"
    })
    sets.midcast.Aspir = sets.midcast.Drain

    enfeeblingSet = {
        main = "Contemplator +1", -- MAcc +70
        sub = "Khonsu", -- MAcc +30
        ammo = "Pemphredo Tathlum", -- MAcc +8
        head = jhakri.head, -- MAcc +44
        body = jhakri.body, -- MAcc +46
        hands = af.hands, -- MAcc +48
        legs = af.legs, -- MAcc +49, "Light Arts" + 24
        feet = af.feet, -- MAcc +66
        neck = "Argute Stole +2", -- Macc +30
        waist = "Luminary Sash", -- MAcc +10
        left_ear = "Regal Earring", -- MAcc +15
        right_ear = "Malignance Earring", -- MAcc +10, INT+8, MND+8
        left_ring = "Stikini Ring +1", -- MAcc +11
        right_ring = "Metamorph Ring +1", -- MAcc +11~15
        back = back.nuke -- MAcc +20

    }
    sets.midcast.Enfeebling = enfeeblingSet
    sets.midcast.Dispelga = set_combine(sets.midcast.Enfeebling, {
        main = "Daybreak",
        sub = "Ammurapi Shield"
    })
    sets.midcast.Stun = enfeeblingSet

    -- Pieces to switch out when buffs are active
    sets.midcast.mod.Perpetuance = {
        hands = empy.hands
    }
    sets.midcast.mod.Ebullience = {
        head = empy.head
    }
    sets.midcast.mod.Rapture = {
        head = empy.head
    }
    sets.midcast.mod.Klimaform = {
        feet = empy.feet
    }

    -- Pieces to switch out when the day/weather matches
    sets.Weather = {
        -- main = "Chatoyant Staff",
        -- sub = "Khonsu",
        waist = "Hachirin-no-obi",
        back = "Twilight Cape"
    }

    sets.Distance = {
        waist = "Orpheus's Sash"
    }

    sets.WakeUp = {
        main = "Prime Staff"
    }
end
