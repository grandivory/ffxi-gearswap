-- Last Updated: December 21st, 2022
include('set-behavior')
include('augments')

lockstyleset = 20

function define_sets()
    Melee_Modes = T {'Staff', 'Dagger'}
    Idle_Modes = T {'Speed', 'DT'}
    Magic_Modes = T {'MAB', 'Vagary', 'Sortie', 'Occult', 'DT', 'TH'}
    fastcast = .8

    back = {
        nuke = {
            name = "Lugh's Cape",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'INT+10', '"Mag.Atk.Bns."+10', 'Phys. dmg. taken-10%'}
        },
        tp = {
            name = "Lugh's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Phys. dmg. taken-10%'}
        },
        intws = {
            name = "Lugh's Cape",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'INT+10', 'Weapon skill damage +10%',
                        'Phys. dmg. taken-10%'}
        }
    }

    af = {
        head = "Acad. Mortar. +3",
        body = "Acad. Gown +3",
        hands = "Acad. Bracers +3",
        legs = "Acad. Pants +3",
        feet = "Acad. Loafers +3"
    }

    relic = {
        head = "Peda. M.Board +3",
        body = "Peda. Gown +3",
        hands = "Peda. Bracers +3",
        legs = "Peda. Pants +3",
        feet = "Peda. Loafers +3"
    }

    empy = {
        head = "Arbatel Bonnet +3",
        body = "Arbatel Gown +3",
        hands = "Arbatel Bracers +3",
        legs = "Arbatel Pants +3",
        feet = "Arbatel Loafers +3",
        ear = "Arbatel Earring +1"
    }

    sets.empy = empy

    th = {
        ammo = "Per. Lucky Egg",
        legs = "Volte Hose",
        waist = "Chaac Belt"
    }

    -- =========================================================================================================
    -- ***Not Engaged Sets***
    -- =========================================================================================================
    sets.Idle.DT = { -- 54% DT (57% MDT), Refresh +9~12
        main = "Contemplator +1", -- Refresh +1~2
        -- main = "Malignance Pole", -- 20% DT
        sub = "Oneiros Grip", -- Refresh +0~1
        ammo = "Homiliary", -- Refresh +1
        -- head = empy.head, -- 10% DT
        head = chironic.head.refresh, -- Refresh +2
        -- body = nyame.body, -- 9% DT
        body = empy.body, -- 13% DT, Refresh +4
        hands = nyame.hands, -- 7% DT
        legs = empy.legs, -- 12% DT
        -- legs = "Assiduity Pants +1", -- Refresh +1~2
        feet = nyame.feet, -- 7% DT
        neck = "Loricate Torque +1", -- 6% DT
        waist = "Fucho-no-obi", -- Refresh +0~1
        left_ear = "Etiolation Earring", -- 3% MDT, Resist Silence +15
        right_ear = "Halasz Earring",
        left_ring = "Stikini Ring +1", -- Refresh +1
        right_ring = "Defending Ring", -- 10% DT
        back = back.nuke

    }
    sets.Idle.DT.withBuffs = {}
    sets.Idle.DT.withBuffs["Sublimation: Activated"] = set_combine(sets.Idle.DT, {
        head = af.head,
        waist = "Embla Sash"
    })
    sets.Idle.Speed = set_combine(sets.Idle.DT, { -- 53% DT (56% MDT), Refresh +9~11
        sub = "Khonsu", -- 6% DT, -0~1 Refresh
        feet = "Herald's Gaiters" -- -7% DT
    })
    sets.Idle.Speed.withBuffs = {}
    sets.Idle.Speed.withBuffs["Sublimation: Activated"] = set_combine(sets.Idle.Speed, {
        head = af.head,
        waist = "Embla Sash"
    })

    -- =========================================================================================================
    -- ***Engaged Sets***
    -- =========================================================================================================
    sets.TP.Staff = {
        main = "Malignance Pole",
        sub = "Khonsu",
        ammo = "Amar Cluster",
        head = "Blistering Sallet +1",
        body = nyame.body,
        hands = gazu.bracelet,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Combatant's Torque",
        waist = "Olseni Belt",
        left_ear = "Crep. Earring",
        right_ear = "Telos Earring",
        left_ring = "Chirich Ring +1",
        right_ring = "Chirich Ring +1",
        back = back.tp
    }
    sets.TP.Dagger = {
        main = malevolence,
        sub = "Ammurapi Shield",
        ammo = "Amar Cluster",
        head = "Blistering Sallet +1",
        body = nyame.body,
        hands = gazu.bracelet,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Combatant's Torque",
        waist = "Olseni Belt",
        left_ear = "Crep. Earring",
        right_ear = "Telos Earring",
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
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Moonshade Earring",
        right_ear = "Ishvara Earring",
        left_ring = "Epaminondas's Ring",
        right_ring = "Rufescent Ring",
        back = back.intws
    }

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
        back = back.intws
    }

    sets.WS.Myrkr = {
        ammo = "Psilomene", -- MP +45
        head = "Pixie Hairpin +1", -- MP +120
        body = af.body, -- MP +173
        hands = kaykaus.hands, -- MP +100
        legs = amalric.legs, -- MP +185
        feet = psycloth.feet, -- MP +124
        neck = "Dualism Collar +1", -- MP +60
        waist = "Shinjutsu-no-Obi +1", -- MP +85
        left_ear = "Moonshade Earring", -- TP +250
        right_ear = "Etiolation Earring", -- MP +50
        left_ring = "Mephitas's Ring", -- MP +100
        right_ring = "Mephitas's Ring +1", -- MP +110
        back = "Xucau Mantle" -- MP +100
    }

    sets.WS.Cataclysm = set_combine(sets.WS.MAB, {
        head = "Pixie Hairpin +1",
        right_ring = "Archon Ring"
    })
    sets.WS["Shell Crusher"] = {
        ammo = "Amar Cluster",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Sanctity Necklace",
        waist = "Fotia Belt",
        left_ear = "Mache Earring +1",
        right_ear = "Telos Earring",
        left_ring = "Chirich Ring +1",
        right_ring = "Chirich Ring +1",
        back = back.nuke
    }
    sets.WS["Aeolian Edge"] = set_combine(sets.WS.MAB, {
        neck = "Argute Stole +2",
        left_ear = "Malignance Earring",
        waist = "Fotia Belt"
    })

    -- =========================================================================================================
    -- ***Job Ability Sets***
    -- =========================================================================================================
    sets.JA.Enlightenment = {
        body = relic.body
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

    -- =========================================================================================================
    -- ***Precast Sets for Spells***
    -- =========================================================================================================
    sets.precast.FastCast = { -- 81% FC, 25% Grimoire
        main = "Musa", -- 10%
        sub = "Khonsu",
        ammo = "Sapience Orb", -- 2%
        head = relic.head, -- 13% Grimoire
        body = pinga.body, -- 15%
        hands = af.hands, -- 9%
        legs = pinga.legs, -- 13%
        feet = af.feet, -- 12% Grimoire
        neck = "Orunmila's Torque", -- 5%
        waist = "Embla Sash", -- 5%
        left_ear = "Loquac. Earring", -- 2%
        right_ear = "Malignance Earring", -- 4%
        left_ring = "Kishar Ring", -- 4%
        right_ring = "Rahab Ring", -- 2%
        back = "Fi Follet Cape +1" -- 10%
    }
    sets.precast.Impact = set_combine(sets.precast.FastCast, {
        head = empty,
        body = "Crepuscular Cloak"
    })
    sets.precast.Dispelga = set_combine(sets.precast.FastCast, {
        main = "Daybreak",
        sub = "Genmei Shield"
    })

    -- =========================================================================================================
    -- ***Midcast Sets for Spells***
    -- =========================================================================================================
    sets.midcast.Cur = { -- %67 Cure Pot, 11% Cure Pot II
        main = "Chatoyant Staff",
        sub = "Enki Strap", -- 10 MND
        ammo = "Pemphredo Tathlum", -- Conserve MP +4
        head = vanya.head, -- 17% Potency
        body = kaykaus.body, -- 6% Potency, 4% Potency II
        hands = kaykaus.hands, -- 11% Potency
        legs = af.legs, -- 15% Potency, 24 Skill
        feet = kaykaus.feet, -- 17% potency
        neck = "Orunmila's Torque",
        waist = "Shinjutsu-no-Obi +1", -- Conserve MP +15
        left_ear = "Mendicant's Earring", -- 5% Potency
        right_ear = "Regal Earring",
        left_ring = "Lebeche Ring", -- 3% Potency
        right_ring = "Naji's Loop" -- 1% Potency, 1% Potency II
    }
    sets.midcast.CurSelf = set_combine(sets.midcast.Cur, {
        neck = "Phalaina Locket",
        waist = "Gishdubar Sash",
        right_ring = "Kunaji Ring"
    })
    sets.midcast.Cur.DT = { -- 42% Cure Pot, 49% DT
        main = "Chatoyant Staff",
        sub = "Khonsu", -- 6% DT
        ammo = "Staunch Tathlum +1", -- 3% DT
        head = vanya.head, -- 17% Cure Pot
        body = nyame.body, -- 9% DT
        hands = nyame.hands, -- 7% DT
        legs = nyame.hands, -- 8% DT
        feet = kaykaus.feet, -- 17% Cure Pot
        neck = "Loricate Torque +1", -- 6% DT
        waist = "Shinjutsu-no-Obi +1", -- 15 Conserve MP
        left_ear = "Mendicant's Earring", -- 5% Cure Pot
        right_ear = "Regal Earring", -- 1~5 MND
        left_ring = "Lebeche Ring", -- 3% Cure Pot
        right_ring = "Defending Ring", -- 10% DT
        back = "Twilight Cape"
    }
    sets.midcast.CurSelf.DT = set_combine(sets.midcast.CurSelf, {
        neck = "Phalaina Locket",
        waist = "Gishdubar Sash",
        right_ring = "Kunaji Ring"
    })

    sets.midcast.Cursna = set_combine(sets.midcast.Cure, {
        main = "Gada",
        sub = "Genmei Shield",
        head = vanya.head,
        body = relic.body,
        hands = "Hieros Mittens",
        legs = af.legs,
        feet = vanya.feet,
        neck = "Debilis Medallion",
        waist = "Gishdubar Sash",
        left_ear = "Meili Earring",
        left_ring = "Menelaus's Ring",
        right_ring = "Haoma's Ring",
        back = "Oretania's Cape +1"
    })

    sets.midcast.EnhancingDuration = { -- +69, Duration +80%
        main = "Musa", -- 20% Duration
        sub = "Khonsu",
        head = telchine.head.enhfc, -- Duration +9%
        body = relic.body, -- +19, Duration +12%
        hands = telchine.hands.enhfc, -- Duration +9%
        legs = telchine.legs.enhfc, -- Duration +10%
        feet = telchine.feet.enhfc, -- Duration +10%
        neck = "Incanter's Torque", -- +10
        waist = "Embla Sash", -- Duration +10%
        left_ear = "Andoaa Earring", -- +5
        right_ear = "Mimir Earring", -- +10
        left_ring = "Stikini Ring +1", -- +8
        right_ring = "Stikini Ring +1", -- +8
        back = "Fi Follet Cape +1" -- +9
    }
    sets.midcast.Enhancing = sets.midcast.EnhancingDuration
    -- Need 104 enhancing skill to hit 500 while in dark arts. +35 over the normal duration set
    darkarts_enhancing = set_combine(sets.midcast.EnhancingDuration, {
        main = "Gada", -- +18, Duration +5%
        sub = "Ammurapi Shield", -- Duration +10%
        -- head = "Befouled Crown", -- +16
        -- hands = chironic.hands.mabrefresh, -- +15
        feet = kaykaus.feet -- +21
    })
    sets.midcast.Enhancing.withBuffs = {}
    sets.midcast.Enhancing.withBuffs["Dark Arts"] = darkarts_enhancing
    sets.midcast.Enhancing.withBuffs["Addendum: Black"] = darkarts_enhancing
    sets.midcast.EnhancingDuration.withBuffs = {}
    sets.midcast.EnhancingDuration.withBuffs["Dark Arts"] = darkarts_enhancing
    sets.midcast.EnhancingDuration.withBuffs["Addendum: Black"] = darkarts_enhancing

    sets.midcast.Regen = set_combine(sets.midcast.EnhancingDuration, {
        main = "Musa", -- +25 Potency, Duration +20%
        sub = "Khonsu",
        head = empy.head,
        body = telchine.body.enhfc,
        back = back.nuke -- Duration + 15%
    })
    sets.midcast.Stoneskin = set_combine(sets.midcast.EnhancingDuration, {
        legs = "Shedir Seraweels",
        neck = "Nodens Gorget",
        waist = "Siegel Sash"
    })
    -- TODO: Add in dark arts sets for Stoneskin and Aquaveil
    sets.midcast.Aquaveil = set_combine(sets.midcast.EnhancingDuration, {
        head = amalric.head,
        hands = "Regal Cuffs"
    })

    enfeeblingSet = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        ammo = "Pemphredo Tathlum", -- MAcc +8
        head = af.head, -- MAcc +52
        body = af.body, -- MAcc +50
        hands = kaykaus.hands, -- MAcc +53, Enfeebling +16
        legs = empy.legs, -- MAcc +63, Enfeebling +28, Grimoire +36
        feet = af.feet, -- MAcc +66
        neck = "Argute Stole +2", -- Macc +30
        waist = "Obstinate Sash", -- MAcc +15, Enfeebling +10, MND +5, Duration +5%
        left_ear = "Regal Earring", -- MAcc +15, INT+10, MND+10
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
    sets.midcast.Sleep = enfeeblingSet
    sets.midcast.Sleep.TH = set_combine(enfeeblingSet, th)

    sets.midcast.Elemental = {
        main = "Bunzi's Rod",
        sub = "Ammurapi Shield",
        ammo = "Ghastly Tathlum +1",
        head = agwu.head,
        body = empy.body,
        hands = agwu.hands,
        legs = agwu.legs,
        feet = empy.feet,
        neck = "Argute Stole +2",
        waist = "Sacro Cord",
        left_ear = "Regal Earring",
        right_ear = "Malignance Earring",
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
    sets.midcast.Elemental.Vagary = {
        main = "Contemplator +1",
        sub = "Khonsu",
        ammo = "Pemphredo Tathlum",
        head = "Befouled Crown",
        body = jhakri.body, -- TODO: Remove this
        hands = jhakri.hands, -- TODO: Remove this
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
    sets.midcast.Elemental.Occult = {
        main = "Marin Staff +1",
        sub = "Bloodrain Strap",
        ammo = "Seraphic Ampulla",
        head = mallquis.head,
        -- body = merlinic.body.occult,
        hands = merlinic.hands.occult,
        legs = "Perdition Slops",
        feet = merlinic.feet.occult,
        neck = "Combatant's Torque",
        waist = "Oneiros Rope",
        left_ear = "Crepuscular Earring",
        right_ear = "Dedition Earring",
        left_ring = "Chirich Ring +1",
        right_ring = "Chirich Ring +1",
        back = back.tp
    }
    sets.midcast.ElementalMB = set_combine(sets.midcast.Elemental, {
        left_ring = "Mujin Band"
    })
    sets.midcast.AeroMB = set_combine(sets.midcast.ElementalMB, {
        main = "Marin Staff +1",
        sub = "Enki Strap"
    })
    sets.midcast.StoneMB = set_combine(sets.midcast.ElementalMB, {
        neck = "Quanpur Necklace"
    })
    sets.midcast.ElementalMB.withBuffs = {}

    sets.midcast.helix = {
        main = "Bunzi's Rod",
        sub = "Culminus",
        ammo = "Ghastly Tathlum +1",
        head = agwu.head,
        body = empy.body,
        hands = empy.hands,
        legs = empy.legs,
        feet = empy.feet,
        neck = "Argute Stole +2",
        waist = "Sacro Cord",
        left_ear = "Regal Earring",
        right_ear = "Malignance Earring",
        left_ring = "Freke Ring",
        right_ring = "Mallquis Ring",
        back = back.nuke
    }
    sets.midcast.helix.Sortie = { -- 63% FC
        main = "Malignance Pole",
        sub = "Khonsu",
        ammo = "Sapience Orb", -- 2% FC
        head = "Pixie Hairpin +1",
        body = "Zendik Robe", -- 13% FC
        hands = "Gendewitha Gages +1", -- 7% FC -- TODO: Replace these
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
        hands = agwu.hands,
        feet = empy.feet,
        right_ear = empy.ear,
        right_ring = "Mujin Band"
    })
    sets.midcast.Luminohelix = set_combine(sets.midcast.helix, {
        main = "Daybreak"
    })
    sets.midcast.LuminohelixMB = set_combine(sets.midcast.helixMB, {
        main = "Daybreak"
    })
    sets.midcast.Kaustra = set_combine(sets.midcast.helix, {
        head = "Pixie Hairpin +1",
        left_ring = "Metamorph Ring +1",
        right_ring = "Archon Ring"
    })
    sets.midcast.KaustraMB = set_combine(sets.midcast.helixMB, {
        head = "Pixie Hairpin +1",
        left_ring = "Metamorph Ring +1",
        right_ring = "Archon Ring"
    })
    sets.midcast.Impact = {
        main = "Contemplator +1",
        sub = "Khonsu",
        ammo = "Pemphredo Tathlum",
        head = empty,
        body = "Crepuscular Cloak",
        hands = af.hands,
        legs = empy.legs,
        feet = empy.feet,
        neck = "Argute Stole +2",
        waist = "Acuity Belt +1",
        left_ear = "Regal Earring",
        right_ear = "Malignance Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = "Aurist's Cape +1"
    }

    sets.midcast.DarkMagic = {
        main = "Rubicundity",
        sub = "Ammurapi Shield",
        ammo = "Ghastly Tathlum +1",
        head = empy.head,
        body = af.body,
        hands = empy.hands,
        legs = relic.legs,
        feet = empy.feet,
        neck = "Erra Pendant",
        waist = "Acuity Belt +1",
        left_ear = "Regal Earring",
        right_ear = "Mani Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Archon Ring",
        back = "Bookworm's Cape"
    }
    sets.midcast.Drain = set_combine(sets.midcast.DarkMagic, {
        ammo = "Pemphredo Tathlum",
        body = merlinic.body.drainaspir,
        hands = merlinic.hands.drainaspir,
        neck = "Erra Pendant",
        left_ring = "Evanescence Ring"
    })
    sets.midcast.Aspir = sets.midcast.Drain
    sets.midcast.DrainMB = set_combine(sets.midcast.Drain, {
        body = af.body
    })
    sets.midcast.AspirMB = sets.midcast.DrainMB

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

function pretarget(spell)
    local bad_helix_nms = S {'Gartell', 'Leshonn', 'Haughty Tulittia'}

    if string.find(spell.english, 'helix II') and (bad_helix_nms:contains(spell.target.name)) then
        cancel_spell()
        notice("Helix II disabled on " .. spell.target.name)
    end
end
