include('set-behavior')
include('organizer-lib')

lockstyleset = 16

function define_sets()
    -- Not Engaged
    sets.Idle.Refresh = { -- Refresh +7, 49% PDT, 38% MDT, +10 MDB
        main = "Bolelabunga", -- Refresh +1
        sub = "Genmei Shield", -- PDT -10%
        ammo = "Vanir Battery", -- +4 MDB
        head = { -- Refresh +2
            name = "Spurrina Coif",
            augments = {'"Refresh"+2'}
        },
        body = "Jhakri Robe +2", -- Refresh +4
        hands = "Malignance Gloves", -- 5% DT
        legs = "Blood Cuisses", -- MEva +107, MDB +6, MDT -2%
        feet = "Malignance Boots", -- MEva +150, DT -4%
        neck = "Loricate Torque +1", -- DT -6%
        waist = "Flume Belt +1", -- PDT -4%
        left_ring = "Defending Ring", -- DT-10%
        right_ring = { -- PDT -5%, MDT -6%
            name = "Dark Ring",
            augments = {'Phys. dmg. taken -5%', 'Magic dmg. taken -6%'}
        },
        back = { -- DT -5%
            name = "Rosmerta's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Damage taken-5%'}
        }
    }

    sets.Idle.DT = set_combine(sets.Idle.Refresh, { -- 50% DT
        head = "Malignance Chapeau", -- 6% DT
        body = "Malignance Tabard" -- 9% DT
    })

    Idle_Mode_Order = T {'Refresh', 'DT'}

    -- Engaged Sets
    sets.TP.Att = {
        main = "Naegling",
        sub = {
            name = "Colada",
            augments = {'"Store TP"+5', 'VIT+1', 'Accuracy+12', 'Attack+21', 'DMG:+18'}
        },
        ammo = "Ginsen",
        head = {
            name = "Adhemar Bonnet +1",
            augments = {'DEX+12', 'AGI+12', 'Accuracy+20'}
        },
        body = "Ayanmo Corazza +2",
        hands = {
            name = "Adhemar Wrist. +1",
            augments = {'DEX+12', 'AGI+12', 'Accuracy+20'}
        },
        legs = {
            name = "Samnuha Tights",
            augments = {'STR+8', 'DEX+9', '"Dbl.Atk."+3', '"Triple Atk."+2'}
        },
        feet = "Malignance Boots",
        neck = "Portus Collar",
        waist = "Windbuffet Belt +1",
        left_ear = "Telos Earring",
        right_ear = "Cessance Earring",
        left_ring = "Petrov Ring",
        right_ring = "Epona's Ring",
        back = {
            name = "Rosmerta's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Damage taken-5%'}
        }
    }

    -- DT Sets
    sets.TP.DT = set_combine(sets.TP.Att, { -- 50% DT
        head = "Malignance Chapeau", -- 6% DT
        body = "Malignance Tabard", -- 9% DT
        hands = "Malignance Gloves", -- 5% DT
        legs = "Malignance Tights", -- 7% DT
        feet = "Malignance Boots", -- 4%
        neck = "Loricate Torque +1", -- 6%
        left_ring = "Defending Ring", -- 10%
        right_ring = {
            name = "Dark Ring",
            augments = {'Phys. dmg. taken -5%', 'Magic dmg. taken -6%'}
        },
        back = {
            name = "Rosmerta's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Damage taken-5%'}
        }
    })

    TP_Mode_Order = T {'Att', 'DT', 'Learn'}

    -- WS Sets
    sets.WS["Chant du Cygne"] = {
        ammo = "Falcon Eye",
        head = {
            name = "Adhemar Bonnet +1",
            augments = {'DEX+12', 'AGI+12', 'Accuracy+20'}
        },
        body = "Ayanmo Corazza +2",
        hands = {
            name = "Adhemar Wrist. +1",
            augments = {'DEX+12', 'AGI+12', 'Accuracy+20'}
        },
        legs = {
            name = "Samnuha Tights",
            augments = {'STR+8', 'DEX+9', '"Dbl.Atk."+3', '"Triple Atk."+2'}
        },
        feet = "Thereoid Greaves",
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Odr Earring",
        left_ring = "Ilabrat Ring",
        right_ring = "Epona's Ring",
        back = {
            name = "Rosmerta's Cape",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }
    sets.WS["Requiescat"] = {
        ammo = "Vanir Battery",
        head = "Jhakri Coronal +2",
        body = "Jhakri Robe +2",
        hands = "Jhakri Cuffs +2",
        legs = "Jhakri Slops +1",
        feet = "Jhakri Pigaches +1",
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Brutal Earring",
        left_ring = "Rufescent Ring",
        right_ring = "Epona's Ring",
        back = {
            name = "Rosmerta's Cape",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }
    sets.WS["Savage Blade"] = {
        ammo = "Vanir Battery",
        head = {
            name = "Adhemar Bonnet +1",
            augments = {'DEX+12', 'AGI+12', 'Accuracy+20'}
        },
        body = "Assim. Jubbah +2",
        hands = "Jhakri Cuffs +2",
        legs = "Luhlaza Shalwar +2",
        feet = {
            name = "Herculean Boots",
            augments = {'Weapon skill damage +2%', 'Weapon Skill Acc.+7', 'Accuracy+18 Attack+18'}
        },
        neck = "Caro Necklace",
        waist = "Sailfi Belt +1",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Ishvara Earring",
        left_ring = "Rufescent Ring",
        right_ring = "Karieyh Ring",
        back = {
            name = "Rosmerta's Cape",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }
    sets.WS["Expiacion"] = sets.WS["Savage Blade"]
    sets.WS["Sanguine Blade"] = {
        ammo = "Ghastly Tathlum +1",
        head = "Pixie Hairpin +1",
        body = "Jhakri Robe +2",
        hands = "Jhakri Cuffs +2",
        legs = "Luhlaza Shalwar +2",
        feet = {
            name = "Amalric Nails",
            augments = {'Mag. Acc.+15', '"Mag.Atk.Bns."+15', '"Conserve MP"+6'}
        },
        neck = "Baetyl Pendant",
        waist = "Eschan Stone",
        left_ear = "Friomisi Earring",
        right_ear = "Regal Earring",
        left_ring = "Archon Ring",
        right_ring = "Shiva Ring +1",
        back = {
            name = "Rosmerta's Cape",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'INT+10', '"Mag.Atk.Bns."+10', 'Phys. dmg. taken-10%'}
        }
    }
    sets.WS["Vorpal Blade"] = {
        ammo = "Amar Cluster",
        head = {
            name = "Adhemar Bonnet +1",
            augments = {'DEX+12', 'AGI+12', 'Accuracy+20'}
        },
        body = "Assim. Jubbah +2",
        hands = "Jhakri Cuffs +2",
        legs = {
            name = "Samnuha Tights",
            augments = {'STR+8', 'DEX+9', '"Dbl.Atk."+3', '"Triple Atk."+2'}
        },
        feet = "Thereoid Greaves",
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Brutal Earring",
        left_ring = "Apate Ring",
        right_ring = "Epona's Ring",
        back = {
            name = "Rosmerta's Cape",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }
    sets.WS.Generic = {
        ammo = "Vanir Battery",
        head = {
            name = "Lilitu Headpiece",
            augments = {'STR+9', 'DEX+9', 'Attack+13', 'Weapon skill damage +2%'}
        },
        body = "Assim. Jubbah +2",
        hands = "Jhakri Cuffs +2",
        legs = {
            name = "Samnuha Tights",
            augments = {'STR+8', 'DEX+9', '"Dbl.Atk."+3', '"Triple Atk."+2'}
        },
        feet = {
            name = "Herculean Boots",
            augments = {'Weapon skill damage +2%', 'Weapon Skill Acc.+7', 'Accuracy+18 Attack+18'}
        },
        neck = "Caro Necklace",
        waist = "Sailfi Belt +1",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Ishvara Earring",
        left_ring = "Apate Ring",
        right_ring = "Karieyh Ring",
        back = {
            name = "Rosmerta's Cape",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }
    sets.WS.MAB = {
        ammo = "Ghastly Tathlum +1",
        head = "Jhakri Coronal +2",
        body = "Jhakri Robe +2",
        hands = "Jhakri Cuffs +2",
        legs = "Jhakri Slops +1",
        feet = {
            name = "Amalric Nails",
            augments = {'Mag. Acc.+15', '"Mag.Atk.Bns."+15', '"Conserve MP"+6'}
        },
        neck = "Baetyl Pendant",
        waist = "Eschan Stone",
        left_ear = "Friomisi Earring",
        right_ear = "Regal Earring",
        left_ring = "Archon Ring",
        right_ring = "Shiva Ring +1",
        back = {
            name = "Rosmerta's Cape",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'INT+10', '"Mag.Atk.Bns."+10', 'Phys. dmg. taken-10%'}
        }
    }

    -- Precast sets for spells
    sets.precast.FastCast = { -- 54%
        main = { -- 4%
            name = "Colada",
            augments = {'"Store TP"+5', 'VIT+1', 'Accuracy+12', 'Attack+21', 'DMG:+18'}
        },
        sub = { -- 4%
            name = "Colada",
            augments = {'"Store TP"+5', 'Accuracy+23', 'Attack+14', 'DMG:+16'}
        },
        head = { -- 7%
            name = "Herculean Helm",
            augments = {'Accuracy+28', 'Crit.hit rate+3', 'Mag. Acc.+3 "Mag.Atk.Bns."+3'}
        },
        body = { -- 9%
            name = "Taeon Tabard",
            augments = {'"Fast Cast"+5'}
        },
        hands = { -- 7%
            name = "Leyline Gloves",
            augments = {'Accuracy+14', 'Mag. Acc.+13', '"Mag.Atk.Bns."+13', '"Fast Cast"+2'}
        },
        legs = { -- 5%
            name = "Telchine Braconi",
            augments = {'"Fast Cast"+5', 'Enh. Mag. eff. dur. +10'}
        },
        feet = { -- 5%
            name = "Telchine Pigaches",
            augments = {'"Fast Cast"+5', 'Enh. Mag. eff. dur. +10'}
        },
        neck = "Orunmila's Torque", -- 5%
        left_ear = "Loquac. Earring", -- 2%
        right_ear = "Enchntr. Earring +1", -- 2%
        left_ring = "Kishar Ring" -- 4%
    }
    sets.precast.Utsusemi = set_combine(sets.precast.FastCast, {
        body = "Passion Jacket"
    })
    sets.precast.BlueMagic = set_combine(sets.precast.FastCast, { -- 53%
        body = "Hashishin Mintan +1"
    })

    -- Midcast sets for spells
    sets.midcast.Cur = {
        main = "Nibiru Cudgel",
        sub = "Nibiru Cudgel",
        head = {
            name = "Telchine Cap",
            augments = {'"Fast Cast"+5', 'Enh. Mag. eff. dur. +9'}
        },
        body = {
            name = "Amalric Doublet",
            augments = {'MP+60', 'Mag. Acc.+15', '"Mag.Atk.Bns."+15'}
        },
        hands = "Jhakri Cuffs +2",
        legs = "Gyve Trousers",
        feet = {
            name = "Medium's Sabots",
            augments = {'MP+10', 'MND+1'}
        },
        neck = "Phalaina Locket",
        waist = "Luminary Sash",
        left_ear = "Mendicant's Earring",
        right_ear = "Regal Earring",
        left_ring = "Ephedra Ring",
        right_ring = "Ephedra Ring",
        back = {
            name = "Cornflower Cape",
            augments = {'MP+20', 'Accuracy+1', 'Blue Magic skill +10'}
        }
    }
    sets.precast.Waltz = set_combine(sets.midcast.Cur, {
        body = "Passion Jacket"
    })
    sets.midcast.CureSelf = set_combine(sets.midcast.Cur, {
        neck = "Phalaina Locket",
        waist = "Gishdubar Sash",
        left_ring = "Kunaji Ring"
    })
    sets.midcast.Elemental = {
        main = "Kaja Rod",
        sub = "Nibiru Cudgel",
        ammo = "Ghastly Tathlum +1",
        head = "Jhakri Coronal +2",
        body = {
            name = "Amalric Doublet",
            augments = {'MP+60', 'Mag. Acc.+15', '"Mag.Atk.Bns."+15'}
        },
        hands = "Jhakri Cuffs +2",
        legs = "Luhlaza Shalwar +2",
        feet = {
            name = "Amalric Nails",
            augments = {'Mag. Acc.+15', '"Mag.Atk.Bns."+15', '"Conserve MP"+6'}
        },
        neck = "Baetyl Pendant",
        waist = "Eschan Stone",
        left_ear = "Friomisi Earring",
        right_ear = "Regal Earring",
        left_ring = "Shiva Ring +1",
        right_ring = "Shiva Ring +1",
        back = {
            name = "Rosmerta's Cape",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'INT+10', '"Mag.Atk.Bns."+10', 'Phys. dmg. taken-10%'}
        }
    }
    sets.midcast.Enfeebling = {
        main = "Naegling",
        sub = "Kaja Rod",
        ammo = "Vanir Battery",
        head = "Jhakri Coronal +2",
        body = "Jhakri Robe +2",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Sanctity Necklace",
        waist = "Luminary Sash",
        left_ear = "Regal Earring",
        right_ear = "Enchntr. Earring +1",
        left_ring = "Shiva Ring +1",
        right_ring = "Shiva Ring +1",
        back = {
            name = "Rosmerta's Cape",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'INT+10', '"Mag.Atk.Bns."+10', 'Phys. dmg. taken-10%'}
        }
    }

    sets.midcast.BlueMagic.Physical = {
        head = {
            name = "Adhemar Bonnet +1",
            augments = {'DEX+12', 'AGI+12', 'Accuracy+20'}
        },
        body = "Assim. Jubbah +2",
        hands = "Jhakri Cuffs +2",
        legs = "Jhakri Slops +1",
        feet = {
            name = "Herculean Boots",
            augments = {'Accuracy+25', 'DEX+13', 'INT+9 MND+9 CHR+9', 'Accuracy+6 Attack+6',
                        'Mag. Acc.+16 "Mag.Atk.Bns."+16'}
        },
        neck = "Caro Necklace",
        waist = "Wanion Belt",
        left_ear = "Dudgeon Earring",
        right_ear = "Heartseeker Earring",
        left_ring = "Apate Ring",
        right_ring = "Petrov Ring",
        back = {
            name = "Rosmerta's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Damage taken-5%'}
        }
    }
    sets.midcast.BlueMagic.MAB = set_combine(sets.midcast.Elemental, {})
    sets.midcast["Tenebral Crush"] = set_combine(sets.midcast.BlueMagic.MAB, {
        head = "Pixie Hairpin +1"
    })
    sets.midcast["Palling Salvo"] = sets.midcast["Tenebral Crush"]
    sets.midcast["Atra. Libations"] = sets.midcast["Tenebral Crush"]
    sets.midcast.BlueMagic.Breath = set_combine(sets.midcast.Elemental, {
        ammo = "Mavi Tathlum",
        head = "Luhlaza Keffiyeh +1"
    })
    sets.midcast.BlueMagic.Cure = set_combine(sets.midcast.Cur, {})
    sets.midcast.BlueMagic.CureSelf = set_combine(sets.midcast.CureSelf, {})
    sets.midcast.BlueMagic.Skill = { -- +96
        ammo = "Mavi Tathlum", -- +5
        head = { -- +13
            name = "Luh. Keffiyeh +1",
            augments = {'Enhances "Convergence" effect'}
        },
        body = "Assim. Jubbah +2", -- +22
        hands = "Rawhide Gloves", -- +10
        legs = "Hashishin Tayt +1", -- +23
        feet = { -- +8
            name = "Luhlaza Charuqs +1",
            augments = {'Enhances "Diffusion" effect'}
        },
        back = { -- +15
            name = "Cornflower Cape",
            augments = {'MP+20', 'Accuracy+1', 'Blue Magic skill +10'}
        }
    }
    sets.midcast.BlueMagic.Debuff = sets.midcast.Enfeebling

    TP_Skill_set = set_combine(sets.TP.Att, sets.midcast.BlueMagic.Skill)
    sets.TP.Learn = set_combine(TP_Skill_set, {
        hands = "Assimilator's Bazubands +1"
    })
    sets.Idle.Learn = sets.TP.Learn

    -- Pieces to switch out when buffs are active
    sets.midcast.mod.Diffusion = {
        feet = "Luhlaza Charuqs +1"
    }
    sets.midcast.mod.Efflux = {
        back = {
            name = "Rosmerta's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Damage taken-5%'}
        }
    }

    -- Pieces to switch out when the day/weather matches
    sets.Weather = {
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
