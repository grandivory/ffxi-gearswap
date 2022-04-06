include('set-behavior')
include('augments')

-- Set this to to /equipset you want to use for your lockstyle
lockstyleset = 9

function define_sets()
    Melee_Modes = T {'DT', 'Dual'}
    Idle_Modes = T {'Speed', 'PetAtt', 'PetDT'}

    fastcast = .43 -- This defines how much fast cast you have, which is used when canceling spell effects (.8 = 80%)

    th_gear = {
        ammo = "Per. Lucky Egg",
        legs = "Volte Hose",
        waist = "Chaac Belt"
    }

    -- =========================================================================================================
    -- ***Not Engaged Sets***
    -- =========================================================================================================
    sets.Idle.Speed = {
        main = agwu.axe,
        sub = "Adapa Shield",
        ammo = "Crepuscular Pebble",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = "Skadi's Jambeaux",
        neck = "Loricate Torque +1",
        waist = "Isa Belt",
        left_ear = "Rimeice Earring",
        right_ear = "Enmerkar Earring",
        left_ring = "Defending Ring",
        right_ring = "Thur. Ring +1",
        back = "Earthcry Mantle"
    }

    sets.Idle.PetAtt = {
        ammo = "Voluspa Tathlum",
        head = taeon.head.pet,
        body = taeon.body.pet,
        hands = taeon.hands.pet,
        legs = taeon.legs.pet,
        feet = taeon.feet.pet,
        neck = "Shulmanu Collar",
        waist = "Incarnation Sash",
        left_ear = "Domes. Earring",
        right_ear = "Enmerkar Earring",
        left_ring = "Varar Ring +1",
        right_ring = "Varar Ring +1",
        back = "Earthcry Mantle"
    }

    sets.Idle.PetDT = {
        ammo = "Voluspa Tathlum",
        head = "Anwig Salade",
        body = taeon.body.pet,
        hands = taeon.hands.pet,
        legs = taeon.legs.pet,
        feet = taeon.feet.pet,
        neck = "Shepherd's Chain",
        waist = "Isa Belt",
        left_ear = "Rimeice Earring",
        right_ear = "Enmerkar Earring",
        left_ring = "Varar Ring +1",
        right_ring = "Thur. Ring +1",
        back = "Earthcry Mantle"
    }

    -- =========================================================================================================
    -- ***Engaged Sets***
    -- =========================================================================================================
    sets.TP.DT = {
        ammo = "Coiste Bodhar",
        head = "Malignance Chapeau",
        body = "Gleti's Cuirass",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Shulmanu Collar",
        waist = "Reiki Yotai",
        left_ear = "Eabani Earring",
        right_ear = "Sherida Earring",
        left_ring = "Gere Ring",
        right_ring = "Epona's Ring",
        back = "Earthcry Mantle"
    }

    sets.TP.Dual = sets.TP.DT

    -- =========================================================================================================
    -- ***Weapon Skill Sets***
    -- =========================================================================================================
    sets.WS.Generic = {
        ammo = "Aurgelmir Orb +1",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Fotia Gorget",
        waist = "Fotie Belt",
        left_ear = "Moonshade Earring",
        right_ear = "Thrud Earring",
        left_ring = "Gere Ring",
        right_ring = "Epaminondas's Ring",
        back = "Earthcry Mantle"
    }
    sets.WS.MAB = {
        ammo = "Pemphredo Tathlum",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Baetyl Pendant",
        waist = "Orpheus's Sash",
        left_ear = "Moonshade Earring",
        right_ear = "Friomisi Earring",
        left_ring = "Metamorph Ring +1",
        right_ring = "Epaminondas's Ring",
        back = "Earthcry Mantle"
    }

    -- =========================================================================================================
    -- ***Job Ability Sets***
    -- =========================================================================================================
    -- sets.JA['Call Beast'] = {}
    -- sets.JA['Bestial Loyalty'] = sets.JA['Call Beast']
    sets.JA['Reward'] = {
        ammo = "Pet Food Theta",
        hands = "Malignance Gloves",
        back = "Artio's Mantle"
    }
    sets.JA.Charm = {
        ammo = "Voluspa Tathlum",
        neck = "Unmoving Collar +1",
        left_ear = "Enchntr. Earring +1",
        left_ring = "Metamorph Ring +1"
    }
    sets.JA.Ready = {
        legs = gleti.legs
    }
    -- sets.JA['Killer Instinct'] = {}
    -- sets.JA.Spur = {}

    -- =========================================================================================================
    -- ***Precast Sets for Spells***
    -- =========================================================================================================
    sets.precast.FastCast = { -- 43%
        ammo = "Sapience Orb", -- 2%
        head = taeon.head.fcphalanx, -- 5%
        body = taeon.body.fcphalanx, -- 5%
        hands = "Leyline Gloves", -- 7%
        legs = taeon.legs.fcphalanx, -- 5%
        feet = taeon.feet.fcphalanx, -- 5%
        neck = "Orunmila's Torque", -- 5%
        left_ear = "Enchntr. Earring +1", -- 2%
        right_ear = "Loquac. Earring", -- 5%
        left_ring = "Rahab Ring" -- 2%

    }

    -- =========================================================================================================
    -- ***Pet Midcast Sets***
    -- =========================================================================================================
    sets.pet_midcast.MAcc = {
        main = agwu.axe,
        ammo = "Voluspa Tathlum",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Adad Amulet",
        waist = "Incarnation Sash",
        left_ear = "Crep. Earring",
        right_ear = "Enmerkar Earring",
        left_ring = taliah.ring,
        right_ring = "C. Palug Ring",
        back = "Earthcry Mantle"
    }
    sets.pet_midcast.Magic = {
        main = agwu.axe,
        ammo = "Voluspa Tathlum",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Adad Amulet",
        waist = "Incarnation Sash",
        left_ear = "Crep. Earring",
        right_ear = "Enmerkar Earring",
        left_ring = taliah.ring,
        right_ring = "C. Palug Ring",
        back = "Earthcry Mantle"
    }
    sets.pet_midcast.MagicTP = {}
    sets.pet_midcast.Physical = {}
    sets.pet_midcast.MultiHit = {}
    sets.pet_midcast.Generic = sets.pet_midcast.Physical -- If no other set is found, this set is used instead

    -- =========================================================================================================
    -- ***Weather Gear***
    -- =========================================================================================================
    sets.Weather = {
        waist = "Hachirin-no-obi",
        back = "Twilight Cape"
    }

    sets.Distance = {
        waist = "Orpheus's Sash"
    }

end
