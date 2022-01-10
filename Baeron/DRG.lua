include('set-behavior')

-- Set this to to /equipset you want to use for your lockstyle
lockstyleset = 14

function define_sets()
    -- =========================================================================================================
    -- ***Not Engaged Sets***
    -- =========================================================================================================
    sets.Idle = {
        ammo = "Olibanum Sachet",
        head = "Empress Hairpin",
        body = "Padded Armor",
        hands = "Iron Mittens",
        legs = "Iron Subligar",
        feet = "Bounding Boots",
        neck = "Peacock Amulet",
        waist = "Swift Belt",
        left_ear = "Beetle Earring +1",
        right_ear = "Beetle Earring +1",
        left_ring = "Rajas Ring",
        right_ring = "Jaeger Ring"
    }

    -- =========================================================================================================
    -- ***Engaged Sets***
    -- =========================================================================================================
    sets.TP = {
        main = "Mythril Lance",
        ammo = "Olibanum Sachet",
        head = "Empress Hairpin",
        body = "Padded Armor",
        hands = "Iron Mittens",
        legs = "Iron Subligar",
        feet = "Bounding Boots",
        neck = "Peacock Amulet",
        waist = "Swift Belt",
        left_ear = "Beetle Earring +1",
        right_ear = "Beetle Earring +1",
        left_ring = "Rajas Ring",
        right_ring = "Jaeger Ring"
    }

    -- =========================================================================================================
    -- ***Weapon Skill Sets***
    -- =========================================================================================================
    sets.WS.Generic = {
        ammo = "Olibanum Sachet",
        head = "Voyager Sallet",
        body = "Padded Armor",
        hands = "Iron Mittens",
        legs = "Iron Subligar",
        feet = "Bounding Boots",
        neck = "Spike Necklace",
        waist = "Swift Belt",
        left_ear = "Beetle Earring +1",
        right_ear = "Beetle Earring +1",
        left_ring = "Rajas Ring",
        right_ring = "Kshama Ring No.8"
    }

end
