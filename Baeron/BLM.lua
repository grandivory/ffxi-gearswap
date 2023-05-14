include('set-behavior')
include('augments')
-- inspect = require('inspect')

lockstyleset = 3

function define_sets()
    Idle_Modes = T {'Speed', 'Refresh', 'Death'}
    Magic_Modes = T {'MAB', 'Acc', 'Coat', 'DT', 'Occult', 'TH'}

    fastcast = .78 -- This defines how much fast cast you have, which is used when canceling spell effects (.8 = 80%)

    back = {
        nuke = {
            name = "Taranus's Cape",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'INT+10', '"Mag.Atk.Bns."+10', 'Phys. dmg. taken-10%'}
        },
        fcmp = {
            name = "Taranus's Cape",
            augments = {'MP+60', 'Mag. Acc+20 /Mag. Dmg.+20', 'MP+20', '"Fast Cast"+10', 'Phys. dmg. taken-10%'}
        },
        occult = {
            name = "Taranus's Cape",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'INT+10', '"Store TP"+10', 'Phys. dmg. taken-10%'}
        },
        tp = {
            name = "Taranus's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Phys. dmg. taken-10%'}
        },
        cure = {
            name = "Taranus's Cape",
            augments = {'MND+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'MND+10', '"Cure Potency"+10', 'Phys. dmg. taken-10%'}
        },
        mabws = {
            name = "Taranus's Cape",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'INT+10', 'Weapon skill damage +10%',
                        'Phys. dmg. taken-10%'}
        }
    }

    th = {
        ammo = "Per. Lucky Egg",
        legs = "Volte Hose",
        waist = "Chaac Belt"
    }

    af = {
        head = "Spae. Petasos +2",
        body = "Spaekona's Coat +3",
        hands = "Spae. Gloves +3",
        legs = "Spae. Tonban +3",
        feet = "Spae. Sabots +3"
    }

    relic = {
        head = "Arch. Petasos +3",
        body = "Arch. Coat +3",
        hands = "Arch. Gloves +3",
        legs = "Arch. Tonban +3",
        feet = "Arch. Sabots +3"
    }

    empy = {
        head = "Wicce Petasos +2",
        body = "Wicce Coat +2",
        hands = "Wicce Gloves +1",
        legs = "Wicce Tonban +2",
        feet = "Wicce Sabots +2"
    }

    -- =========================================================================================================
    -- ***Not Engaged Sets***
    -- =========================================================================================================
    sets.Idle.DT = {
        main = "Malignance Pole", -- 20%
        sub = "Khonsu", -- 6%
        ammo = "Staunch Tathlum +1", -- 3%
        head = nyame.head, -- 7%
        body = nyame.body, -- 9%
        hands = nyame.hands, -- 7%
        legs = nyame.legs, -- 8%
        feet = nyame.feet, -- 7%
        neck = "Loricate Torque +1", -- 6%
        waist = "Fucho-no-Obi", -- Refresh +1
        left_ear = "Etiolation Earring", -- 3% MDT
        right_ear = "Halasz Earring", -- MP +45
        left_ring = "Shadow Ring", -- Resist Death
        right_ring = "Mephitas's Ring +1", -- Convert 50 HP to MP
        back = back.fcmp -- 10% PDT
    }
    sets.Idle.Refresh = set_combine(sets.Idle.DT, { -- 53% DT, Refresh +8~11
        sub = "Oneiros Grip", -- +1 sub 75%
        head = "Befouled Crown", -- +1
        body = jhakri.body, -- +4
        -- body = empy.body, -- +4
        legs = "Assiduity Pants +1", -- +1~2
        waist = "Fucho-no-Obi", -- +1 sub 50%
        left_ring = "Stikini Ring +1", -- +1
        right_ring = "Stikini Ring +1" -- +1
    })
    sets.Idle.Speed = set_combine(sets.Idle.Refresh, { -- 52% DT, Refresh +8~10
        sub = "Khonsu",
        feet = "Herald's Gaiters"
    })
    sets.Idle.Death = { -- MP +1024 (vs. +960 in precast), PDT -40%, MDT -30%
        ammo = "Psilomene", -- MP +45
        -- head = "Pixie Hairpin +1", -- MP +120
        head = nyame.head, -- MP +59, DT -7%
        -- body = amalric.body, -- MP +153
        body = nyame.body, -- MP +88, DT -9%
        -- hands = vanya.hands, -- MP +94
        hands = nyame.hands, -- MP +73, DT -7%
        legs = amalric.legs, -- MP +185
        -- feet = psycloth.feet, -- MP +124
        feet = nyame.feet, -- MP +44, DT -7%
        neck = "Dualism Collar +1", -- MP +60
        waist = "Shinjutsu-no-obi +1", -- MP +85
        left_ear = "Etiolation Earring", -- MP +50
        right_ear = "Halasz Earring", -- MP +45
        left_ring = "Mephitas's Ring", -- Convert 100 HP to MP
        right_ring = "Mephitas's Ring +1", -- Convert 110 HP to MP
        back = back.fcmp -- MP +80
    }

    -- =========================================================================================================
    -- ***Engaged Sets***
    -- =========================================================================================================
    sets.TP = {
        main = "Malignance Pole",
        sub = "Bloodrain Strap",
        ammo = "Amar Cluster",
        head = nyame.head,
        body = nyame.body,
        hands = gazu.bracelet,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Combatant's Torque",
        waist = "Olseni Belt",
        left_ear = "Telos Earring",
        right_ear = "Mache Earring +1",
        left_ring = "Chirich Ring +1",
        right_ring = "Chirich Ring +1",
        back = back.tp
    }

    -- =========================================================================================================
    -- ***Weapon Skill Sets***
    -- =========================================================================================================
    sets.WS.Generic = {
        ammo = "Oshasha's Treatise",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Rep. Plat. Medal",
        waist = "Grunfeld Rope",
        left_ear = "Telos Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Chirich Ring +1",
        right_ring = "Epaminondas's Ring",
        back = back.tp
    } -- Any physical weapon skill that isn't otherwise specified
    sets.WS.MAB = {
        ammo = "Ghastly Tathlum +1",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Sibyl Scarf",
        waist = "Orpheus's Sash",
        left_ear = "Regal Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Freke Ring",
        right_ring = "Epaminondas's Ring",
        back = back.nuke
        -- back = back.mabws
    } -- Any magical weapon skill that isn't otherwise specified
    sets.WS.Myrkr = { -- MP +1206
        ammo = "Psilomene", -- MP +45
        head = "Pixie Hairpin +1", -- MP +120
        body = amalric.body, -- MP +153
        hands = vanya.hands, -- MP +94
        legs = amalric.legs, -- MP +185
        feet = psycloth.feet, -- MP +124
        neck = "Dualism Collar +1", -- MP +60
        waist = "Shinjutsu-no-obi +1", -- MP +85
        left_ear = "Etiolation Earring", -- MP +50
        right_ear = "Moonshade Earring",
        left_ring = "Mephitas's Ring", -- Converts 100 HP to MP
        right_ring = "Mephitas's Ring +1", -- Converts 110 HP to MP
        back = back.fcmp -- MP +80
    }
    sets.WS.Cataclysm = set_combine(sets.WS.MAB, {
        head = "Pixie Hairpin +1",
        body = amalric.body,
        legs = amalric.legs,
        left_ring = "Archon Ring"
    })
    sets.WS['Earth Crusher'] = set_combine(sets.WS.MAB, {
        head = agwu.head,
        hands = agwu.hands,
        feet = agwu.feet,
        neck = "Quanpur Necklace"
    })

    -- =========================================================================================================
    -- ***Job Ability Sets***
    -- =========================================================================================================
    sets.JA.Manafont = {
        body = relic.body
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
    sets.precast.FastCast = { -- 78%
        ammo = "Sapience Orb", -- 2%
        head = amalric.head, -- 11%
        body = "Zendik Robe", -- 13%
        hands = agwu.hands, -- 6%
        legs = "Volte Brais", -- 8%
        feet = amalric.feet, -- 6%
        neck = "Orunmila's Torque", -- 5%
        waist = "Shinjutsu-no-obi +1", -- 5%
        left_ear = "Loquacious Earring", -- 2%
        right_ear = "Malignance Earring", -- 4%
        left_ring = "Kishar Ring", -- 4%
        right_ring = "Rahab Ring", -- 2%
        back = back.fcmp -- 10%
    }
    sets.precast.Death = { -- MP +960, FC +71%
        sub = "Niobid Strap", -- MP +20
        ammo = "Psilomene", -- MP +45
        head = amalric.head, -- MP +61, FC +11%
        body = "Zendik Robe", -- MP +61, FC +13%
        hands = agwu.hands, -- MP +73, FC +6%
        -- hands = "Helios Gloves", -- MP +94, FC +5%
        legs = psycloth.legs, -- MP +109, FC +7%
        feet = amalric.feet, -- MP +106, FC +6%
        neck = "Orunmila's Torque", -- MP +30, FC +5%
        waist = "Shinjutsu-no-obi +1", -- MP +85, FC +5%
        left_ear = "Loquacious Earring", -- MP +30, FC +2%
        right_ear = "Etiolation Earring", -- MP +50, FC +1%
        left_ring = "Mephitas's Ring", -- Converts 100 HP to MP
        right_ring = "Mephitas's Ring +1", -- Converts 110 HP to MP
        back = back.fcmp -- MP +80, FC +10%
    }
    sets.precast.Dispelga = set_combine(sets.precast.FastCast, {
        main = "Daybreak"
    })
    sets.precast.Impact = set_combine(sets.precast.FastCast, {
        head = empty,
        body = "Crepuscular Cloak"
    })

    -- =========================================================================================================
    -- ***Midcast Sets for Spells***
    -- =========================================================================================================
    sets.midcast.Cur = {
        ammo = "Staunch Tathlum +1",
        head = vanya.head,
        body = "Vrikodara Jupon",
        hands = empy.hands,
        legs = "Gyve Trousers",
        feet = vanya.feet,
        neck = "Incanter's Torque",
        waist = "Luminary Sash",
        left_ear = "Mendicant's Earring",
        right_ear = "Meili Earring",
        left_ring = "Menelaus's Ring",
        right_ring = "Defending Ring",
        back = "Fi Follet Cape +1"
        -- back = back.cure
    } -- This will match any spell containing "Cur" in the name, so Cure, Curaga, etc.
    sets.midcast.CureSelf = set_combine(sets.midcast.Cur, {
        neck = "Phalaina Locket",
        waist = "Gishdubar Sash",
        left_ring = "Kunaji Ring"
    }) -- This will be used when casting any healing magic on yourself

    sets.midcast.Enhancing = {
        main = "Gada",
        sub = "Ammurapi Shield",
        ammo = "Pemphredo Tathlum",
        head = telchine.head.enhfc,
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
        waist = "Embla Sash"
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
        main = "Contemplator +1",
        sub = "Khonsu",
        ammo = "Pemphredo Tathlum",
        head = amalric.head,
        body = af.body,
        hands = "Regal Cuffs",
        legs = psycloth.legs,
        feet = af.feet,
        neck = "Sorcerer's Stole +2",
        waist = "Acuity Belt +1",
        left_ear = "Regal Earring",
        right_ear = "Malignance Earring",
        left_ring = "Kishar Ring",
        right_ring = "Metamor. Ring +1",
        back = "Aurist's Cape +1"
    }
    sets.midcast.EnfeeblingMND = set_combine(sets.midcast.Enfeebling, {
        head = "Cath Palug Crown",
        waist = "Luminary Sash",
        left_ring = "Stikini Ring +1"
    })
    sets.midcast.EnfeeblingINT = set_combine(sets.midcast.Enfeebling, {
        left_ring = "Stikini Ring +1"
    })

    sets.midcast.Dispelga = set_combine(sets.midcast.EnfeeblingInt, {
        main = "Daybreak",
        sub = "Ammurapi Shield"
    })

    sets.midcast.Sleepga = sets.midcast.Enfeebling
    sets.midcast.Sleepga.TH = set_combine(sets.midcast.Enfeebling, th)
    sets.midcast.Breakga = sets.midcast.Enfeebling
    sets.midcast.Breakga.TH = set_combine(sets.midcast.Enfeebling, th)
    sets.midcast.Dia = th

    sets.midcast.Elemental = {
        main = "Marin Staff +1",
        sub = "Alber Strap",
        ammo = "Pemphredo Tathlum",
        head = agwu.head,
        body = amalric.body,
        hands = amalric.hands,
        legs = amalric.legs,
        feet = amalric.feet,
        neck = "Baetyl Pendant",
        waist = "Sacro Cord",
        left_ear = "Regal Earring",
        right_ear = "Malignance Earring",
        left_ring = "Freke Ring",
        right_ring = "Shiva Ring +1",
        back = back.nuke
    } -- Any nuke
    sets.midcast.Elemental.Acc = {
        main = "Marin Staff +1",
        sub = "Enki Strap",
        ammo = "Pemphredo Tathlum",
        head = relic.head,
        body = relic.body,
        hands = relic.hands,
        legs = relic.legs,
        feet = relic.feet,
        neck = "Sanctity Necklace",
        waist = "Sacro Cord",
        left_ear = "Regal Earring",
        right_ear = "Malignance Earring",
        left_ring = "Freke Ring",
        right_ring = "Shiva Ring +1",
        back = back.nuke
    } -- This will be used when in 'Acc' magic mode
    -- This is here just for `gs validate`. It will never be equipped because `CoatCheck` isn't a normal mode
    sets.midcast.Elemental.CoatCheck = set_combine(sets.midcast.Elemental, {
        body = af.body
    })
    sets.midcast.Elemental.DT = { -- 48% DT
        main = "Marin Staff +1",
        sub = "Khonsu", -- 6% DT
        ammo = "Pemphredo Tathlum",
        head = empy.head, -- 10~11% DT
        body = amalric.body,
        hands = amalric.hands,
        legs = amalric.legs,
        feet = empy.feet, -- 11% DT
        neck = "Sorcerer's Stole +2",
        waist = "Sacro Cord",
        left_ear = "Regal Earring",
        right_ear = "Malignance Earring",
        left_ring = "Freke Ring",
        right_ring = "Defending Ring", -- 10% DT
        back = back.nuke -- 10% PDT
    }

    sets.midcast.Elemental.Occult = {
        sub = "Bloodrain Strap",
        ammo = "Seraphic Ampulla",
        head = mallquis.head,
        body = af.body,
        hands = merlinic.hands.occult,
        legs = "Perdition Slops",
        feet = merlinic.feet.occult,
        neck = "Combatant's Torque",
        waist = "Oneiros Rope",
        left_ear = "Dedition Earring",
        right_ear = "Crepuscular Earring",
        left_ring = "Chirich Ring +1",
        right_ring = "Crepuscular Ring",
        back = back.occult
    }

    sets.midcast.ElementalEnfeeble = {
        main = "Contemplator +1",
        sub = "Khonsu",
        ammo = "Pemphredo Tathlum",
        head = empy.head,
        body = relic.body,
        hands = af.hands,
        legs = relic.legs,
        feet = relic.feet,
        neck = "Sorcerer's Stole +2",
        waist = "Acuity Belt +1",
        left_ear = "Regal Earring",
        right_ear = "Malignance Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Metamor. Ring +1",
        back = "Aurist's Cape +1"
    }

    sets.midcast.ElementalMB = {
        main = "Marin Staff +1",
        sub = "Alber Strap",
        ammo = "Pemphredo Tathlum",
        head = ea.head,
        body = ea.body,
        hands = agwu.hands,
        legs = ea.legs,
        feet = agwu.feet,
        neck = "Sorcerer's Stole +2",
        waist = "Sacro Cord",
        left_ear = "Regal Earring",
        right_ear = "Malignance Earring",
        left_ring = "Freke Ring",
        right_ring = "Mujin Band",
        back = back.nuke
    } -- This is used during magic bursts
    sets.midcast.ElementalMB.Acc = {
        main = "Marin Staff +1",
        sub = "Enki Strap",
        ammo = "Pemphredo Tathlum",
        head = ea.head,
        body = ea.body,
        hands = agwu.hands,
        legs = ea.legs,
        feet = relic.feet,
        neck = "Sorcerer's Stole +2",
        waist = "Acuity Belt +1",
        left_ear = "Regal Earring",
        right_ear = "Malignance Earring",
        left_ring = "Freke Ring",
        right_ring = "Metamor. Ring +1",
        back = back.nuke

    } -- This is used in 'Acc' mode during magic bursts
    -- sets.midcast.ElementalMB.Coat = set_combine(sets.midcast.ElementalMB, {
    --     main = bunzi.rod,
    --     sub = "Ammurapi Shield",
    --     body = af.body
    -- })
    sets.midcast.ElementalMB.DT = {
        main = "Marin Staff +1",
        sub = "Khonsu",
        ammo = "Pemphredo Tathlum",
        head = empy.head,
        body = ea.body,
        hands = agwu.hands,
        legs = agwu.legs,
        feet = empy.feet,
        neck = "Sorcerer's Stole +2",
        waist = "Sacro Cord",
        left_ear = "Regal Earring",
        right_ear = "Malignance Earring",
        left_ring = "Freke Ring",
        right_ring = "Defending Ring",
        back = back.nuke
    }
    sets.midcast.ElementalMB.DT.withBuffs = {}
    sets.midcast.ElementalMB.DT.withBuffs["Mana Wall"] = set_combine(sets.midcast.ElementalMB.DT, {
        ammo = "Staunch Tathlum +1",
        head = ea.head,
        body = af.body,
        left_ring = "Gelatinous Ring +1"
    })

    sets.midcast.Death = {
        -- main = "Hvergelmir"
        main = "Marin Staff +1",
        sub = "Niobid Strap",
        ammo = "Ghastly Tathlum +1",
        head = "Pixie Hairpin +1",
        body = amalric.body,
        hands = amalric.hands,
        legs = amalric.legs,
        feet = amalric.feet,
        neck = "Sanctity Necklace",
        waist = "Acuity Belt +1",
        left_ear = "Barkarole Earring",
        right_ear = "Etiolation Earring",
        left_ring = "Mephitas's Ring +1",
        right_ring = "Archon Ring",
        back = back.fcmp
    }
    sets.midcast.DeathMB = {
        -- main = "Hvergelmir"
        main = "Marin Staff +1",
        sub = "Niobid Strap",
        ammo = "Ghastly Tathlum +1",
        head = "Pixie Hairpin +1",
        body = ea.body,
        hands = agwu.hands,
        legs = ea.legs,
        feet = amalric.feet,
        neck = "Sorcerer's Stole +2",
        waist = "Acuity Belt +1",
        left_ear = "Barkarole Earring",
        right_ear = "Etiolation Earring",
        left_ring = "Mephitas's Ring +1",
        right_ring = "Archon Ring",
        back = back.fcmp
    }

    sets.midcast.Impact = {
        main = bunzi.rod,
        sub = "Ammurapi Shield",
        ammo = "Pemphredo Tathlum",
        head = empty,
        body = "Crepuscular Cloak",
        hands = af.hands,
        legs = af.legs,
        feet = af.feet,
        neck = "Sorcerer's Stole +2",
        waist = "Acuity Belt +1",
        left_ear = "Regal Earring",
        right_ear = "Malignance Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Metamor. Ring +1",
        back = "Aurist's Cape +1"
    }

    sets.midcast.DarkMagic = {
        main = "Rubicundity",
        sub = "Ammurapi Shield",
        ammo = "Pemphredo Tathlum",
        head = amalric.head,
        body = amalric.body,
        hands = relic.hands,
        legs = af.legs,
        feet = empy.feet,
        neck = "Incanter's Torque",
        waist = "Acuity Belt +1",
        left_ear = "Regal Earring",
        right_ear = "Mani Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Archon Ring",
        back = "Bane Cape"
    }
    sets.midcast.Drain = set_combine(sets.midcast.DarkMagic, {
        head = merlinic.head.drainaspir,
        body = merlinic.body.drainaspir,
        hands = merlinic.hands.drainaspir,
        legs = af.legs,
        feet = agwu.feet,
        neck = "Erra Pendant",
        waist = "Fucho-no-Obi",
        left_ear = "Regal Earring",
        left_ring = "Evanescence Ring"
    })
    sets.midcast.Aspir = sets.midcast.Drain

    -- =========================================================================================================
    -- ***Special Sets***
    -- =========================================================================================================
    sets.Weather = {
        waist = "Hachirin-no-obi"
    }

    sets.Distance = {
        waist = "Orpheus's Sash"
    }

    sets.WakeUp = {
        main = "Prime Staff"
    }

end

function mod_idle(set, mode, override_lock, is_user_command)
    if buffactive["Mana Wall"] ~= nil then
        return set_combine(set, {
            feet = empy.feet
        })
    end

    return set
end

function mod_tp(set, mode, override_lock, is_user_command)
    if buffactive["Mana Wall"] ~= nil then
        return set_combine(set, {
            feet = empy.feet
        })
    end

    return set
end

function mod_midcast(spell, set, mode)
    if spell.name:contains("Stone") then
        return set_combine(set, {
            neck = "Quanpur Necklace"
        })
    end

    if mode == 'Coat' and player.mp < spell.mp_cost * 2 then
        return set_combine(set, {
            body = af.body
        })
    end

    return set
end
