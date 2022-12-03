include('set-behavior')

-- Set this to to /equipset you want to use for your lockstyle
lockstyleset = nil

function define_sets()

    nin = {
        main = "Ichi-an",
        sub = "Ichi-an",
        ammo = "Nokizaru Shuriken",
        head = "Usukane Somen",
        body = "Usukane Haramaki",
        hands = "Usukane Gote",
        legs = "Usukane Hizayoroi",
        feet = "Usukane Sune-Ate",
        neck = "Chivalrous Chain",
        waist = "Twilight Belt",
        left_ear = "Brutal Earring",
        right_ear = "Coral Earring",
        left_ring = "Rajas Ring",
        right_ring = "Epona's Ring",
        back = "Atheling Mantle"
    }

    -- =========================================================================================================
    -- ***Not Engaged Sets***
    -- =========================================================================================================
    sets.Idle = set_combine(nin, {
        feet = "Danzo Sune-ate"
    })

    -- =========================================================================================================
    -- ***Engaged Sets***
    -- =========================================================================================================
    sets.TP = nin

    -- =========================================================================================================
    -- ***Weapon Skill Sets***
    -- =========================================================================================================
    sets.WS.Generic = set_combine(nin, {
        head = "Aias Bonnet",
        neck = "Fotia Gorget",
        waist = "Anguinus Belt",
        left_ear = "Moonshade Earring",
        right_ring = "Thundersoul Ring"
    })

    -- =========================================================================================================
    -- ***Spell Sets***
    -- =========================================================================================================
    sets.precast.FastCast = {
        left_ear = "Loquacious Earring"
    }

    sets.midcast.Ninja.Debuff = {
        head = "Ninja Hatsuburi"
    }

    sets.midcast.Ninja.Nuke = {
        head = "Ninja Hatsuburi"
    }

    -- =========================================================================================================
    -- ***Job Ability Sets***
    -- =========================================================================================================

    -- =========================================================================================================
    -- ***Stances***
    -- =========================================================================================================
    stances.NIN = S {'Yonin', 'Innin'}
end
