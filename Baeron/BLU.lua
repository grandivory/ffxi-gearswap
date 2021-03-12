include('set-behavior')
include('organizer-lib')

lockstyleset = 16

function define_sets()
    Melee_Modes = T {'DT', 'Att', 'Acc', 'Refresh'}
    Idle_Modes = T {'Speed', 'Refresh', 'DT'}
    Magic_Modes = T {'Acc', 'MAB'}
    fastcast = .8

    -- Not Engaged
    sets.Idle.Refresh = { -- Refresh +16, +4 MDB, -37% PDT, -32% MDT
        main = { -- Refresh +2
            name = "Colada",
            augments = {'"Refresh"+2', 'INT+2', 'Mag. Acc.+3', 'DMG:+2'}
        },
        sub = { -- Refresh +2
            name = "Colada",
            augments = {'"Refresh"+2', 'INT+2', 'Mag. Acc.+16', '"Mag.Atk.Bns."+5'}
        },
        ammo = "Vanir Battery", -- +4 MDB
        head = { -- Refresh +2
            name = "Herculean Helm",
            augments = {'VIT+9', 'Rng.Acc.+26', '"Refresh"+2', 'Accuracy+11 Attack+11'}
        },
        body = "Jhakri Robe +2", -- Refresh +4
        hands = { -- Refresh +2
            name = "Herculean Gloves",
            augments = {'Accuracy+3', 'CHR+6', '"Refresh"+2', 'Accuracy+12 Attack+12', 'Mag. Acc.+8 "Mag.Atk.Bns."+8'}
        },
        legs = { -- Refresh +2
            name = "Herculean Trousers",
            augments = {'"Mag.Atk.Bns."+5', '"Rapid Shot"+3', '"Refresh"+2'}
        },
        feet = { -- Refresh +2, PDT -2%
            name = "Herculean Boots",
            augments = {'Mag. Acc.+7 "Mag.Atk.Bns."+7', 'CHR+7', '"Refresh"+2'}
        },
        neck = "Loricate Torque +1", -- DT -6%
        left_ear = "Etiolation Earring", -- MDT -3%, Resist Silence +15
        waist = "Flume Belt +1", -- PDT -4%
        left_ring = "Defending Ring", -- DT-10%
        right_ring = { -- PDT -5%, MDT -6%
            name = "Dark Ring",
            augments = {'Phys. dmg. taken -5%', 'Magic dmg. taken -6%'}
        },
        back = { -- PDT -10%
            name = "Rosmerta's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Phys. dmg. taken-10%'}
        }
    }

    sets.Idle.Speed = set_combine(sets.Idle.Refresh, {
        legs = { -- MEva +80, MDB +4
            name = "Carmine Cuisses +1",
            augments = {'Accuracy+12', 'DEX+12', 'MND+20'}
        }
    })

    sets.Idle.DT = set_combine(sets.Idle.Refresh, { -- 48% PDT, 43% MDT
        head = "Malignance Chapeau" -- 6% DT
    })

    -- Engaged Sets
    sets.TP.Att = {
        main = "Naegling",
        sub = "Thibron",
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
        feet = {
            name = "Herculean Boots",
            augments = {'"Triple Atk."+4', 'DEX+10', 'Accuracy+8'}
        },
        neck = "Mirage Stole +2",
        waist = "Windbuffet Belt +1",
        left_ear = "Telos Earring",
        right_ear = "Cessance Earring",
        left_ring = "Petrov Ring",
        right_ring = "Epona's Ring",
        back = {
            name = "Rosmerta's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Phys. dmg. taken-10%'}
        }
    }

    sets.TP.Acc = set_combine(sets.TP.Att, {
        sub = "Zantetsuken",
        ammo = "Falcon Eye"
    })

    -- DT Sets
    sets.TP.DT = set_combine(sets.TP.Att, { -- 50% DT
        head = "Malignance Chapeau", -- 6% DT
        body = "Malignance Tabard", -- 9% DT
        hands = "Malignance Gloves", -- 5% DT
        legs = "Malignance Tights", -- 7% DT
        feet = "Malignance Boots", -- 4%
        neck = "Mirage Stole +2",
        left_ring = "Defending Ring", -- 10%
        back = {
            name = "Rosmerta's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Phys. dmg. taken-10%'}
        }
    })

    sets.TP.Refresh = sets.Idle.Refresh

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
        left_ring = "Begrudging Ring",
        right_ring = "Epona's Ring",
        back = {
            name = "Rosmerta's Cape",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }
    sets.WS["Requiescat"] = {
        ammo = "Amar Cluster",
        head = "Jhakri Coronal +2",
        body = "Jhakri Robe +2",
        hands = "Jhakri Cuffs +2",
        legs = "Jhakri Slops +2",
        feet = "Jhakri Pigaches +2",
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
        ammo = "Amar Cluster",
        head = {
            name = "Herculean Helm",
            augments = {'Attack+12', 'Weapon skill damage +4%', 'STR+8', 'Accuracy+5'}
        },
        body = "Assim. Jubbah +3",
        hands = "Jhakri Cuffs +2",
        legs = "Luhlaza Shalwar +3",
        feet = {
            name = "Herculean Boots",
            augments = {'Attack+11', 'Weapon skill damage +5%', 'STR+10', 'Accuracy+15'}
        },
        neck = "Mirage Stole +2",
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
    sets.WS["Black Halo"] = sets.WS["Savage Blade"]
    sets.WS["Sanguine Blade"] = {
        ammo = "Ghastly Tathlum +1",
        head = "Pixie Hairpin +1",
        body = "Jhakri Robe +2",
        hands = "Jhakri Cuffs +2",
        legs = "Luhlaza Shalwar +3",
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
        ammo = "Floestone",
        head = {
            name = "Adhemar Bonnet +1",
            augments = {'DEX+12', 'AGI+12', 'Accuracy+20'}
        },
        body = "Assim. Jubbah +3",
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
        left_ring = "Begrudging Ring",
        right_ring = "Epona's Ring",
        back = {
            name = "Rosmerta's Cape",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }
    sets.WS.Generic = {
        ammo = "Amar Cluster",
        head = {
            name = "Lilitu Headpiece",
            augments = {'STR+9', 'DEX+9', 'Attack+13', 'Weapon skill damage +2%'}
        },
        body = "Assim. Jubbah +3",
        hands = "Jhakri Cuffs +2",
        legs = {
            name = "Samnuha Tights",
            augments = {'STR+8', 'DEX+9', '"Dbl.Atk."+3', '"Triple Atk."+2'}
        },
        feet = {
            name = "Herculean Boots",
            augments = {'Weapon skill damage +2%', 'Weapon Skill Acc.+7', 'Accuracy+18 Attack+18'}
        },
        neck = "Mirage Stole +2",
        waist = "Sailfi Belt +1",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Ishvara Earring",
        left_ring = "Shukuyu Ring",
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
        legs = "Jhakri Slops +2",
        feet = "Jhakri Pigaches +2",
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
    sets.precast.FastCast = { -- 73%
        main = { -- 4%
            name = "Colada",
            augments = {'"Refresh"+2', 'INT+2', 'Mag. Acc.+3', 'DMG:+2'}
        },
        sub = { -- 4%
            name = "Colada",
            augments = {'"Refresh"+2', 'INT+2', 'Mag. Acc.+16', '"Mag.Atk.Bns."+5'}
        },
        ammo = "Sapience Orb", -- 2%
        head = { -- 7%
            name = "Herculean Helm",
            augments = {'Attack+24', 'Weapon skill damage +2%', 'STR+4', 'Accuracy+6'}
        },
        body = { -- 9%
            name = "Taeon Tabard",
            augments = {'"Fast Cast"+5'}
        },
        hands = { -- 7%
            name = "Leyline Gloves",
            augments = {'Accuracy+14', 'Mag. Acc.+13', '"Mag.Atk.Bns."+13', '"Fast Cast"+2'}
        },
        legs = { -- 7%
            name = "Psycloth Lappas",
            augments = {'MP+80', 'Mag. Acc.+15', '"Fast Cast"+7'}
        },
        feet = "Carmine Greaves +1", -- 8%
        neck = "Orunmila's Torque", -- 5%
        left_ear = "Loquac. Earring", -- 2%
        right_ear = "Enchntr. Earring +1", -- 2%
        left_ring = "Kishar Ring", -- 4%
        right_ring = "Rahab Ring", -- 2%
        back = "Fi Follet Cape +1" -- 10%
    }
    sets.precast.Utsusemi = set_combine(sets.precast.FastCast, {
        body = "Passion Jacket"
    })
    sets.precast.BlueMagic = set_combine(sets.precast.FastCast, {
        body = "Hashishin Mintan +1"
    })

    -- Midcast sets for spells
    sets.midcast.Cur = {
        main = "Bunzi's Rod",
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
            augments = {'MP+40', 'MND+6', '"Conserve MP"+5', '"Cure" potency +3%'}
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
        main = "Maxentius",
        sub = "Bunzi's Rod",
        ammo = "Ghastly Tathlum +1",
        head = "Jhakri Coronal +2",
        body = {
            name = "Amalric Doublet",
            augments = {'MP+60', 'Mag. Acc.+15', '"Mag.Atk.Bns."+15'}
        },
        hands = "Jhakri Cuffs +2",
        legs = "Luhlaza Shalwar +3",
        feet = {
            name = "Amalric Nails",
            augments = {'Mag. Acc.+15', '"Mag.Atk.Bns."+15', '"Conserve MP"+6'}
        },
        neck = "Baetyl Pendant",
        waist = "Eschan Stone",
        left_ear = "Friomisi Earring",
        right_ear = "Regal Earring",
        left_ring = "Shiva Ring +1",
        right_ring = "Metamorph Ring +1",
        back = {
            name = "Rosmerta's Cape",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'INT+10', '"Mag.Atk.Bns."+10', 'Phys. dmg. taken-10%'}
        }
    }
    sets.midcast.Enfeebling = {
        main = "Naegling",
        sub = "Bunzi's Rod",
        ammo = "Pemphredo Tathlum",
        head = "Jhakri Coronal +2",
        body = "Jhakri Robe +2",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Mirage Stole +2",
        waist = "Luminary Sash",
        left_ear = "Regal Earring",
        right_ear = "Enchntr. Earring +1",
        left_ring = "Shiva Ring +1",
        right_ring = "Metamorph Ring +1",
        back = {
            name = "Rosmerta's Cape",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'INT+10', '"Mag.Atk.Bns."+10', 'Phys. dmg. taken-10%'}
        }
    }

    sets.midcast.BlueMagic.Physical = {
        ammo = "Floestone",
        head = {
            name = "Adhemar Bonnet +1",
            augments = {'DEX+12', 'AGI+12', 'Accuracy+20'}
        },
        body = "Assim. Jubbah +3",
        hands = "Jhakri Cuffs +2",
        legs = "Jhakri Slops +2",
        feet = "Jhakri Pigaches +2",
        neck = "Caro Necklace",
        waist = "Wanion Belt",
        left_ear = "Dudgeon Earring",
        right_ear = "Heartseeker Earring",
        left_ring = "Shukuyu Ring",
        right_ring = "Epona's Ring",
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
    sets.midcast.BlueMagic.Cure = set_combine(sets.midcast.Cur, {
        legs = {
            name = "Carmine Cuisses +1",
            augments = {'Accuracy+12', 'DEX+12', 'MND+20'}
        }
    })
    sets.midcast.BlueMagic.CureSelf = set_combine(sets.midcast.BlueMagic.Cure, {
        neck = "Phalaina Locket",
        waist = "Gishdubar Sash",
        left_ring = "Kunaji Ring"
    })
    sets.midcast.BlueMagic.Skill = { -- +98
        ammo = "Mavi Tathlum", -- +5
        head = { -- +13
            name = "Luh. Keffiyeh +1",
            augments = {'Enhances "Convergence" effect'}
        },
        body = "Assim. Jubbah +3", -- +24
        hands = "Rawhide Gloves", -- +10
        legs = "Hashishin Tayt +1", -- +23
        feet = { -- +8
            name = "Luhlaza Charuqs +1",
            augments = {'Enhances "Diffusion" effect'}
        },
        neck = "Mirage Stole +2", -- +20
        back = { -- +15
            name = "Cornflower Cape",
            augments = {'MP+20', 'Accuracy+1', 'Blue Magic skill +10'}
        }
    }
    sets.midcast.BlueMagic.Debuff = sets.midcast.Enfeebling

    -- Specific spells
    sets.midcast["Sound Blast"] = set_combine(sets.midcast.BlueMagic.Debuff, {
        legs = "Volte Hose",
        feet = {
            name = "Herculean Boots",
            augments = {'Weapon skill damage +4%', 'MND+4', '"Treasure Hunter"+2', 'Accuracy+13 Attack+13',
                        'Mag. Acc.+17 "Mag.Atk.Bns."+17'}
        }
    })

    TP_Skill_set = set_combine(sets.TP.Att, sets.midcast.BlueMagic.Skill)

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

    windower.send_command('lua reload equipviewerv2')
end
