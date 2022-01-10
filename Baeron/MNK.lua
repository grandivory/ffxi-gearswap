include('set-behavior')
include('augments')

-- Set this to to /equipset you want to use for your lockstyle
lockstyleset = 2

function define_sets()
    Melee_Modes = T {'PDT', 'DT', 'Counter', 'Att', 'Acc'}

    th_gear = {
        ammo = "Per. Lucky Egg",
        legs = "Volte Hose",
        feet = herc.feet.thmab
    }

    back = {
        vitws = {
            name = "Segomo's Mantle",
            augments = {'VIT+20', 'Accuracy+20 Attack+20', 'VIT+10', 'Weapon skill damage +10%', 'Phys. dmg. taken-10%'}
        },
        strda = {
            name = "Segomo's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        },
        dexda = {
            name = "Segomo's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'DEX+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        }
    }

    -- Not engaged sets
    sets.Idle = {
        main = "Verethragna",
        ammo = "Vanir Battery",
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Herald's Gaiters",
        neck = "Loricate Torque +1",
        waist = "Moonbow Belt +1",
        left_ear = "Odnowa Earring +1",
        right_ear = "Tuisto Earring",
        left_ring = "Defending Ring",
        right_ring = "Kunaji Ring",
        back = back.vitws
    }
    sets.Idle.withBuffs = {}
    sets.Idle.withBuffs["Boost"] = set_combine(sets.Idle, {
        waist = "Ask Sash"
    })

    -- Engaged sets
    sets.TP.Att = {
        main = "Verethragna",
        ammo = "Coiste Bodhar",
        head = "Adhemar Bonnet +1",
        body = mpaca.body,
        hands = "Adhemar Wrist. +1",
        legs = "Hes. Hose +2",
        feet = "Anch. Gaiters +3",
        neck = "Mnk. Nodowa +2",
        waist = "Moonbow Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Telos Earring",
        left_ring = "Epona's Ring",
        right_ring = "Niqmaddu Ring",
        back = back.dexda
    }
    sets.TP.Att.withBuffs = {}
    sets.TP.Att.withBuffs.Impetus = set_combine(sets.TP.Att, {
        body = "Bhikku Cyclas +1"
    })
    sets.TP.Acc = {
        main = "Verethragna",
        ammo = "Amar Cluster",
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Mnk. Nodowa +2",
        waist = "Moonbow Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Telos Earring",
        left_ring = "Epona's Ring",
        right_ring = "Niqmaddu Ring",
        back = back.dexda
    }
    sets.TP.Acc.withBuffs = {}
    sets.TP.Acc.withBuffs.Impetus = set_combine(sets.TP.Acc, {
        body = "Bhikku Cyclas +1"
    })
    sets.TP.DT = {
        main = "Verethragna",
        ammo = "Coiste Bodhar",
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Monk's Nodowa +2",
        waist = "Moonbow Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Schere Earring",
        left_ring = "Epona's Ring",
        right_ring = "Niqmaddu Ring",
        back = back.dexda
    }
    sets.TP.PDT = {
        main = "Verethragna",
        ammo = "Coiste Bodhar",
        head = mpaca.head,
        body = mpaca.body,
        hands = mpaca.hands,
        legs = mpaca.legs,
        feet = "Malignance Boots",
        neck = "Monk's Nodowa +2",
        waist = "Moonbow Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Schere Earring",
        left_ring = "Epona's Ring",
        right_ring = "Niqmaddu Ring",
        back = back.dexda

    }
    sets.TP.Counter = {
        main = "Verethragna",
        ammo = "Amar Cluster",
        head = mpaca.head,
        body = mpaca.body,
        hands = mpaca.hands,
        legs = mpaca.legs,
        feet = "Malignance Boots",
        neck = "Monk's Nodowa +2",
        waist = "Moonbow Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Cryptic Earring",
        left_ring = "Epona's Ring",
        right_ring = "Niqmaddu Ring",
        back = back.dexda
    }

    -- Weapon Skill Sets
    sets.WS["Victory Smite"] = {
        ammo = "Coiste Bodhar",
        head = mpaca.head,
        body = mpaca.body,
        hands = "Ryuo Tekko +1",
        legs = mpaca.legs,
        feet = herc.feet.strcrit,
        neck = "Monk's Nodowa +2",
        waist = "Moonbow Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Odr Earring",
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = back.strda
    }
    sets.WS["Victory Smite"].withBuffs = {}
    sets.WS["Victory Smite"].withBuffs.Impetus = {
        ammo = "Coiste Bodhar",
        head = mpaca.head,
        body = "Bhikku Cyclas +1",
        hands = "Ryuo Tekko +1",
        legs = mpaca.legs,
        feet = herc.feet.strcrit,
        neck = "Monk's Nodowa +2",
        waist = "Moonbow Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Odr Earring",
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = back.strda
    }
    sets.WS["Raging Fists"] = {
        ammo = "Coiste Bodhar",
        head = mpaca.head,
        body = mpaca.body,
        hands = "Adhemar Wrist. +1",
        legs = tatenashi.legs,
        feet = mpaca.feet,
        neck = "Monk's Nodowa +2",
        waist = "Moonbow Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = back.strda
    }
    sets.WS["Shijin Spiral"] = {
        ammo = "Aurgelmir Orb +1",
        head = mpaca.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = mpaca.legs,
        feet = herc.feet.dexta,
        neck = "Monk's Nodowa +2",
        waist = "Moonbow Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Mache Earring +1",
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = back.dexda
    }
    sets.WS["Howling Fist"] = {
        ammo = "Knobkierrie",
        head = mpaca.head,
        body = tatenashi.body,
        hands = mpaca.hands,
        legs = mpaca.legs,
        feet = mpaca.feet,
        neck = "Monk's Nodowa +2",
        waist = "Moonbow Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = back.vitws
    }
    tk = {
        ammo = "Coiste Bodhar",
        head = mpaca.head,
        body = tatenashi.body,
        hands = "Adhemar Wristbands +1",
        legs = mpaca.legs,
        feet = nyame.feet,
        neck = "Monk's Nodowa +2",
        waist = "Moonbow Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = back.vitws
    }
    sets.WS["Tornado Kick"] = tk
    sets.WS["Tornado Kick"].withBuffs = {}
    sets.WS["Tornado Kick"].withBuffs.Footwork = set_combine(tk, {
        feet = "Anchorite's Gaiters +3"
    })
    sets.WS["Shell Crusher"] = {
        ammo = "Pemphredo Tathlum",
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Sanctity Necklace",
        waist = "Luminary Sash",
        ear1 = "Digni. Earring",
        ear2 = "Enchntr. Earring +1",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = back.vitws
    }
    sets.WS.Cataclysm = {
        ammo = "Ghastly Tathlum +1",
        head = "Pixie Hairpin +1",
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Baetyl Pendant",
        waist = "Eschan Stone",
        left_ear = "Friomisi Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Archon Ring",
        right_ring = "Metamor. Ring +1",
        back = back.strda
    }
    sets.WS.Generic = {
        ammo = "Knobkierrie",
        head = mpaca.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Monk's Nodowa +2",
        waist = "Moonbow Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Odr Earring",
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = back.strda
    }
    sets.WS.MAB = {
        ammo = "Ghastly Tathlum +1",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = herc.feet.thmab,
        neck = "Baetyl Pendant",
        waist = "Eschan Stone",
        left_ear = "Friomisi Earring",
        right_ear = "Ishvara Earring",
        left_ring = "Metamor. Ring +1",
        right_ring = "Epaminondas's Ring",
        back = back.vitws
    }

    -- Job Ability Sets
    sets.JA.Boost = {
        head = empty,
        body = empty,
        hands = empty,
        legs = empty,
        feet = empty,
        waist = "Ask Sash"
    }
    sets.JA["Hundred Fists"] = {
        legs = "Hesychast's Hose +2"
    }
    sets.JA.Chakra = {
        ammo = "Aurgelmir Orb +1",
        head = mpaca.head,
        body = "Anch. Cyclas +1",
        hands = "Hes. Gloves +1",
        legs = tatenashi.legs,
        feet = mpaca.feet,
        neck = "Unmoving Collar +1",
        left_ear = "Tuisto Earring",
        right_ear = "Odnowa Earring +1",
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = back.vitws
    }
    sets.JA["Chi Blast"] = th_gear

    -- Precast sets for spells
    sets.precast.FastCast = {
        ammo = "Sapience Orb",
        head = "Herculean Helm",
        body = taeon.body.fc,
        hands = "Leyline Gloves",
        neck = "Orunmila's Torque",
        waist = "Moonbow Belt +1",
        left_ear = "Enchntr. Earring +1",
        right_ear = "Loquac. Earring",
        right_ring = "Rahab Ring"
    }

    sets.midcast[": Ni"] = th_gear

    sets.Distance = {
        waist = "Orpheus's Sash"
    }

end
