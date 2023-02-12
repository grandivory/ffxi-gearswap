include('set-behavior')
include('augments')

-- Set this to to /equipset you want to use for your lockstyle
lockstyleset = 9

function define_sets()
    Melee_Modes = T {'DT', 'DW'}
    Idle_Modes = T {'Speed', 'PetAtt', 'PetDT'}

    fastcast = .45 -- This defines how much fast cast you have, which is used when canceling spell effects (.8 = 80%)

    th_gear = {
        ammo = "Per. Lucky Egg",
        legs = "Volte Hose",
        waist = "Chaac Belt"
    }

    back = {
        petphys = {
            name = "Artio's Mantle",
            augments = {'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20', 'Pet: Attack+10 Pet: Rng.Atk.+10'}
        },
        petmabfc = {
            name = "Artio's Mantle",
            augments = {'Pet: M.Acc.+20 Pet: M.Dmg.+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Pet: Mag. Acc.+10',
                        '"Fast Cast"+10', 'Pet: Damage taken -5%'}
        },
        tp = {
            name = "Artio's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Phys. dmg. taken-10%'}
        },
        strda = {
            name = "Artio's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        },
        mabws = {
            name = "Artio's Mantle",
            augments = {'MND+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'MND+10', 'Weapon skill damage +10%',
                        'Phys. dmg. taken-10%'}
        }
    }

    af = {
        head = "Totemic Helm +1",
        body = "Totemic Jackcoat +3",
        hands = "Totemic Gloves +1",
        legs = "Totemic Trousers +1",
        feet = "Totemic Gaiters +1"
    }

    relic = {
        head = "Ankusa Helm +1",
        body = "Ankusa Jackcoat +1",
        hands = "Ankusa Gloves +1",
        legs = "Ankusa Trousers +1",
        feet = "Ankusa Gaiters +1"
    }

    empy = {
        head = "Nukumi Cabasset +1",
        body = "Nukumi Gausape +1",
        hands = "Nukumi Manoplas +1",
        legs = "Nukumi Quijotes +1",
        feet = "Nukumi Ocreae +1"
    }

    -- sets.empy = empy

    -- =========================================================================================================
    -- ***Not Engaged Sets***
    -- =========================================================================================================
    -- TODO
    sets.Idle = {
        main = ikenga.axe,
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
    sets.Idle_Pet.Speed = set_combine(sets.Idle.Speed, {
        main = agwu.axe
    })

    sets.Idle_Pet.PetAtt = {
        main = agwu.axe,
        ammo = "Voluspa Tathlum",
        -- ammo = "Hesperiidae",
        head = taliah.head,
        body = taeon.body.pet,
        -- body = relic.body,
        hands = taeon.hands.pet,
        legs = taeon.legs.pet,
        -- legs = relic.legs,
        feet = gleti.feet,
        neck = "Shulmanu Collar",
        waist = "Incarnation Sash",
        left_ear = "Domes. Earring",
        right_ear = "Enmerkar Earring",
        left_ring = "Varar Ring +1",
        right_ring = "Varar Ring +1",
        back = back.petphys
    }

    sets.Idle_Pet.PetDT = {
        main = agwu.axe,
        ammo = "Voluspa Tathlum",
        -- ammo = "Hesperiidae",
        head = "Anwig Salade",
        body = af.body,
        hands = gleti.hands,
        legs = taliah.legs,
        feet = taeon.feet.pet,
        neck = "Shepherd's Chain",
        waist = "Isa Belt",
        left_ear = "Rimeice Earring",
        right_ear = "Enmerkar Earring",
        left_ring = "Varar Ring +1",
        right_ring = "Thur. Ring +1",
        back = back.petphys
    }

    -- =========================================================================================================
    -- ***Engaged Sets***
    -- =========================================================================================================
    sets.TP.DT = {
        main = ikenga.axe,
        ammo = "Coiste Bodhar",
        head = malignance.head,
        body = gleti.body,
        hands = malignance.hands,
        legs = malignance.legs,
        feet = malignance.feet,
        neck = "Shulmanu Collar",
        waist = "Windbuffet Belt +1",
        left_ear = "Telos Earring",
        right_ear = "Sherida Earring",
        left_ring = "Gere Ring",
        right_ring = "Epona's Ring",
        back = back.tp
    }

    sets.TP.DW = {
        main = ikenga.axe,
        sub = agwu.axe,
        ammo = "Coiste Bodhar",
        head = malignance.head,
        body = gleti.body,
        hands = malignance.hands,
        legs = malignance.legs,
        feet = malignance.feet,
        neck = "Shulmanu Collar",
        waist = "Reiki Yotai",
        left_ear = "Eabani Earring",
        right_ear = "Sherida Earring",
        left_ring = "Gere Ring",
        right_ring = "Epona's Ring",
        back = back.tp
    }

    sets.TP.Dual = {}

    -- =========================================================================================================
    -- ***Weapon Skill Sets***
    -- =========================================================================================================
    -- TODO: Use Empy body to ws with Killer Instinct active
    sets.WS.Generic = {
        ammo = "Oshasha's Treatise",
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
        right_ring = "Beithir Ring",
        back = back.strda
    }
    sets.WS.MAB = {
        ammo = "Ghastly Tathlum +1",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Sibyl Scarf",
        waist = "Orpheus's Sash",
        left_ear = "Moonshade Earring",
        right_ear = "Friomisi Earring",
        left_ring = "Metamorph Ring +1",
        right_ring = "Epaminondas's Ring",
        back = back.mabws
    }
    sets.WS.Decimation = {
        ammo = "Coiste Bodhar",
        head = gleti.head,
        body = gleti.body,
        hands = gleti.hands,
        legs = gleti.legs,
        feet = empy.feet,
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Brutal Earring",
        right_ear = "Sherida Earring",
        left_ring = "Gere Ring",
        right_ring = "Epona's Ring",
        back = back.strda
    }
    sets.WS.Ruinator = {
        ammo = "Coiste Bodhar",
        head = gleti.head,
        body = gleti.body,
        hands = gleti.hands,
        legs = gleti.legs,
        feet = empy.feet,
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Brutal Earring",
        right_ear = "Sherida Earring",
        left_ring = "Gere Ring",
        right_ring = "Regal Ring",
        back = back.strda
    }
    sets.WS["Primal Rend"] = {
        ammo = "Oshasha's Treatise",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Sibyl Scarf",
        waist = "Orpheus's Sash",
        left_ear = "Moonshade Earring",
        right_ear = "Friomisi Earring",
        left_ring = "Epaminondas's Ring",
        right_ring = "Metamorph Ring +1",
        back = back.mabws
    }
    sets.WS.Cloudsplitter = {
        ammo = "Oshasha's Treatise",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Sibyl Scarf",
        waist = "Orpheus's Sash",
        left_ear = "Moonshade Earring",
        right_ear = "Friomisi Earring",
        left_ring = "Epaminondas's Ring",
        right_ring = "Metamorph Ring +1",
        back = back.mabws
    }
    sets.WS.Calamity = {
        ammo = "Oshasha's Treatise",
        head = nyame.head,
        body = nyame.body,
        -- body = empy.body,
        hands = nyame.hands,
        legs = gleti.legs,
        feet = gleti.feet,
        neck = "Rep. Plat. Medal",
        waist = "Sailfi Belt +1",
        left_ear = "Moonshade Earring",
        right_ear = "Thrud Earring",
        left_ring = "Beithir Ring",
        right_ring = "Regal Ring",
        back = back.strda
    }
    sets.WS["Mistral Axe"] = {
        ammo = "Oshasha's Treatise",
        head = nyame.head,
        body = nyame.body,
        -- body = empy.body,
        hands = nyame.hands,
        legs = gleti.legs,
        feet = gleti.feet,
        -- feet = empy.feet,
        neck = "Rep. Plat. Medal",
        waist = "Sailfi Belt +1",
        left_ear = "Moonshade Earring",
        right_ear = "Sherida Earring",
        left_ring = "Beithir Ring",
        right_ring = "Regal Ring",
        back = back.strda
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
        back = back.strda
    }

    -- =========================================================================================================
    -- ***Job Ability Sets***
    -- =========================================================================================================
    sets.JA['Call Beast'] = {
        hands = relic.hands
    }
    sets.JA['Bestial Loyalty'] = sets.JA['Call Beast']
    sets.JA.Reward = {
        ammo = "Pet Food Theta",
        head = nyame.head,
        body = af.body,
        hands = malignance.hands,
        legs = relic.legs,
        feet = relic.feet,
        neck = "Phalaina Locket",
        waist = "Engraved Belt",
        left_ring = "Metamor. Ring +1",
        right_ring = "Stikini Ring +1",
        back = back.mabws
    }
    sets.JA.Charm = {
        ammo = "Voluspa Tathlum",
        head = af.head,
        body = relic.body,
        hands = relic.hands,
        legs = relic.legs,
        feet = relic.feet,
        neck = "Unmoving Collar +1",
        left_ear = "Enchntr. Earring +1",
        left_ring = "Metamorph Ring +1",
        back = back.mabws
    }
    sets.JA.Ready = {
        hands = empy.hands,
        legs = gleti.legs
    }
    sets.JA["Feral Howl"] = {
        ammo = "Pemphredo Tathlum",
        head = nyame.head,
        body = relic.body,
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
    sets.JA.Familiar = {
        legs = relic.legs
    }
    sets.JA['Killer Instinct'] = {
        head = relic.head
    }
    sets.JA.Spur = {
        feet = empy.feet
    }

    -- =========================================================================================================
    -- ***Item Sets***
    -- =========================================================================================================
    sets.item["Holy Water"] = {
        neck = "Nicander's Necklace",
        left_ring = "Purity Ring",
        right_ring = "Blenmot's Ring +1"
    }

    -- =========================================================================================================
    -- ***Precast Sets for Spells***
    -- =========================================================================================================
    sets.precast.FastCast = { -- 45%
        ammo = "Sapience Orb", -- 2%
        head = taeon.head.fcphalanx, -- 5%
        body = "Sacro Breastplate", -- 10%
        hands = "Leyline Gloves", -- 7%
        legs = taeon.legs.fcphalanx, -- 5%
        feet = taeon.feet.fcphalanx, -- 5%
        neck = "Orunmila's Torque", -- 5%
        left_ear = "Enchntr. Earring +1", -- 2%
        right_ear = "Loquac. Earring", -- 2%
        left_ring = "Rahab Ring", -- 2%
        back = back.petmabfc
    }

    -- =========================================================================================================
    -- ***Midcast Sets for Spells***
    -- =========================================================================================================

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
        -- ammo = "Hesperiidae",
        head = nyame.head,
        body = "Udug Jacket",
        hands = nyame.hands,
        -- hands = empy.hands,
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
        -- ammo = "Hesperiidae",
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
        back = back.petphys
    }
    sets.pet_midcast.MultiHit = {
        main = agwu.axe,
        ammo = "Voluspa Tathlum",
        -- ammo = "Hesperiidae",
        head = taeon.head.pet,
        body = taeon.body.pet,
        hands = taeon.hands.pet,
        -- hands = empy.hands,
        legs = taeon.legs.pet,
        feet = gleti.feet,
        neck = "Shulmanu Collar",
        waist = "Incarnation Sash",
        left_ear = "Domes. Earring",
        right_ear = "Enmerkar Earring",
        left_ring = "Thur. Ring +1",
        right_ring = "C. Palug Ring",
        back = back.petphys
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
