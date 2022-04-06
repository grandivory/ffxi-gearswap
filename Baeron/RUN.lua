include('set-behavior')

-- Set this to to /equipset you want to use for your lockstyle
lockstyleset = 4

function define_sets()
    Melee_Modes = T {'Tank', 'Damage'}

    -- =========================================================================================================
    -- ***Not Engaged Sets***
    -- =========================================================================================================
    sets.Idle = {
        sub = "Utu Grip",
        ammo = "Coiste Bodhar",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Loricate Torque +1",
        waist = "Flume Belt +1",
        left_ear = "Tuisto Earring",
        right_ear = "Etiolation Earring",
        left_ring = "Defending Ring",
        right_ring = "Dark Ring",
        back = "Cerb. Mantle +1"
    }

    -- =========================================================================================================
    -- ***Engaged Sets***
    -- =========================================================================================================
    sets.TP.Tank = {
        sub = "Utu Grip",
        ammo = "Coiste Bodhar",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Sanctity Necklace",
        waist = "Windbuffet Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Telos Earring",
        left_ring = "Epona's Ring",
        right_ring = "Niqmaddu Ring",
        back = "Cerb. Mantle +1"
    }

    sets.TP.Damage = {
        sub = "Utu Grip",
        ammo = "Coiste Bodhar",
        head = adhemar.head,
        body = ayanmo.body,
        hands = adhemar.hands,
        legs = "Samnuha Tights",
        feet = "Herculean Boots",
        neck = "Sanctity Necklace",
        waist = "Windbuffet Belt +1",
        left_ear = "Sherida Earring",
        right_ear = "Telos Earring",
        left_ring = "Epona's Ring",
        right_ring = "Niqmaddu Ring",
        back = "Cerb. Mantle +1"
    }

    -- =========================================================================================================
    -- ***Weapon Skill Sets***
    -- =========================================================================================================
    sets.WS.Dimidiation = {
        ammo = "Knobkierrie",
        head = nyame.head,
        body = nyame.body,
        hands = "Meg. Gloves +2",
        legs = "Lustr. Subligar +1",
        feet = "Lustra. Leggings +1",
        neck = "Caro Necklace",
        waist = "Grunfeld Rope",
        left_ear = "Moonshade Earring",
        right_ear = "Sherida Earring",
        left_ring = "Regal Ring",
        right_ring = "Ilabrat Ring",
        back = "Cerb. Mantle +1"
    }
    sets.WS.Generic = {
        ammo = "Knobkierrie",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Moonshade Earring",
        right_ear = "Brutal Earring",
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = "Cerb. Mantle +1"
    }
    sets.WS.MAB = {
        ammo = "Ghastly Tathlum +1",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Baetyl Pendant",
        waist = "Eschan Stone",
        left_ear = "Moonshade Earring",
        right_ear = "Friomisi Earring",
        left_ring = "Metamorph Ring +1",
        right_ring = "Shiva Ring +1"
    }

    -- =========================================================================================================
    -- ***Job Ability Sets***
    -- =========================================================================================================
    magic_damage = {
        ammo = "Ghastly Tathlum +1",
        head = "Agwu's Cap",
        body = "Agwu's Robe",
        hands = "Agwu's Gages",
        legs = "Agwu's Slops",
        feet = "Agwu's Pigaches",
        neck = "Baetyl Pendant",
        waist = "Eschan Stone",
        left_ear = "Digni. Earring",
        right_ear = "Friomisi Earring",
        left_ring = "Mujin Band",
        right_ring = "Shiva Ring +1"
    }
    sets.JA.Swipe = magic_damage
    sets.JA.Lunge = magic_damage

    sets.Distance = {
        waist = "Orpheus's Sash"
    }

end
