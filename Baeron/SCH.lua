include('set-behavior')
include('organizer-lib')
include('augments')

lockstyleset = 20

function define_sets()
    Idle_Modes = T {'Idle', 'DT'}
    Magic_Modes = T {'Acc', 'MAB', 'Vagary'}
    fastcast = .8

    back = {
        nuke = {
            name = "Lugh's Cape",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', '"Mag.Atk.Bns."+10', 'Spell interruption rate down-10%'}
        }
    }

    -- Not Engaged
    sets.Idle.Idle = {
        main = "Contemplator +1", -- Refresh +1~2
        sub = "Oneiros Grip",
        ammo = "Homiliary",
        head = "Befouled Crown",
        body = "Jhakri Robe +2",
        hands = "Agwu's Gages",
        legs = "Assiduity Pants +1",
        feet = "Herald's Gaiters",
        neck = "Loricate Torque +1",
        waist = "Slipor Sash",
        left_ear = "Etiolation Earring",
        right_ear = "Regal Earring",
        left_ring = "Defending Ring",
        right_ring = {
            name = "Dark Ring",
            augments = {'Phys. dmg. taken -5%', 'Magic dmg. taken -6%'}
        },
        back = back.nuke
    }
    sets.Idle.Idle.withBuffs = {}
    sets.Idle.Idle.withBuffs["Sublimation: Activated"] = set_combine(sets.Idle.Idle, {
        waist = "Embla Sash"
    })
    sets.Idle.DT = set_combine(sets.Idle.Idle, { -- 47% PDT, 50% MDT, 4 MDB
        main = "Malignance Pole", -- 20%
        sub = "Khonsu", -- 6%
        ammo = "Vanir Battery", -- MDB +4
        neck = "Loricate Torque +1", -- 6%
        left_ear = "Etiolation Earring", -- 3% MDT
        right_ear = "Tuisto Earring",
        left_ring = "Defending Ring", -- 10% DT
        right_ring = {
            name = "Dark Ring",
            augments = {'Phys. dmg. taken -5%', 'Magic dmg. taken -6%'}
        }
    })
    sets.Idle.DT.withBuffs = {}
    sets.Idle.DT.withBuffs["Sublimation: Activated"] = set_combine(sets.Idle.DT, {
        waist = "Embla Sash"
    })

    -- Engaged Sets
    -- sets.TP.Att = {}

    -- WS Sets
    sets.WS["Myrkr"] = {
        ammo = "Ghastly Tathlum +1", -- MP +35
        head = "Pixie Hairpin +1", -- MP +120
        body = "Amalric Doublet", -- MP +133
        hands = "Vanya Cuffs", -- MP +94
        legs = "Psycloth Lappas", -- MP +109
        feet = "Psycloth Boots", -- MP +124
        neck = "Sanctity Necklace", -- MP +35
        waist = "Eschan Stone", -- MP +20
        left_ear = { -- TP +250
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Etiolation Earring", -- MP +50
        left_ring = "Lebeche Ring", -- MP +40
        right_ring = { -- MP +20
            name = "Dark Ring",
            augments = {'Phys. dmg. taken -5%', 'Magic dmg. taken -6%'}
        },
        back = "Aurist's Cape" -- MP +40
    }

    sets.JA["Tabula Rasa"] = {
        legs = "Peda. Pants +1"
    }

    -- Precast sets for spells
    sets.precast.FastCast = { -- 83%
        ammo = "Sapience Orb", -- 2%
        head = "Vanya Hood", -- 10%
        body = "Zendik Robe", -- 13%
        hands = "Leyline Gloves", -- 7%
        legs = "Agwu's Slops", -- 7%
        feet = "Acad. Loafers +3", -- 12%
        neck = "Orunmila's Torque", -- 5%
        waist = "Embla Sash", -- 5%
        left_ear = "Loquac. Earring", -- 2%
        right_ear = "Malignance Earring", -- 4%
        left_ring = "Kishar Ring", -- 4%
        right_ring = "Rahab Ring", -- 2%
        back = "Fi Follet Cape +1" -- 10%
    }
    sets.precast.Impact = set_combine(sets.precast.FastCast, {
        body = "Twilight Cloak"
    })
    sets.precast.Dispelga = set_combine(sets.precast.FastCast, {
        main = "Daybreak",
        sub = "Genmei Shield"
    })

    -- Midcast sets for spells
    sets.midcast.Cure = {
        head = "Vanya Hood", -- 10% Potency
        body = "Heka's Kalasiris", -- 15% Potency
        hands = "Vanya Cuffs", -- 7% Potency
        legs = "Gyve Trousers", -- 10% Potency
        feet = "Vanya Clogs", -- 10% potency
        neck = "Incanter's Torque",
        waist = "Luminary Sash",
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
        feet = "Vanya Clogs",
        neck = "Incanter's Torque",
        waist = "Gishdubar Sash",
        left_ear = "Meili Earring",
        left_ring = "Haoma's Ring",
        right_ring = "Haoma's Ring"
    })

    sets.midcast.Enhancing = { -- +105
        main = "Gada", -- +18, Duration +5%
        sub = "Ammurapi Shield", -- Duration +10%
        head = "Befouled Crown", -- +16
        body = telchine.body.enhfc, -- +12
        hands = "Chironic Gloves", -- +15
        legs = "Acad. Pants +1", -- +20
        feet = telchine.feet.enhfc,
        neck = "Incanter's Torque", -- +10
        left_ear = "Andoaa Earring", -- +5
        waist = "Embla Sash", -- Duration +10%
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
        head = "Arbatel Bonnet +1",
        back = back.nuke -- Duration + 15
        
    })
    sets.midcast.Stoneskin = set_combine(sets.midcast.EnhancingDuration, {
        waist = "Siegel Sash"
    })

    sets.midcast.Elemental = {
        main = {
            name = "Grioavolr",
            augments = {'Enfb.mag. skill +11', 'INT+9', 'Mag. Acc.+28', '"Mag.Atk.Bns."+23'}
        },
        sub = "Khonsu",
        ammo = "Ghastly Tathlum +1",
        head = "Jhakri Coronal +2",
        body = "Jhakri Robe +2",
        hands = "Jhakri Cuffs +2",
        legs = "Jhakri Slops +2",
        feet = "Jhakri Pigaches +2",
        neck = "Baetyl Pendant",
        waist = "Eschan Stone",
        left_ear = "Malignance Earring",
        right_ear = "Regal Earring",
        left_ring = "Freke Ring",
        right_ring = "Metamorph Ring +1",
        back = back.nuke
    }
    sets.midcast.Elemental.withBuffs = {}
    sets.midcast.Elemental.withBuffs['Klimaform'] = set_combine(sets.midcast.Elemental, {
        feet = "Arbatel Loafers +1"
    })
    sets.midcast.Elemental.Acc = set_combine(sets.midcast.Elemental, {
        main = "Contemplator +1",
        ammo = "Pemphredo Tathlum",
        feet = "Acad. Loafers +3",
        neck = "Sanctity Necklace",
        left_ring = "Kishar Ring"
    })
    sets.midcast.Elemental.Vagary = {
        main = "Contemplator +1",
        sub = "Khonsu",
        ammo = "Pemphredo Tathlum",
        head = "Befouled Crown",
        body = "Jhakri Robe +2",
        hands = "Jhakri Cuffs +2",
        legs = "Psycloth Lappas",
        feet = "Acad. Loafers +3",
        neck = "Loricate Torque +1",
        waist = "Luminary Sash",
        left_ear = "Etiolation Earring",
        right_ear = "Enchntr. Earring +1",
        left_ring = "Metamor. Ring +1",
        right_ring = "Rahab Ring",
        back = back.nuke
    }
    sets.midcast.ElementalMB = set_combine(sets.midcast.Elemental, {
        head = "Agwu's Cap",
        body = "Agwu's Robe",
        hands = "Agwu's Gages",
        legs = "Agwu's Slops",
        feet = "Agwu's Pigaches",
        neck = "Mizu. Kubikazari",
        left_ring = "Mujin Band"
    })
    sets.midcast.ElementalMB.Acc = set_combine(sets.midcast.ElementalMB, {
        main = "Contemplator +1"
    })
    sets.midcast.Helix = set_combine(sets.midcast.Elemental, {
        main = "Bunzi's Rod",
        sub = "Culminus",
        ammo = "Ghastly Tathlum +1",
        head = "Agwu's Cap",
        body = "Agwu's Robe",
        hands = "Agwu's Gages",
        legs = "Agwu's Slops",
        feet = "Agwu's Pigaches"
    })
    -- sets.midcast.Helix.Acc = set_combine(sets.midcast.Helix, {
    --     main = "Contemplator +1",
    --     sub = "Khonsu"
    -- })
    sets.midcast.Helix.withBuffs = {}
    sets.midcast.Helix.withBuffs['Klimaform'] = set_combine(sets.midcast.Helix, {
        feet = "Arbatel Loafers +1"
    })
    sets.midcast.Helix.withBuffs['Klimaform'].Acc = set_combine(sets.midcast.Helix.withBuffs['Klimaform'], {
        main = "Contemplator +1",
        sub = "Khonsu"
    })
    sets.midcast.Luminohelix = set_combine(sets.midcast.Helix, {
        main = "Daybreak"
    })
    sets.midcast.Luminohelix.withBuffs = {}
    sets.midcast.Luminohelix.withBuffs['Klimaform'] = set_combine(sets.midcast.Luminohelix, {
        feet = "Arbatel Loafers +1"
    })
    sets.midcast["Luminohelix II"] = sets.midcast.Luminohelix
    sets.midcast.Kaustra = set_combine(sets.midcast.Elemental, {
        head = "Pixie Hairpin +1",
        feet = "Jhakri Pigaches +2",
        right_ring = "Archon Ring"
    })
    sets.midcast.Kaustra.Acc = set_combine(sets.midcast.Kaustra, {
        main = "Contemplator +1",
        sub = "Khonsu"
    })
    sets.midcast.Kaustra.withBuffs = {}
    sets.midcast.Kaustra.withBuffs['Klimaform'] = set_combine(sets.midcast.Kaustra, {
        feet = "Arbatel Loafers +1"
    })
    sets.midcast.Kaustra.withBuffs['Klimaform'].Acc = set_combine(sets.midcast.Kaustra.withBuffs['Klimaform'], {
        main = "Contemplator +1",
        sub = "Khonsu"
    })
    sets.midcast.Impact = set_combine(sets.midcast.Kaustra, {
        main = "Contemplator +1",
        sub = "Khonsu",
        head = empty,
        body = "Twilight Cloak"
    })

    sets.midcast.DarkMagic = {
        main = "Rubicundity",
        sub = "Genmei Shield",
        ammo = "Ghastly Tathlum +1",
        head = "Pixie Hairpin +1",
        body = "Jhakri Robe +2",
        hands = "Jhakri Cuffs +2",
        legs = "Peda. Pants +1",
        feet = "Amalric Nails",
        neck = "Erra Pendant",
        left_ear = "Malignance Earring",
        right_ear = "Mani Earring",
        left_ring = "Archon Ring",
        right_ring = "Shiva Ring +1",
        back = "Bookworm's Cape"
    }
    sets.midcast.Drain = set_combine(sets.midcast.DarkMagic, {
        ammo = "Pemphredo Tathlum",
        feet = "Agwu's Pigaches",
        neck = "Erra Pendant",
        right_ring = "Evanescence Ring"
    })
    sets.midcast.Aspir = sets.midcast.Drain

    enfeeblingSet = {
        main = "Contemplator +1", -- MAcc +70
        sub = "Khonsu", -- MAcc +30
        ammo = "Pemphredo Tathlum", -- MAcc +8
        head = "Jhakri Coronal +2", -- MAcc +44
        body = "Jhakri Robe +2", -- MAcc +46
        hands = "Jhakri Cuffs +2", -- MAcc +43
        legs = "Psycloth Lappas", -- MAcc +45, Enfeebling +18
        feet = "Acad. Loafers +3", -- MAcc +66
        neck = "Incanter's Torque", -- Enfeebling +10
        waist = "Luminary Sash", -- MAcc +10
        left_ear = "Malignance Earring", -- MAcc +10
        right_ear = "Regal Earring", -- MAcc +15
        left_ring = "Kishar Ring",
        right_ring = "Metamorph Ring +1", -- MAcc +11~15
        back = back.nuke -- MAcc +20
        
    }
    sets.midcast.Enfeebling = enfeeblingSet
    sets.midcast.Enfeebling.withBuffs = {}
    sets.midcast.Enfeebling.withBuffs["Dark Arts"] = set_combine(enfeeblingSet, {
        body = "Acad. Gown +1" -- Enfeebling +20
    })
    sets.midcast.Dispelga = set_combine(sets.midcast.Enfeebling, {
        main = "Daybreak",
        sub = "Ammurapi Shield"
    })

    -- Pieces to switch out when buffs are active
    sets.midcast.mod.Perpetuance = {
        hands = "Arbatel Bracers +1"
    }
    sets.midcast.mod.Immanence = {
        hands = "Arbatel Bracers +1"
    }
    sets.midcast.mod.Ebullience = {
        head = "Arbatel Bonnet +1"
    }
    sets.midcast.mod.Rapture = {
        head = "Arbatel Bonnet +1"
    }

    -- Pieces to switch out when the day/weather matches
    sets.Weather = {
        -- main = "Chatoyant Staff",
        -- sub = "Khonsu",
        waist = "Hachirin-no-obi",
        back = "Twilight Cape"
    }

    organizer_items = {
        bseals = "Beastmen's Seal",
        kseals = "Kindred's Seal",
        kcrests = "Kindred's Crest",
        hkcrests = "High Kindred's Crest",
        skcrest = "Sacred Kindred's Crest",
        warp_ring = "Warp Ring",
        caliber_ring = "Caliber Ring",
        vocation_ring = "Vocation Ring",
        facility_ring = "Facility Ring",
        aptitude_mantle = "Aptitude Mantle"
    }
end
