include('set-behavior')

-- Set this to to /equipset you want to use for your lockstyle
lockstyleset = 14

function define_sets()

    af = {
        head = "Drachen Armet",
        body = "Drachen Mail",
        hands = "Drachen Fng. Gnt.",
        legs = "Drachen Brais",
        feet = "Drachen Greaves"
    }

    drg = {
        main = "Spear of Trials",
        ammo = "Olibanum Sachet",
        head = "Voyager Sallet",
        body = "Scp. Harness +1",
        hands = af.hands,
        legs = af.legs,
        feet = "Bounding Boots",
        neck = "Love Torque",
        waist = "Swift Belt",
        left_ear = "Coral Earring",
        right_ear = "Coral Earring",
        left_ring = "Lava's Ring",
        right_ring = "Kusha's Ring",
        back = "Amemet Mantle +1"
    }
    -- =========================================================================================================
    -- ***Not Engaged Sets***
    -- =========================================================================================================
    sets.Idle = drg

    -- =========================================================================================================
    -- ***Engaged Sets***
    -- =========================================================================================================
    sets.TP = drg

    -- =========================================================================================================
    -- ***Weapon Skill Sets***
    -- =========================================================================================================
    sets.WS.Generic = set_combine(drg, {
        waist = "Cuchulain's Belt",
        left_ring = "Rajas Ring",
        right_ring = "Kshama Ring No.8"
    })

    -- =========================================================================================================
    -- ***Job Ability Sets***
    -- =========================================================================================================
    sets.JA.Jump = {
        feet = af.feet
    }
end
