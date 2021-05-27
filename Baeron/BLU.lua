include('set-behavior')
include('organizer-lib')
include('augments')

lockstyleset = 16

function define_sets()
    Melee_Modes = T {'DT', 'Att', 'Acc', 'Refresh'}
    Idle_Modes = T {'Speed', 'Refresh', 'DT'}
    Magic_Modes = T {'Acc', 'MAB', 'TH'}
    fastcast = .8

    th_gear = {
        legs = "Volte Hose",
        feet = herc.feet.thmab
    }

    back = {
        tp = {
            name = "Rosmerta's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Phys. dmg. taken-10%'}
        },
        dexcrit = {
            name = "Rosmerta's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'DEX+10', 'Crit.hit rate+10', 'Phys. dmg. taken-10%'}
        },
        strws = {
            name = "Rosmerta's Cape",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        },
        nuke = {
            name = "Rosmerta's Cape",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'INT+10', '"Mag.Atk.Bns."+10', 'Phys. dmg. taken-10%'}
        },
        bluskill = {
            name = "Cornflower Cape",
            augments = {'MP+20', 'Accuracy+1', 'Blue Magic skill +10'}
        }
    }

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
        head = herc.head.refresh, -- Refresh +2
        body = "Jhakri Robe +2", -- Refresh +4
        hands = herc.hands.refresh, -- Refresh +2
        legs = herc.legs.refresh, -- Refresh +2
        feet = herc.feet.refresh, -- Refresh +2, PDT -2%
        neck = "Loricate Torque +1", -- DT -6%
        left_ear = "Etiolation Earring", -- MDT -3%, Resist Silence +15
        waist = "Flume Belt +1", -- PDT -4%
        left_ring = "Defending Ring", -- DT-10%
        right_ring = { -- PDT -5%, MDT -6%
            name = "Dark Ring",
            augments = {'Phys. dmg. taken -5%', 'Magic dmg. taken -6%'}
        },
        back = back.tp -- PDT -10%

    }

    sets.Idle.Speed = set_combine(sets.Idle.Refresh, {
        legs = "Carmine Cuisses +1" -- MEva +80, MDB +4
    })

    sets.Idle.DT = set_combine(sets.Idle.Refresh, { -- 48% PDT, 43% MDT
        head = "Malignance Chapeau" -- 6% DT
    })

    -- Engaged Sets

    aftermath = {
        ammo = "Ginsen", -- Aurgelmir Orb +1
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Loricate Torque +1",
        waist = "Reiki Yotai",
        left_ear = "Telos Earring",
        right_ear = "Digni. Earring",
        left_ring = "Chirich Ring +1",
        right_ring = "Chirich Ring +1",
        back = back.tp
    }

    sets.TP.Att = {
        main = "Tizona",
        sub = "Thibron",
        ammo = "Ginsen",
        head = "Adhemar Bonnet +1",
        body = "Ayanmo Corazza +2",
        hands = "Adhemar Wrist. +1",
        legs = "Samnuha Tights",
        feet = herc.feet.dexta,
        neck = "Mirage Stole +2",
        waist = "Windbuffet Belt +1",
        left_ear = "Telos Earring",
        right_ear = "Cessance Earring",
        left_ring = "Petrov Ring",
        right_ring = "Epona's Ring",
        back = back.tp
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
        back = back.tp
    })

    for mode, set in pairs(sets.TP) do
        set.withBuffs = {}
        set.withBuffs["Aftermath: Lv.3"] = set_combine(set, aftermath)
    end

    sets.TP.Refresh = sets.Idle.Refresh

    -- WS Sets
    sets.WS["Chant du Cygne"] = {
        ammo = "Falcon Eye",
        head = "Adhemar Bonnet +1",
        body = "Gleti's Cuirass",
        hands = "Adhemar Wrist. +1",
        legs = "Gleti's Breeches",
        feet = "Gleti's Boots",
        neck = "Mirage Stole +2",
        waist = "Fotia Belt",
        left_ear = "Mache Earring +1",
        right_ear = "Odr Earring",
        left_ring = "Begrudging Ring",
        right_ring = "Epona's Ring",
        back = back.dexcrit
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
        back = back.strws
    }
    sets.WS["Savage Blade"] = {
        ammo = "Amar Cluster",
        head = herc.head.strws,
        body = "Assim. Jubbah +3",
        hands = "Jhakri Cuffs +2",
        legs = "Luhlaza Shalwar +3",
        feet = herc.feet.strws,
        neck = "Mirage Stole +2",
        waist = "Sailfi Belt +1",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Ishvara Earring",
        left_ring = "Rufescent Ring",
        right_ring = "Shukuyu Ring",
        back = back.strws
    }
    sets.WS["Expiacion"] = sets.WS["Savage Blade"]
    sets.WS["Black Halo"] = sets.WS["Savage Blade"]
    sets.WS["Sanguine Blade"] = {
        ammo = "Ghastly Tathlum +1",
        head = "Pixie Hairpin +1",
        body = "Jhakri Robe +2",
        hands = "Jhakri Cuffs +2",
        legs = "Luhlaza Shalwar +3",
        feet = "Amalric Nails",
        neck = "Baetyl Pendant",
        waist = "Eschan Stone",
        left_ear = "Friomisi Earring",
        right_ear = "Regal Earring",
        left_ring = "Archon Ring",
        right_ring = "Shiva Ring +1",
        back = back.nuke
    }
    sets.WS["Vorpal Blade"] = {
        ammo = "Coiste Bodhar",
        head = "Adhemar Bonnet +1",
        body = "Assim. Jubbah +3",
        hands = "Jhakri Cuffs +2",
        legs = "Samnuha Tights",
        feet = herc.feet.strcrit,
        neck = "Mirage Stole +2",
        waist = "Fotia Belt",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Brutal Earring",
        left_ring = "Begrudging Ring",
        right_ring = "Epona's Ring",
        back = back.strws
    }
    sets.WS.Generic = {
        ammo = "Amar Cluster",
        head = herc.head.strws,
        body = "Assim. Jubbah +3",
        hands = "Jhakri Cuffs +2",
        legs = "Samnuha Tights",
        feet = herc.feet.strws,
        neck = "Mirage Stole +2",
        waist = "Sailfi Belt +1",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Ishvara Earring",
        left_ring = "Rufescent Ring",
        right_ring = "Shukuyu Ring",
        back = back.strws
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
        back = back.nuke
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
        head = herc.head.refresh, -- 7%
        body = taeon.body.fc, -- 9%
        hands = "Leyline Gloves", -- 7%
        legs = "Psycloth Lappas", -- 7%
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
        head = telchine.head.enhfc,
        body = "Amalric Doublet",
        hands = "Jhakri Cuffs +2",
        legs = "Gyve Trousers",
        feet = "Medium's Sabots",
        neck = "Phalaina Locket",
        waist = "Luminary Sash",
        left_ear = "Mendicant's Earring",
        right_ear = "Regal Earring",
        left_ring = "Haoma's Ring",
        right_ring = "Haoma's Ring",
        back = back.bluskill
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
        body = "Amalric Doublet",
        hands = "Jhakri Cuffs +2",
        legs = "Luhlaza Shalwar +3",
        feet = "Amalric Nails",
        neck = "Baetyl Pendant",
        waist = "Eschan Stone",
        left_ear = "Friomisi Earring",
        right_ear = "Regal Earring",
        left_ring = "Shiva Ring +1",
        right_ring = "Metamorph Ring +1",
        back = back.nuke
    }
    sets.midcast.Enfeebling = {
        main = "Tizona",
        sub = "Bunzi's Rod",
        ammo = "Pemphredo Tathlum",
        head = "Assim. Keffiyeh +3",
        body = "Jhakri Robe +2",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Mirage Stole +2",
        waist = "Luminary Sash",
        left_ear = "Regal Earring",
        right_ear = "Enchntr. Earring +1",
        left_ring = "Kishar Ring",
        right_ring = "Metamorph Ring +1",
        back = "Aurist's Cape +1"
    }

    sets.midcast.BlueMagic.Physical = {
        ammo = "Ginsen",
        head = "Adhemar Bonnet +1",
        body = "Gleti's Cuirass",
        hands = "Jhakri Cuffs +2",
        legs = "Gleti's Breeches",
        feet = "Gleti's Boots",
        neck = "Mirage Stole +2",
        waist = "Sailfi Belt +1",
        left_ear = "Telos Earring",
        right_ear = "Odr Earring",
        left_ring = "Shukuyu Ring",
        right_ring = "Rufescent Ring",
        back = back.strws
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
    sets.midcast.BlueMagic.Breath.TH = set_combine(sets.midcast.BlueMagic.Breath, th_gear)
    sets.midcast.BlueMagic.Cure = set_combine(sets.midcast.Cur, {
        legs = "Carmine Cuisses +1"
    })
    sets.midcast.BlueMagic.CureSelf = set_combine(sets.midcast.BlueMagic.Cure, {
        neck = "Phalaina Locket",
        waist = "Gishdubar Sash",
        left_ring = "Kunaji Ring"
    })
    sets.midcast.BlueMagic.Skill = { -- +98
        ammo = "Mavi Tathlum", -- +5
        head = "Luh. Keffiyeh +1", -- +13
        body = "Assim. Jubbah +3", -- +24
        hands = "Rawhide Gloves", -- +10
        legs = "Hashishin Tayt +1", -- +23
        feet = "Luhlaza Charuqs +1", -- +8
        neck = "Mirage Stole +2", -- +20
        back = back.bluskill -- +15

    }
    sets.midcast.BlueMagic.Debuff = sets.midcast.Enfeebling

    -- Specific spells
    sets.midcast["Sound Blast"] = set_combine(sets.midcast.BlueMagic.Debuff, th_gear)
    sets.midcast["Sudden Lunge"] = sets.midcast.BlueMagic.Physical
    sets.midcast["Sudden Lunge"].TH = set_combine(sets.midcast.BlueMagic.Physical, th_gear)
    sets.midcast["Dream Flower"] = sets.midcast.BlueMagic.Debuff
    sets.midcast["Dream Flower"].TH = set_combine(sets.midcast.BlueMagic.Debuff, th_gear)

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
end
