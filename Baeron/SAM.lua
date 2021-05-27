include('set-behavior')
include('utils')
include('augments')

lockstyleset = 12

function define_sets()
    Melee_Modes = T {'SAM'}
    Idle_Modes = T {'Idle'}
    Magic_Modes = T {}

    fastcast = 0

    tool_threshold = 10

    -- Idle sets
    sets.Idle = {
        main = "Kikugosaku",
        ammo = "Olibanum Sachet",
        head = "Usukane Somen",
        body = "Usukane Haramaki",
        hands = "Usukane Gote",
        legs = "Usukane Hizayoroi",
        feet = "Danzo Sune-Ate",
        neck = "Chivalrous Chain",
        waist = "Ninurta's Sash",
        left_ear = "Brutal Earring",
        right_ear = "Coral Earring",
        left_ring = "Defending Ring",
        right_ring = {
            name = "Dark Ring",
            augments = {'Phys. dmg. taken -5%', 'Magic dmg. taken -6%'}
        },
        back = "Cerb. Mantle +1"
    }

    -- Engaged sets
    sets.TP = {
        main = "Kikugosaku",
        sub = "Oneiros Grip",
        ammo = "Olibanum Sachet",
        head = "Unkai Kabuto +1",
        body = "Unkai Domaru +2",
        hands = "Unkai Kote +2",
        legs = "Unkai Haidate +2",
        feet = "Unkai Sune-Ate +1",
        neck = "Unkai Nodowa",
        waist = "Ninurta's Sash",
        left_ear = "Brutal Earring",
        right_ear = "Coral Earring",
        left_ring = "Rajas Ring",
        right_ring = "Jaeger Ring",
        back = "Cerb. Mantle +1"
    }

    -- Weapon Skill Sets
    ws = {
        main = "Kikugosaku",
        sub = "Oneiros Grip",
        ammo = "Olibanum Sachet",
        head = "Usukane Somen",
        body = "Usukane Haramaki",
        hands = "Unkai Kote +2",
        legs = "Unkai Haidate +2",
        feet = "Unkai Sune-Ate +1",
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Coral Earring",
        left_ring = "Rajas Ring",
        right_ring = "Strigoi Ring",
        back = "Cerb. Mantle +1"
    } -- Any physical weapon skill that isn't otherwise specified

    sets.WS.Generic = copy(ws)
    sets.WS.Generic.withBuffs = {}
    sets.WS.Generic.withBuffs["Sekkanoki"] = set_combine(ws, {
        hands = "Unkai Kote +2"
    })

    -- Job Ability Sets
    sets.JA['Meditate'] = {
        head = "Myochin Kabuto",
        hands = "Saotome Kote"
    }
    sets.JA['Third Eye'] = {
        legs = "Saotome Haidate"
    }

    -- Weather gear
    sets.Weather = {
        waist = "Hachirin-no-obi",
        back = "Twilight Cape"
    }
end
