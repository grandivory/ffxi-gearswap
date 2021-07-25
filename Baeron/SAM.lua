include('set-behavior')
include('utils')
include('augments')

lockstyleset = 12

function define_sets()
    Melee_Modes = T {'SAM', 'TH'}
    Idle_Modes = T {'Idle'}
    Magic_Modes = T {}

    fastcast = 0

    tool_threshold = 10

    th_gear = {
        ammo = "Per. Lucky Egg",
        legs = "Volte Hose"
    }

    -- Idle sets
    sets.Idle = {
        ammo = "Ginsen",
        head = "Mpaca's Cap",
        body = "Mpaca's Doublet",
        hands = "Ryuo Tekko +1",
        legs = "Mpaca's Hose",
        feet = "Danzo Sune-Ate",
        neck = "Sanctity Necklace",
        waist = "Sailfi Belt +1",
        left_ear = "Telos Earring",
        right_ear = "Cessance Earring",
        left_ring = "Regal Ring",
        right_ring = "Chirich Ring +1",
        back = "Mecistopin's Mantle"
    }

    -- Engaged sets
    sets.TP = {
        sub = "Utu Grip",
        ammo = "Ginsen",
        head = "Mpaca's Cap",
        body = "Mpaca's Doublet",
        hands = "Ryuo Tekko +1",
        legs = "Mpaca's Hose",
        feet = "Mpaca's Boots",
        neck = "Sanctity Necklace",
        waist = "Sailfi Belt +1",
        left_ear = "Telos Earring",
        right_ear = "Cessance Earring",
        left_ring = "Regal Ring",
        right_ring = "Chirich Ring +1",
        back = "Mecistopin's Mantle"
    }

    sets.TP.TH = set_combine(sets.TP, th_gear)

    -- Weapon Skill Sets
    ws = {
        sub = "Utu Grip",
        ammo = "Ginsen",
        head = "Mpaca's Cap",
        body = "Mpaca's Doublet",
        hands = "Ryuo Tekko +1",
        legs = "Mpaca's Hose",
        feet = "Mpaca's Boots",
        neck = "Sanctity Necklace",
        waist = "Sailfi Belt +1",
        left_ear = "Telos Earring",
        right_ear = "Cessance Earring",
        left_ring = "Regal Ring",
        right_ring = "Chirich Ring +1",
        back = "Mecistopin's Mantle"
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
