include('set-behavior')
include('organizer-lib')

function define_sets()
    -- Not Engaged
    sets.Idle.Idle = { -- 50% DT, 4 MDB
        ammo = "Vanir Battery", -- MDB +4
        head = "Malignance Chapeau", -- 6% DT
        body = "Malignance Tabard", -- 9% DT
        hands = "Malignance Gloves", -- 5% DT
        legs = "Mummu Kecks +2", -- 4% DT
        feet = "Jute Boots +1",
        neck = "Loricate Torque +1", -- 6% DT
        waist = "Flume Belt +1", -- 4% PDT
        left_ear = "Odnowa Earring +1", -- 2% MDT
        left_ring = "Defending Ring",
        right_ring = {
            name = "Dark Ring",
            augments = {'Phys. dmg. taken -5%', 'Magic dmg. taken -6%'}
        },
        back = {
            name = "Toutatis's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Damage taken-5%'}
        }
    }

    Idle_Mode_Order = T {'Idle'}

    -- Engaged Sets
    sets.TP.Att = {
        main = "Aeneas",
        sub = {
            name = "Ternion Dagger +1",
            augments = {'Path: A'}
        },
        ammo = "Seeth. Bomblet +1",
        head = {
            name = "Adhemar Bonnet +1",
            augments = {'DEX+12', 'AGI+12', 'Accuracy+20'}
        },
        body = "Pillager's Vest +2",
        hands = {
            name = "Adhemar Wrist. +1",
            augments = {'DEX+12', 'AGI+12', 'Accuracy+20'}
        },
        legs = {
            name = "Samnuha Tights",
            augments = {'STR+8', 'DEX+9', '"Dbl.Atk."+3', '"Triple Atk."+2'}
        },
        feet = "Malignance Boots",
        neck = "Assassin's Gorget +2",
        waist = "Windbuffet Belt +1",
        left_ear = "Telos Earring",
        right_ear = "Cessance Earring",
        left_ring = "Petrov Ring",
        right_ring = "Epona's Ring",
        back = {
            name = "Toutatis's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Damage taken-5%'}
        }
    }
    TH_Gear = {
        sub = "Sandung",
        hands = "Plunderer's Armlets +2",
        feet = "Skulker's Poulaines +1"
    }
    sets.TP.TH = set_combine(sets.TP.Att, TH_Gear)
    sets.TP.DT = set_combine(sets.TP.Att, { -- 50% DT
        head = "Malignance Chapeau", -- 6% DT
        body = "Malignance Tabard", -- 9% DT
        hands = "Malignance Gloves", -- 5% DT
        legs = "Mummu Kecks +2", -- 5% DT
        feet = "Malignance Boots", -- 4% DT
        neck = "Loricate Torque +1", -- 6% DT
        left_ear = "Odnowa Earring +1", -- 2% MDT
        left_ring = "Defending Ring",
        back = {
            name = "Toutatis's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Damage taken-5%'}
        }
    })
    sets.TP.DTTH = set_combine(sets.TP.DT, TH_Gear)
    sets.TP.Crit = set_combine(sets.TP.Att, {
        head = "Mummu Bonnet +1",
        body = "Mummu Jacket +2",
        hands = "Mummu Wrists +2",
        legs = "Mummu Kecks +2",
        feet = "Mummu Gamash. +2",
        left_ring = "Mummu Ring",
        right_ring = "Epona's Ring",
        back = {
            name = "Toutatis's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Damage taken-5%'}
        }
    })
    for mode, set in pairs(sets.TP) do
        -- Add in special gear for Sneak/Trick attack
        if not string.find(mode, 'TH') then
            set.withBuffs = {}
            set.withBuffs['Sneak Attack'] = set_combine(set, {
                head = "Adhemar Bonnet +1",
                body = "Meghanada Cuirie +2",
                hands = "Meghanada Gloves +2",
                feet = "Malignance Boots",
                neck = "Caro Necklace",
                waist = "Wanion Belt",
                left_ear = "Brutal Earring",
                right_ear = "Odr Earring",
                left_ring = "Apate Ring",
                right_ring = "Thundersoul Ring",
                back = {
                    name = "Toutatis's Cape",
                    augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Damage taken-5%'}
                }
            })
            set.withBuffs['Trick Attack'] = set_combine(set, {
                head = "Adhemar Bonnet +1",
                body = "Meghanada Cuirie +2",
                hands = "Meghanada Gloves +2",
                legs = "Meghanada Chausses +1",
                feet = "Mummu Gamash. +2",
                neck = "Houyi's Gorget",
                left_ring = "Apate Ring",
                right_ring = "Stormsoul Ring"
            })
        end
    end

    TP_Mode_Order = T {'Att', 'TH', 'Crit', 'DT', 'DTTH'}

    -- JA Sets; equip on use
    sets.JA['Sneak Attack'] = set_combine(set, {
        head = "Adhemar Bonnet +1",
        body = "Meghanada Cuirie +2",
        hands = "Meghanada Gloves +2",
        feet = "Malignance Boots",
        neck = "Caro Necklace",
        waist = "Wanion Belt",
        left_ear = "Brutal Earring",
        right_ear = "Odr Earring",
        left_ring = "Apate Ring",
        right_ring = "Thundersoul Ring",
        back = {
            name = "Toutatis's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'DEX+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    })
    sets.JA['Trick Attack'] = set_combine(set, {
        head = "Adhemar Bonnet +1",
        body = "Meghanada Cuirie +2",
        hands = "Meghanada Gloves +2",
        legs = "Meghanada Chausses +1",
        feet = "Mummu Gamash. +1",
        neck = "Houyi's Gorget",
        left_ring = "Apate Ring",
        right_ring = "Stormsoul Ring"
    })
    sets.JA.Steal = {
        head = "Plunderer's Bonnet +2"
    }
    sets.JA.Mug = {
        head = "Plunderer's Bonnet +2"
    }
    sets.JA.Hide = {
        body = "Pillager's Vest +2"
    }
    sets.JA.Conspirator = {
        body = "Raider's Vest +2"
    }
    sets.JA["Perfect Dodge"] = {
        hands = "Plunderer's Armlets +2"
    }
    sets.JA.Despoil = {
        feet = "Skulker's Poulaines +1"
    }
    sets.JA.Bully = {
        hands = "Plunderer's Armlets +2",
        feet = "Skulker's Poulaines +1"
    }

    -- Non-THF JAs
    sets.JA['Waltz'] = {
        head = "Mummu Bonnet +1",
        body = "Passion Jacket",
        hands = "Meg. Gloves +2",
        legs = "Meg. Chausses +1",
        waist = "Gishdubar Sash",
        left_ear = "Odnowa Earring +1",
        left_ring = "Petrov Ring",
        back = "Laic Mantle"
    }

    -- WS Sets
    base = {}
    base["Rudra's Storm"] = {
        ammo = "Seeth. Bomblet +1",
        head = "Plunderer's Bonnet +2",
        body = "Meg. Cuirie +2",
        hands = "Meg. Gloves +2",
        legs = {
            name = "Lustr. Subligar +1",
            augments = {'Accuracy+20', 'DEX+8', 'Crit. hit rate+3%'}
        },
        feet = {
            name = "Lustra. Leggings +1",
            augments = {'HP+65', 'STR+15', 'DEX+15'}
        },
        neck = "Caro Necklace",
        waist = "Grunfeld Rope",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Ishvara Earring",
        left_ring = "Karieyh Ring",
        right_ring = "Thundersoul Ring",
        back = {
            name = "Toutatis's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'DEX+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }
    sets.WS["Rudra's Storm"] = base["Rudra's Storm"]
    sets.WS["Rudra's Storm"].withBuffs = {}
    sets.WS["Rudra's Storm"].withBuffs["Sneak Attack"] = set_combine(base["Rudra's Storm"], {
        right_ear = "Odr Earring"
    })
    sets.WS["Mandalic Stab"] = base["Rudra's Storm"]
    sets.WS["Mandalic Stab"].withBuffs = {}
    sets.WS["Mandalic Stab"].withBuffs["Sneak Attack"] = set_combine(base["Rudra's Storm"], {
        right_ear = "Odr Earring"
    })

    sets.WS.Evisceration = {
        ammo = "Seeth. Bomblet +1",
        head = {
            name = "Adhemar Bonnet +1",
            augments = {'DEX+12', 'AGI+12', 'Accuracy+20'}
        },
        body = "Meg. Cuirie +2",
        hands = "Mummu Wrists +2",
        legs = {
            name = "Lustr. Subligar +1",
            augments = {'Accuracy+20', 'DEX+8', 'Crit. hit rate+3%'}
        },
        feet = {
            name = "Lustra. Leggings +1",
            augments = {'HP+65', 'STR+15', 'DEX+15'}
        },
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Odr Earring",
        left_ring = "Mummu Ring",
        right_ring = "Thundersoul Ring",
        back = {
            name = "Toutatis's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'DEX+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }
    sets.WS.Exenterator = {
        ammo = "Seeth. Bomblet +1",
        head = "Plunderer's Bonnet +2",
        body = "Meg. Cuirie +2",
        hands = "Mummu Wrists +2",
        legs = "Meg. Chausses +1",
        feet = "Mummu Gamash. +2",
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Brutal Earring",
        left_ring = "Mummu Ring",
        right_ring = "Stormsoul Ring",
        back = {
            name = "Toutatis's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'DEX+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }
    sets.WS.Generic = base["Rudra's Storm"]
    sets.WS.MAB = {
        ammo = "Seeth. Bomblet +1",
        head = {
            name = "Herculean Helm",
            augments = {'Accuracy+28', 'Crit.hit rate+3', 'Mag. Acc.+3 "Mag.Atk.Bns."+3'}
        },
        body = {
            name = "Rawhide Vest",
            augments = {'HP+50', '"Subtle Blow"+7', '"Triple Atk."+2'}
        },
        hands = {
            name = "Herculean Gloves",
            augments = {'Pet: Phys. dmg. taken -1%', 'Accuracy+4', 'Accuracy+15 Attack+15',
                        'Mag. Acc.+18 "Mag.Atk.Bns."+18'}
        },
        legs = {
            name = "Herculean Trousers",
            augments = {'Mag. Acc.+17', '"Mag.Atk.Bns."+19', 'Chance of successful block +1',
                        'Mag. Acc.+13 "Mag.Atk.Bns."+13'}
        },
        feet = {
            name = "Herculean Boots",
            augments = {'Accuracy+25', 'DEX+13', 'INT+9 MND+9 CHR+9', 'Accuracy+6 Attack+6',
                        'Mag. Acc.+16 "Mag.Atk.Bns."+16'}
        },
        neck = "Sanctity Necklace",
        waist = "Eschan Stone",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Friomisi Earring",
        left_ring = "Karieyh Ring",
        right_ring = "Shiva Ring +1",
        back = {
            name = "Toutatis's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'DEX+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }

    -- Pieces to switch out when the day/weather matches
    sets.Weather = {
        waist = "Hachirin-no-obi"
    }

    sets.precast.FastCast = { -- 32%
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
        neck = "Orunmila's Torque", -- 5%
        left_ear = "Loquac. Earring", -- 2%
        right_ear = "Enchntr. Earring +1" -- 2%
    }

    sets.precast.Utsusemi = set_combine(sets.precast.FastCast, {
        body = "Passion Jacket"
    })

    sets.midcast.Poisonga = {
        sub = "Sandung",
        hands = "Plunderer's Armlets +2",
        feet = "Skulker's Poulaines +1"
    }

    organizer_items = {
        attfood = "Red Curry Bun",
        accfood = "Sublime Sushi",
        bseals = "Beastmen's Seal",
        kseals = "Kindred's Seal",
        kcrests = "Kindred's Crest",
        hkcrests = "High Kindred's Crest",
        skcrest = "Sacred Kindred's Crest",
        warp_ring = "Warp Ring",
        caliber_ring = "Caliber Ring",
        vocation_ring = "Vocation Ring",
        facility_ring = "Facility Ring",
        aptitude_mantle = "Aptitude Mantle",
        monomi = "Sanjaku-tenugui",
        tonko = "Shinobi-tabi"

    }
end

function buff_change(name, is_gained)
    -- Set back to my normal set after losing Sneak/Trick attack
    if S {"Sneak Attack", "Trick Attack"}:contains(name) and is_gained == false then
        equip(steady_state())
    end
end
