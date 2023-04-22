include('set-behavior')

-- Set this to to /equipset you want to use for your lockstyle
lockstyleset = 14

function define_sets()

    stances.SAM = S {'Hasso', 'Seigan'}
    af = {
        head = "Drachen Armet",
        body = "Drachen Mail",
        hands = "Drachen Fng. Gnt.",
        legs = "Drachen Brais",
        feet = "Drachen Greaves"
    }

    relic = {
        body = "Wyrm Mail"
    }

    drg = {
        main = "Erebus's Lance",
        ammo = "Olibanum Sachet",
        head = "Askar Zucchetto",
        body = "Homam Corazza",
        hands = "Askar Manopolas",
        legs = af.legs,
        feet = "Ace's Leggings",
        neck = "Lancer's Torque",
        waist = "Ninurta's Sash",
        left_ear = "Brutal Earring",
        right_ear = "Coral Earring",
        left_ring = "Lava's Ring",
        right_ring = "Kusha's Ring",
        back = "Cerb. Mantle +1"
    }
    -- =========================================================================================================
    -- ***Not Engaged Sets***
    -- =========================================================================================================
    sets.Idle = set_combine(drg, {
        legs = "Blood Cuisses"
    })

    -- =========================================================================================================
    -- ***Engaged Sets***
    -- =========================================================================================================
    sets.TP = drg

    -- =========================================================================================================
    -- ***Weapon Skill Sets***
    -- =========================================================================================================
    sets.WS.Generic = {
        ammo = "Olibanum Sachet",
        head = "Ares' Mask",
        body = "Aurum Cuirass",
        hands = "Ares' Gauntlets",
        legs = "Aurum Cuisses",
        feet = "Hct. Leggings +1",
        neck = "Lancer's Torque",
        waist = "Anguinus Belt",
        left_ear = "Coral Earring",
        right_ear = "Coral Earring",
        left_ring = "Rajas Ring",
        right_ring = "Strigoi Ring",
        back = "Cerb. Mantle +1"
    }

    -- =========================================================================================================
    -- ***Job Ability Sets***
    -- =========================================================================================================
    sets.JA.Jump = {
        feet = af.feet
    }
    sets.JA['Call Wyvern'] = {
        body = relic.body
    }

    sets.WakeUp = {
        neck = "Vim Torque"
    }

end
