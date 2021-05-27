include('set-behavior')
include('augments')

-- Set this to to /equipset you want to use for your lockstyle
lockstyleset = 2

function define_sets()
    Melee_Modes = T {'DT', 'Counter', 'Att', 'Acc'}

    th_gear = {
        legs = "Volte Hose",
        feet = {
            name = "Herculean Boots",
            augments = {'Weapon skill damage +4%', 'MND+4', '"Treasure Hunter"+2', 'Accuracy+13 Attack+13',
                        'Mag. Acc.+17 "Mag.Atk.Bns."+17'}
        }
    }

    back = {
        tp = {},
        strws = {},
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
        body = "Mpaca's Doublet",
        hands = "Adhemar Wrist. +1",
        legs = "Hes. Hose +2",
        feet = "Anch. Gaiters +2",
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
        neck = {
            name = "Mnk. Nodowa +2",
            augments = {'Path: A'}
        },
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
        head = "Mpaca's Cap",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Mpaca's Boots",
        neck = "Monk's Nodowa +2",
        waist = "Moonbow Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Brutal Earring",
        left_ring = "Defending Ring",
        right_ring = "Niqmaddu Ring",
        back = back.dexda
    }
    sets.TP.Counter = {
        main = "Verethragna",
        ammo = "Amar Cluster",
        head = "Mpaca's Cap",
        body = "Mpaca's Doublet",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Mpaca's Boots",
        neck = "Monk's Nodowa +2",
        waist = "Moonbow Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Brutal Earring",
        left_ring = "Defending Ring",
        right_ring = "Niqmaddu Ring",
        back = back.dexda
    }

    -- Weapon Skill Sets
    sets.WS["Victory Smite"] = {
        ammo = "Knobkierrie",
        head = "Adhemar Bonnet +1",
        body = "Bhikku Cyclas +1",
        hands = "Ryuo Tekko +1",
        legs = "Mpaca's Hose",
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
        ammo = "Knobkierrie",
        head = "Mpaca's Cap",
        body = "Mpaca's Doublet",
        hands = "Adhemar Wrist. +1",
        legs = "Tatena. Haidate +1",
        feet = herc.feet.strta,
        neck = "Monk's Nodowa +2",
        waist = "Moonbow Belt +1",
        left_ear = "Sherida Earring",
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = back.strda
    }
    sets.WS["Shijin Spiral"] = {
        ammo = "Knobkierrie",
        head = "Mpaca's Cap",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Tatena. Haidate +1",
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
        head = "Mpaca's Cap",
        body = "Tatena. Harama. +1",
        hands = herc.hands.strta,
        legs = "Tatena. Haidate +1",
        feet = herc.feet.strta,
        neck = "Monk's Nodowa +2",
        waist = "Moonbow Belt +1",
        left_ear = "Sherida Earring",
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = back.vitws
    }
    sets.WS["Tornado Kick"] = {
        ammo = "Knobkierrie",
        head = "Mpaca's Cap",
        body = "Tatena. Harama. +1",
        hands = herc.hands.strta,
        legs = "Tatena. Haidate +1",
        feet = herc.feet.strws,
        neck = "Monk's Nodowa +2",
        waist = "Moonbow Belt +1",
        left_ear = "Sherida Earring",
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = back.vitws
    }
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
        left_ring = "Mummu Ring",
        right_ring = "Metamor. Ring +1",
        back = back.vitws
    }
    sets.WS.Generic = {
        ammo = "Knobkierrie",
        head = "Adhemar Bonnet +1",
        body = "Bhikku Cyclas +1",
        hands = "Ryuo Tekko +1",
        legs = "Tatena. Haidate +1",
        feet = herc.feet.strws,
        neck = "Monk's Nodowa +2",
        waist = "Moonbow Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Odr Earring",
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = back.strda
    }
    sets.WS.MAB = {
        ammo = "Pemphredo Tathlum",
        head = herc.head.strws,
        body = herc.body.wsdmab,
        hands = "Leyline Gloves",
        legs = herc.legs.mab,
        feet = herc.feet.thmab,
        neck = "Baetyl Pendant",
        waist = "Eschan Stone",
        left_ear = "Friomisi Earring",
        right_ear = "Ishvara Earring",
        left_ring = "Metamor. Ring +1",
        right_ring = "Shiva Ring +1",
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
        head = "Mpaca's Cap",
        body = "Anch. Cyclas +1",
        hands = "Hes. Gloves +1",
        legs = "Tatena. Haidate +1",
        feet = "Mpaca's Boots",
        neck = "Unmoving Collar +1",
        left_ear = "Tuisto Earring",
        right_ear = "Odnowa Earring +1",
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = back.vitws
    }

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
    sets.precast.Utsusemi = set_combine(sets.precast.FastCast, {
        body = "Passion Jacket"
    })

    sets.midcast[": Ni"] = th_gear
end
