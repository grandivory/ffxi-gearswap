include('set-behavior')

-- Set this to to /equipset you want to use for your lockstyle
lockstyleset = nil

function define_sets()

    war = {
        main = "Elephas Axe",
        ammo = "Fire Bomblet",
        head = "Askar Zucchetto",
        body = "Scorpion Harness +1",
        hands = "Askar Manopolas",
        legs = "Byakko's Haidate",
        feet = "Fighter's Calligae",
        neck = "Chivalrous Chain",
        waist = "Swift Belt",
        left_ear = "Brutal Earring",
        right_ear = "Coral Earring",
        left_ring = "Jaeger Ring",
        right_ring = "Rajas Ring",
        back = "Cerb. Mantle +1"
    }

    -- =========================================================================================================
    -- ***Not Engaged Sets***
    -- =========================================================================================================
    sets.Idle = set_combine(war, {
        feet = "Hermes' Sandals"
    })

    -- =========================================================================================================
    -- ***Engaged Sets***
    -- =========================================================================================================
    sets.TP = war

    -- =========================================================================================================
    -- ***Weapon Skill Sets***
    -- =========================================================================================================
    sets.WS.Generic = set_combine(war, {
        head = "Ares' mask",
        body = "Aurum Cuirass",
        hands = "Ares' Gauntlets",
        legs = "Aurum Cuisses",
        waist = "Anguinus Belt",
        left_ear = "Coral Earring",
        left_ring = "Strigoi Ring"
    })

    -- =========================================================================================================
    -- ***Job Ability Sets***
    -- =========================================================================================================

    -- =========================================================================================================
    -- ***Stances***
    -- =========================================================================================================
    stances.SAM = S {'Hasso', 'Seigan'}
    stances.WAR = S {'Retaliation'}

    sets.WakeUp = {
        neck = "Vim Torque"
    }

end
