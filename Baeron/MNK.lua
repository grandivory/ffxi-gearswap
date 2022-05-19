include('set-behavior')
include('augments')

-- Set this to to /equipset you want to use for your lockstyle
lockstyleset = 2

function define_sets()
    Melee_Modes = T {'PDT', 'DT', 'Godhands', 'Counter', 'Att', 'Acc'}
    stances.MNK = S {'Impetus'}
    stances.Footwork = S {'Footwork'}
    stances.Berserk = S {'Berserk'}
    stances.Aggressor = S {'Aggressor'}

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

    af = {
        body = "Anch. Cyclas +1",
        feet = "Anch. Gaiters +3"
    }

    relic = {
        hands = "Hes. Gloves +1",
        legs = "Hes. Hose +3"
    }

    empy = {
        body = "Bhikku Cyclas +1"
    }

    -- =========================================================================================================
    -- ***Not Engaged Sets***
    -- =========================================================================================================
    sets.Idle = {
        ammo = "Vanir Battery",
        head = malignance.head,
        body = malignance.body,
        hands = malignance.hands,
        legs = malignance.legs,
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

    -- =========================================================================================================
    -- ***Engaged Sets***
    -- =========================================================================================================
    sets.TP.Att = {
        main = "Verethragna",
        ammo = "Coiste Bodhar",
        head = adhemar.head,
        body = mpaca.body,
        hands = adhemar.hands,
        legs = relic.legs,
        feet = "Anch. Gaiters +3",
        neck = "Mnk. Nodowa +2",
        waist = "Moonbow Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Telos Earring",
        left_ring = "Gere Ring",
        right_ring = "Niqmaddu Ring",
        back = back.dexda
    }
    sets.TP.Att.withBuffs = {}
    sets.TP.Att.withBuffs.Impetus = set_combine(sets.TP.Att, {
        body = empy.body
    })
    sets.TP.Acc = {
        main = "Verethragna",
        ammo = "Amar Cluster",
        head = malignance.head,
        body = malignance.body,
        hands = malignance.hands,
        legs = malignance.legs,
        feet = malignance.feet,
        neck = "Mnk. Nodowa +2",
        waist = "Moonbow Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Telos Earring",
        left_ring = "Gere Ring",
        right_ring = "Niqmaddu Ring",
        back = back.dexda
    }
    sets.TP.Acc.withBuffs = {}
    sets.TP.Acc.withBuffs.Impetus = set_combine(sets.TP.Acc, {
        body = empy.body
    })
    sets.TP.DT = {
        main = "Verethragna",
        ammo = "Coiste Bodhar",
        head = malignance.head,
        body = malignance.body,
        hands = malignance.hands,
        legs = malignance.legs,
        feet = malignance.feet,
        neck = "Monk's Nodowa +2",
        waist = "Moonbow Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Schere Earring",
        left_ring = "Gere Ring",
        right_ring = "Niqmaddu Ring",
        back = back.dexda
    }
    sets.TP.DT.withBuffs = {}
    sets.TP.Godhands = {
        main = "Godhands",
        ammo = "Coiste Bodhar",
        head = malignance.head,
        body = malignance.body,
        hands = malignance.hands,
        legs = malignance.legs,
        feet = malignance.feet,
        neck = "Monk's Nodowa +2",
        waist = "Moonbow Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Mache Earring +1",
        left_ring = "Gere Ring",
        right_ring = "Niqmaddu Ring",
        back = back.dexda
    }
    -- sets.TP.DT.withBuffs.Impetus = set_combine(sets.TP.DT, {
    --     body = empy.body
    -- })
    sets.TP.PDT = {
        main = "Verethragna",
        ammo = "Coiste Bodhar",
        head = mpaca.head,
        body = mpaca.body,
        hands = mpaca.hands,
        legs = mpaca.legs,
        feet = malignance.feet,
        neck = "Monk's Nodowa +2",
        waist = "Moonbow Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Schere Earring",
        left_ring = "Gere Ring",
        right_ring = "Niqmaddu Ring",
        back = back.dexda
    }
    sets.TP.PDT.withBuffs = {}
    sets.TP.PDT.withBuffs.Impetus = set_combine(sets.TP.PDT, {
        body = empy.body
    })
    sets.TP.Counter = {
        main = "Verethragna",
        ammo = "Amar Cluster",
        head = mpaca.head,
        body = mpaca.body,
        hands = mpaca.hands,
        legs = mpaca.legs,
        feet = malignance.feet,
        neck = "Monk's Nodowa +2",
        waist = "Moonbow Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Cryptic Earring",
        left_ring = "Gere Ring",
        right_ring = "Niqmaddu Ring",
        back = back.dexda
    }

    -- =========================================================================================================
    -- ***Weapon Skill Sets***
    -- =========================================================================================================
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
        left_ring = "Gere Ring",
        right_ring = "Niqmaddu Ring",
        back = back.strda
    }
    sets.WS["Raging Fists"] = {
        ammo = "Coiste Bodhar",
        head = mpaca.head,
        body = mpaca.body,
        hands = adhemar.hands,
        legs = tatenashi.legs,
        feet = mpaca.feet,
        neck = "Monk's Nodowa +2",
        waist = "Moonbow Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Gere Ring",
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
        left_ring = "Gere Ring",
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
        left_ring = "Gere Ring",
        right_ring = "Niqmaddu Ring",
        back = back.vitws
    }
    sets.WS["Tornado Kick"] = {
        ammo = "Coiste Bodhar",
        head = mpaca.head,
        body = tatenashi.body,
        hands = adhemar.hands,
        legs = mpaca.legs,
        feet = af.feet,
        neck = "Monk's Nodowa +2",
        waist = "Moonbow Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Gere Ring",
        right_ring = "Niqmaddu Ring",
        back = back.vitws
    }
    sets.WS["Shell Crusher"] = {
        ammo = "Pemphredo Tathlum",
        head = malignance.head,
        body = malignance.body,
        hands = malignance.hands,
        legs = malignance.legs,
        feet = malignance.feet,
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

    -- =========================================================================================================
    -- ***Job Ability Sets***
    -- =========================================================================================================
    sets.JA.Boost = {
        head = empty,
        body = empty,
        hands = empty,
        legs = empty,
        feet = empty,
        waist = "Ask Sash"
    }
    sets.JA["Hundred Fists"] = {
        legs = relic.legs
    }
    sets.JA.Chakra = {
        ammo = "Aurgelmir Orb +1",
        head = mpaca.head,
        body = af.body,
        hands = relic.hands,
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

    -- =========================================================================================================
    -- ***Precast Sets for Spells***
    -- =========================================================================================================
    sets.precast.FastCast = {
        ammo = "Sapience Orb",
        head = herc.head.refresh,
        body = taeon.body.fcphalanx,
        hands = "Leyline Gloves",
        neck = "Orunmila's Torque",
        waist = "Moonbow Belt +1",
        left_ear = "Enchntr. Earring +1",
        right_ear = "Loquac. Earring",
        right_ring = "Rahab Ring"
    }

    sets.midcast[": Ni"] = th_gear

    -- =========================================================================================================
    -- ***Special Sets***
    -- =========================================================================================================
    sets.Distance = {
        waist = "Orpheus's Sash"
    }

end
