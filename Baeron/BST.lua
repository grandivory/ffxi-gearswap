include('set-behavior')
include('augments')

-- Set this to to /equipset you want to use for your lockstyle
lockstyleset = 9

function define_sets()
    Melee_Modes = T {'DT', 'DW'}
    Idle_Modes = T {'Speed', 'PetAtt', 'PetDT'}

    fastcast = .53 -- This defines how much fast cast you have, which is used when canceling spell effects (.8 = 80%)

    th_gear = {
        ammo = "Per. Lucky Egg",
        legs = "Volte Hose",
        waist = "Chaac Belt"
    }

    back = {
        petmabfc = {
            name = "Artio's Mantle",
            augments = {'Pet: M.Acc.+20 Pet: M.Dmg.+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Pet: Mag. Acc.+10',
                        '"Fast Cast"+10', 'Pet: Damage taken -5%'}
        }
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
        feet = "Skd. Jambeaux +1",
        neck = "Loricate Torque +1",
        waist = "Isa Belt",
        left_ear = "Rimeice Earring",
        right_ear = "Enmerkar Earring",
        left_ring = "Defending Ring",
        right_ring = "Thur. Ring +1",
        back = back.petmabfc
    }

    sets.Idle.PetAtt = {
        ammo = "Voluspa Tathlum",
        head = taliah.head,
        body = taeon.body.pet,
        hands = taeon.hands.pet,
        legs = taeon.legs.pet,
        feet = gleti.feet,
        neck = "Shulmanu Collar",
        waist = "Incarnation Sash",
        left_ear = "Domes. Earring",
        right_ear = "Enmerkar Earring",
        left_ring = "Varar Ring +1",
        right_ring = "Varar Ring +1",
        back = back.petmabfc
    }

    sets.Idle.PetDT = {
        main = agwu.axe,
        ammo = "Voluspa Tathlum",
        head = "Anwig Salade",
        body = taeon.body.pet,
        hands = taeon.hands.pet,
        legs = taliah.legs,
        feet = taeon.feet.pet,
        neck = "Shepherd's Chain",
        waist = "Isa Belt",
        left_ear = "Rimeice Earring",
        right_ear = "Enmerkar Earring",
        left_ring = "Varar Ring +1",
        right_ring = "Thur. Ring +1",
        back = back.petmabfc
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
        waist = "Windbuffet Belt +1",
        left_ear = "Eabani Earring",
        right_ear = "Sherida Earring",
        left_ring = "Gere Ring",
        right_ring = "Epona's Ring",
        back = back.petmabfc
    }

    sets.TP.DW = {
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
        back = back.petmabfc
    }

    sets.TP.Dual = {}

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
        waist = "Fotia Belt",
        left_ear = "Moonshade Earring",
        right_ear = "Thrud Earring",
        left_ring = "Gere Ring",
        right_ring = "Epaminondas's Ring",
        back = back.petmabfc
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
        back = back.petmabfc
    }
    sets.WS.Decimation = {
        ammo = "Coiste Bodhar",
        head = gleti.head,
        body = gleti.body,
        hands = gleti.hands,
        legs = gleti.legs,
        feet = gleti.feet,
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Sherida Earring",
        right_ear = "Brutal Earring",
        left_ring = "Gere Ring",
        right_ring = "Epona's Ring",
        back = back.petmabfc
    }
    sets.WS.Ruinator = {
        ammo = "Coiste Bodhar",
        head = gleti.head,
        body = gleti.body,
        hands = gleti.hands,
        legs = gleti.legs,
        feet = gleti.feet,
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Sherida Earring",
        right_ear = "Brutal Earring",
        left_ring = "Gere Ring",
        right_ring = "Regal Ring",
        back = back.petmabfc
    }
    sets.WS["Primal Rend"] = {
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
        left_ring = "Epaminondas's Ring",
        right_ring = "Metamorph Ring +1",
        back = back.petmabfc
    }
    sets.WS.Calamity = {
        ammo = "Aurgelmir Orb +1",
        head = nyame.head,
        body = gleti.body,
        hands = nyame.hands,
        legs = gleti.legs,
        feet = gleti.feet,
        neck = "Caro Necklace",
        waist = "Sailfi Belt +1",
        left_ear = "Moonshade Earring",
        right_ear = "Thrud Earring",
        left_ring = "Epaminondas's Ring",
        right_ring = "Regal Ring",
        back = back.petmabfc
    }
    sets.WS["Mistral Axe"] = {
        ammo = "Aurgelmir Orb +1",
        head = nyame.head,
        body = gleti.body,
        hands = nyame.hands,
        legs = gleti.legs,
        feet = gleti.feet,
        neck = "Caro Necklace",
        waist = "Sailfi Belt +1",
        left_ear = "Moonshade Earring",
        right_ear = "Thrud Earring",
        left_ring = "Epaminondas's Ring",
        right_ring = "Regal Ring",
        back = back.petmabfc
    }
    sets.WS.Rampage = {
        ammo = "Aurgelmir Orb +1",
        head = "Blistering Sallet +1",
        body = gleti.body,
        hands = gleti.hands,
        legs = gleti.legs,
        feet = gleti.feet,
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Moonshade Earring",
        right_ear = "Sherida Earring",
        left_ring = "Begrudging Ring",
        right_ring = "Regal Ring",
        back = back.petmabfc
    }

    -- =========================================================================================================
    -- ***Job Ability Sets***
    -- =========================================================================================================
    -- sets.JA['Call Beast'] = {}
    -- sets.JA['Bestial Loyalty'] = sets.JA['Call Beast']
    sets.JA.Reward = {
        ammo = "Pet Food Theta",
        head = nyame.head,
        body = nyame.body,
        hands = malignance.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Phalaina Locket",
        left_ring = "Metamor. Ring +1",
        right_ring = "Stikini Ring +1",
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
    sets.JA["Feral Howl"] = {
        ammo = "Pemphredo Tathlum",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Sanctity Necklace",
        waist = "Eschan Stone",
        left_ear = "Digni. Earring",
        right_ear = "Crep. Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = back.petmabfc
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
        left_ring = "Rahab Ring", -- 2%
        back = back.petmabfc

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
        feet = gleti.feet,
        neck = "Adad Amulet",
        waist = "Incarnation Sash",
        left_ear = "Crep. Earring",
        right_ear = "Enmerkar Earring",
        left_ring = taliah.ring,
        right_ring = "C. Palug Ring",
        back = back.petmabfc
    }
    sets.pet_midcast.Magic = {
        main = agwu.axe,
        ammo = "Voluspa Tathlum",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = gleti.feet,
        neck = "Adad Amulet",
        waist = "Incarnation Sash",
        left_ear = "Crep. Earring",
        right_ear = "Enmerkar Earring",
        left_ring = taliah.ring,
        right_ring = "C. Palug Ring",
        back = back.petmabfc
    }
    sets.pet_midcast.Physical = {
        main = agwu.axe,
        ammo = "Voluspa Tathlum",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = gleti.feet,
        neck = "Shulmanu Collar",
        waist = "Klouskap Sash +1",
        left_ear = "Domes. Earring",
        right_ear = "Enmerkar Earring",
        left_ring = "Thur. Ring +1",
        right_ring = "C. Palug Ring",
        back = back.petmabfc
    }
    sets.pet_midcast.MultiHit = {
        main = agwu.axe,
        ammo = "Voluspa Tathlum",
        head = taeon.head.pet,
        body = taeon.body.pet,
        hands = taeon.hands.pet,
        legs = taeon.legs.pet,
        feet = gleti.feet,
        neck = "Shulmanu Collar",
        waist = "Incarnation Sash",
        left_ear = "Domes. Earring",
        right_ear = "Enmerkar Earring",
        left_ring = "Thur. Ring +1",
        right_ring = "C. Palug Ring",
        back = back.petmabfc
    }
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
