include('set-behavior')

-- Set this to to /equipset you want to use for your lockstyle
lockstyleset = 9

function define_sets()
    -- =========================================================================================================
    -- ***Not Engaged Sets***
    -- =========================================================================================================
    sets.Idle = {
        ammo = "Coiste Bodhar",
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Sanctity Necklace",
        waist = "Windbuffet Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Telos Earring",
        left_ring = "Epona's Ring",
        right_ring = "Petrov Ring",
        back = "Mecisto. Mantle"
    }

    -- =========================================================================================================
    -- ***Engaged Sets***
    -- =========================================================================================================
    sets.TP = {
        ammo = "Coiste Bodhar",
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Sanctity Necklace",
        waist = "Windbuffet Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Telos Earring",
        left_ring = "Epona's Ring",
        right_ring = "Petrov Ring",
        back = "Mecisto. Mantle"
    }

    -- =========================================================================================================
    -- ***Weapon Skill Sets***
    -- =========================================================================================================
    sets.WS.Generic = {
        ammo = "Coiste Bodhar",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Sherida Earring",
        right_ear = "Ishvara Earring",
        left_ring = "Rufescent Ring",
        right_ring = "Shukuyu Ring",
        back = "Mecisto. Mantle"
    }

    -- =========================================================================================================
    -- ***Job Ability Sets***
    -- =========================================================================================================
    sets.JA.Reward = {
        ammo = "Pet Food Zeta"
    }
end
