include('set-behavior')
include('organizer-lib')

lockstyleset = 20

function define_sets()
    Idle_Modes = T {'Idle', 'DT'}
    Magic_Modes = T {'Acc', 'MAB'}
    fastcast = .8

    -- Not Engaged
    sets.Idle.Idle = {
        main = { -- Refresh +1
            name = "Akademos",
            augments = {'INT+15', '"Mag.Atk.Bns."+15', 'Mag. Acc.+15'}
        },
        sub = "Oneiros Grip",
        ammo = "Homiliary",
        head = "Befouled Crown",
        body = "Jhakri Robe +2",
        hands = "Serpentes Cuffs",
        legs = "Assiduity Pants +1",
        feet = "Herald's Gaiters",
        neck = "Loricate Torque +1",
        waist = "Slipor Sash",
        left_ear = "Meili Earring",
        right_ear = "Regal Earring",
        left_ring = "Defending Ring",
        right_ring = {
            name = "Dark Ring",
            augments = {'Phys. dmg. taken -5%', 'Magic dmg. taken -6%'}
        },
        back = {
            name = "Lugh's Cape",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', '"Mag.Atk.Bns."+10', 'Spell interruption rate down-10%'}
        }
    }
    sets.Idle.DT = { -- 50% DT, 4 MDB
        main = "Malignance Pole", -- 20%
        sub = "Khonsu", -- 6%
        ammo = "Vanir Battery", -- MDB +4
        hands = "Gendewitha Gages +1", -- 3% PDT
        neck = "Loricate Torque +1", -- 6%
        waist = "Slipor Sash", -- 3% MDT
        left_ring = "Defending Ring", -- 10% DT
        right_ring = {
            name = "Dark Ring",
            augments = {'Phys. dmg. taken -5%', 'Magic dmg. taken -6%'}
        }
    }

    -- Engaged Sets
    -- sets.TP.Att = {}

    -- WS Sets
    sets.WS["Myrkr"] = {
        sub = "Clemency Grip", -- MP +30
        ammo = "Ghastly Tathlum +1", -- MP +35
        head = "Pixie Hairpin +1", -- MP +120
        body = { -- MP +133
            name = "Amalric Doublet",
            augments = {'MP+60', 'Mag. Acc.+15', '"Mag.Atk.Bns."+15'}
        },
        hands = { -- MP +94
            name = "Vanya Cuffs",
            augments = {'MP+50', '"Cure" potency +7%', 'Enmity-6'}
        },
        legs = { -- MP +109
            name = "Psycloth Lappas",
            augments = {'MP+80', 'Mag. Acc.+15', '"Fast Cast"+7'}
        },
        feet = { -- MP +124
            name = "Psycloth Boots",
            augments = {'MP+50', 'INT+7', '"Conserve MP"+6'}
        },
        neck = "Sanctity Necklace", -- MP +35
        waist = "Eschan Stone", -- MP +20
        left_ear = { -- TP +250
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Halasz Earring", -- MP +45
        left_ring = { -- MP +20
            name = "Dark Ring",
            augments = {'Enemy crit. hit rate -3', 'Magic dmg. taken -4%', 'Phys. dmg. taken -6%'}
        },
        right_ring = { -- MP +20
            name = "Dark Ring",
            augments = {'Phys. dmg. taken -5%', 'Magic dmg. taken -6%'}
        },
        back = "Twilight Cape" -- MP +25
    }

    -- Precast sets for spells
    sets.precast.FastCast = { -- 78%
        main = "Oranyan", -- 7%
        sub = "Khonsu",
        ammo = "Sapience Orb", -- 2%
        head = { -- 10%
            name = "Vanya Hood",
            augments = {'MP+50', '"Fast Cast"+10', 'Haste+2%'}
        },
        body = "Anhur Robe", -- 10%
        hands = "Gendewitha Gages +1", -- 7%
        legs = { -- 7%
            name = "Psycloth Lappas",
            augments = {'MP+80', 'Mag. Acc.+15', '"Fast Cast"+7'}
        },
        feet = { -- 5%
            name = "Amalric Nails",
            augments = {'Mag. Acc.+15', '"Mag.Atk.Bns."+15', '"Conserve MP"+6'}
        },
        neck = "Orunmila's Torque", -- 5%
        waist = "Embla Sash", -- 5%
        left_ear = "Loquac. Earring", -- 2%
        right_ear = "Malignance Earring", -- 4%
        left_ring = "Kishar Ring", -- 4%
        back = "Fi Follet Cape +1" -- 10%
    }
    sets.precast.Impact = set_combine(sets.precast.FastCast, {
        body = "Twilight Cloak"
    })
    sets.precast.Dispelga = set_combine(sets.precast.FastCast, {
        main = "Daybreak",
        sub = "Genmei Shield"
    })
    sets.precast.Cure = set_combine(sets.precast.FastCast, { -- 79%
        body = "Heka's Kalasiris", -- 15% (+5% over FC set)
        feet = { -- 15% (+10% over FC set)
            name = "Vanya Clogs",
            augments = {'"Cure" potency +5%', '"Cure" spellcasting time -15%', '"Conserve MP"+6'}
        }
    })

    -- Midcast sets for spells
    sets.midcast.Cure = {
        head = { -- 10% Potency
            name = "Vanya Hood",
            augments = {'MP+50', '"Fast Cast"+10', 'Haste+2%'}
        },
        body = "Heka's Kalasiris", -- 15% Potency
        hands = { -- 7% Potency
            name = "Vanya Cuffs",
            augments = {'MP+50', '"Cure" potency +7%', 'Enmity-6'}
        },
        legs = "Gyve Trousers", -- 10% Potency
        feet = { -- 10% potency
            name = "Vanya Clogs",
            augments = {'"Cure" potency +5%', '"Cure" spellcasting time -15%', '"Conserve MP"+6'}
        },
        neck = "Incanter's Torque",
        waist = "Luminary Sash",
        left_ear = "Mendicant's Earring",
        right_ear = "Regal Earring",
        left_ring = "Ephedra Ring",
        right_ring = "Ephedra Ring"
    }
    sets.midcast.Curaga = sets.midcast.Cure
    sets.midcast.CureSelf = set_combine(sets.midcast.Cure, {
        neck = "Phalaina Locket",
        waist = "Gishdubar Sash",
        left_ring = "Kunaji Ring"
    })
    sets.midcast.Cursna = set_combine(sets.midcast.Cure, {
        hands = "Hieros Mittens",
        feet = {
            name = "Vanya Clogs",
            augments = {'"Cure" potency +5%', '"Cure" spellcasting time -15%', '"Conserve MP"+6'}
        },
        neck = "Incanter's Torque",
        waist = "Gishdubar Sash",
        left_ear = "Meili Earring",
        left_ring = "Ephedra Ring",
        right_ring = "Ephedra Ring"
    })

    sets.midcast.Enhancing = { -- +87
        main = { -- +11
            name = "Kirin's Pole",
            augments = {'DMG:+25', 'Enha.mag. skill +11'}
        },
        sub = "Khonsu",
        ammo = "Savant's Treatise", -- +4
        head = "Befouled Crown", -- +16
        body = "Anhur Robe", -- +12
        hands = "Augur's Gloves", -- +5
        legs = "Acad. Pants +1", -- +20
        feet = {
            name = "Telchine Pigaches",
            augments = {'"Fast Cast"+5', 'Enh. Mag. eff. dur. +10'}
        },
        neck = "Incanter's Torque", -- +10
        waist = "Embla Sash", -- Duration +10%
        back = "Fi Follet Cape +1" -- +9
    }
    sets.midcast.EnhancingDuration = set_combine(sets.midcast.Enhancing, {
        main = "Oranyan",
        sub = "Khonsu",
        head = {
            name = "Telchine Cap",
            augments = {'"Fast Cast"+5', 'Enh. Mag. eff. dur. +9'}
        },
        body = {
            name = "Telchine Chasuble",
            augments = {'"Fast Cast"+5', 'Enh. Mag. eff. dur. +9'}
        },
        hands = {
            name = "Telchine Gloves",
            augments = {'"Fast Cast"+5', 'Enh. Mag. eff. dur. +9'}
        },
        legs = {
            name = "Telchine Braconi",
            augments = {'"Fast Cast"+5', 'Enh. Mag. eff. dur. +10'}
        },
        feet = {
            name = "Telchine Pigaches",
            augments = {'"Fast Cast"+5', 'Enh. Mag. eff. dur. +10'}
        },
        waist = "Embla Sash" -- Duration +10%
    })
    sets.midcast.Regen = set_combine(sets.midcast.EnhancingDuration, {
        main = "Bolelabunga", -- 10% +1 Potency
        sub = "Genmei Shield",
        head = "Arbatel Bonnet +1",
        back = { -- Duration + 15
            name = "Lugh's Cape",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', '"Mag.Atk.Bns."+10', 'Spell interruption rate down-10%'}
        }
    })

    sets.midcast.Elemental = {
        main = {
            name = "Grioavolr",
            augments = {'"Conserve MP"+1', 'INT+13', 'Mag. Acc.+12', '"Mag.Atk.Bns."+25', 'Magic Damage +9'}
        },
        sub = "Khonsu",
        ammo = "Ghastly Tathlum +1",
        head = "Jhakri Coronal +2",
        body = "Jhakri Robe +2",
        hands = "Jhakri Cuffs +2",
        legs = "Jhakri Slops +1",
        feet = "Jhakri Pigaches +1",
        neck = "Baetyl Pendant",
        waist = "Eschan Stone",
        left_ear = "Malignance Earring",
        right_ear = "Regal Earring",
        left_ring = "Freke Ring",
        right_ring = "Metamorph Ring +1",
        back = {
            name = "Lugh's Cape",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'INT+10', '"Mag.Atk.Bns."+10',
                        'Spell interruption rate down-10%'}
        }
    }
    sets.midcast.ElementalMB = set_combine(sets.midcast.Elemental, {
        left_ring = "Mujin Band"
    })
    sets.midcast.Helix = set_combine(sets.midcast.Elemental, {
        main = "Daybreak",
        sub = "Culminus",
        ammo = "Ghastly Tathlum +1"
    })
    sets.midcast.HelixMB = set_combine(sets.midcast.ElementalMB, {
        ammo = "Ghastly Tathlum +1"
    })
    sets.midcast.Kaustra = set_combine(sets.midcast.Elemental, {
        head = "Pixie Hairpin +1",
        right_ring = "Archon Ring"
    })
    sets.midcast.Impact = set_combine(sets.midcast.Kaustra, {
        body = "Twilight Cloak"
    })

    sets.midcast.DarkMagic = {
        main = {
            name = "Rubicundity",
            augments = {'Mag. Acc.+4', '"Mag.Atk.Bns."+5', 'Dark magic skill +2', '"Conserve MP"+3'}
        },
        sub = "Genmei Shield",
        ammo = "Ghastly Tathlum +1",
        head = "Pixie Hairpin +1",
        body = "Jhakri Robe +2",
        hands = "Jhakri Cuffs +2",
        legs = "Portent Pants",
        feet = {
            name = "Amalric Nails",
            augments = {'Mag. Acc.+15', '"Mag.Atk.Bns."+15', '"Conserve MP"+6'}
        },
        neck = "Erra Pendant",
        left_ear = "Malignance Earring",
        right_ear = "Mani Earring",
        left_ring = "Archon Ring",
        right_ring = "Shiva Ring +1",
        back = "Bookworm's Cape"
    }
    sets.midcast.Drain = set_combine(sets.midcast.DarkMagic, {
        feet = "Merlinic Crackows",
        right_ring = "Evanescence Ring"
    })
    sets.midcast.Aspir = sets.midcast.Drain

    enfeeblingSet = {
        main = { -- MAcc + 26
            name = "Grioavolr",
            augments = {'"Conserve MP"+1', 'INT+13', 'Mag. Acc.+12', '"Mag.Atk.Bns."+25', 'Magic Damage +9'}
        },
        sub = "Khonsu", -- MAcc +25
        ammo = "Savant's Treatise", -- Enfeebling +4
        head = "Jhakri Coronal +2", -- MAcc +44
        body = "Jhakri Robe +2", -- MAcc +46
        hands = "Jhakri Cuffs +2", -- MAcc +43
        legs = {
            name = "Psycloth Lappas",
            augments = {'MP+80', 'Mag. Acc.+15', '"Fast Cast"+7'}
        }, -- MAcc +45, Enfeebling +18
        feet = "Jhakri Pigaches +1", -- MAcc +36
        neck = "Incanter's Torque", -- Enfeebling +10
        waist = "Luminary Sash", -- MAcc +10
        left_ear = "Malignance Earring", -- MAcc +10
        right_ear = "Regal Earring",
        left_ring = "Kishar Ring",
        right_ring = "Metamorph Ring +1",
        back = { -- MAcc +20
            name = "Lugh's Cape",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'INT+10', '"Mag.Atk.Bns."+10',
                        'Spell interruption rate down-10%'}
        }
    }
    sets.midcast.Enfeebling = enfeeblingSet
    sets.midcast.Enfeebling.withBuffs = {}
    sets.midcast.Enfeebling.withBuffs["Dark Arts"] = set_combine(enfeeblingSet, {
        body = "Acad. Gown +1" -- Enfeebling +20
    })
    sets.midcast.Dispelga = set_combine(sets.midcast.Enfeebling, {
        main = "Daybreak",
        sub = "Genmei Shield"
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
        main = "Chatoyant Staff",
        sub = "Khonsu",
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

function mod_midcast(spell, set)
    if spell.skill == "Elemental Magic" and buffactive["Klimaform"] ~= nil and weather_match(spell) then
        return set_combine(set, {
            feet = "Arbatel Loafers +1"
        })
    else
        return set
    end
end
