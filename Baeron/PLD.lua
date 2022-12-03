include('augments')
include('set-behavior')

-- Set this to to /equipset you want to use for your lockstyle
lockstyleset = 7

function define_sets()
    Melee_Modes = T {'Tank', 'MagicTank', 'DD', 'AoE'}
    Idle_Modes = T {'Speed', 'Phys', 'Magic', 'Phalanx', 'Superfast'}
    Magic_Modes = T {'Normal', 'SIRD', 'TH'}
    stances.WAR = S {'Berserk', 'Defender'}

    fastcast = .56 -- This defines how much fast cast you have, which is used when canceling spell effects (.8 = 80%)

    af = {
        head = "Gallant Coronet",
        body = "Reverence Surcoat +3",
        hands = "Gallant Gauntlets",
        legs = "Gallant Breeches",
        feet = "Reverence Leggings +3"
    }

    relic = {
        head = "Caballarius Coronet",
        body = "Caballarius Surcoat",
        hands = "Caballarius Gauntlets",
        legs = "Caballarius Breeches",
        feet = "Caballarius Leggings"
    }

    empy = {
        feet = "Chev. Sabatons +2"
    }

    back = {
        block = {
            name = "Rudianos's Mantle",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'Mag. Evasion+10', 'Enmity+10',
                        'Chance of successful block +5'}
        },
        fc = {
            name = "Rudianos's Mantle",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'Mag. Evasion+10', '"Fast Cast"+10', 'Phys. dmg. taken-10%'}
        },
        dd = {
            name = "Rudianos's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10',
                        'Occ. inc. resist. to stat. ailments+10'}
        },
        strws = {
            name = "Rudianos's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%', 'Phys. dmg. taken-10%'}
        },
        mabws = {
            name = "Rudianos's Mantle",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Magic Damage +10', 'Weapon skill damage +10%',
                        'Phys. dmg. taken-10%'}
        }
    }

    th_gear = {
        ammo = "Per. Lucky Egg",
        legs = "Volte Hose",
        waist = "Chaac Belt"
    }

    enmity = {
        ammo = "Sapience Orb",
        head = "Loess Barbuta +1",
        body = souveran.body,
        hands = souveran.hands,
        legs = souveran.legs,
        feet = "Eschite Greaves",
        neck = "Moonlight Necklace",
        waist = "Creed Baudrier",
        left_ear = "Trux Earring",
        right_ear = "Cryptic Earring",
        left_ring = "Supershear Ring",
        right_ring = "Eihwaz Ring",
        back = back.block
        -- back = back.pdt
    }

    -- =========================================================================================================
    -- ***Not Engaged Sets***
    -- =========================================================================================================
    sets.Idle.Phys = {
        main = "Malignance Sword",
        sub = "Duban",
        ammo = "Staunch Tathlum +1",
        head = sakpata.head,
        body = sakpata.body,
        hands = sakpata.hands,
        legs = sakpata.legs,
        feet = sakpata.feet,
        neck = "Unmoving Collar +1",
        waist = "Flume Belt +1",
        left_ear = "Tuisto Earring",
        right_ear = "Cryptic Earring",
        left_ring = "Moonlight Ring",
        right_ring = "Moonlight Ring",
        back = back.block
    }
    sets.Idle.Speed = set_combine(sets.Idle.Phys, {
        legs = carmine.legs
    })
    sets.Idle.Superfast = set_combine(sets.Idle.Speed, {
        feet = "Hippomenes Socks +1"
    })
    sets.Idle.Magic = {
        main = "Malignance Sword",
        sub = "Aegis",
        ammo = "Staunch Tathlum +1",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Unmoving Collar +1",
        waist = "Carrier's Sash",
        left_ear = "Tuisto Earring",
        right_ear = "Cryptic Earring",
        left_ring = "Moonlight Ring",
        right_ring = "Moonlight Ring",
        back = back.block
    }
    sets.Idle.Phalanx = {
        main = sakpata.sword,
        ammo = "Staunch Tathlum +1",
        head = yorium.head.phalanx,
        body = yorium.body.phalanx,
        hands = souveran.hands,
        legs = sakpata.legs,
        feet = souveran.feet,
        neck = "Unmoving Collar +1",
        waist = "Audumbla Sash",
        left_ear = "Mimir Earring",
        right_ear = "Andoaa Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = "Weard Mantle"
    }

    -- =========================================================================================================
    -- ***Engaged Sets***
    -- =========================================================================================================
    sets.TP.Tank = sets.Idle.Phys
    sets.TP.MagicTank = sets.Idle.Magic
    sets.TP.DD = {
        main = "Naegling",
        sub = "Blurred Shield +1",
        ammo = "Aurgelmir Orb +1",
        head = sakpata.head,
        body = sakpata.body,
        hands = sakpata.hands,
        legs = sakpata.legs,
        feet = sakpata.feet,
        neck = "Combatant's Torque",
        waist = "Sailfi Belt +1",
        left_ear = "Cessance Earring",
        right_ear = "Odnowa Earring +1",
        left_ring = "Moonlight Ring",
        right_ring = "Moonlight Ring",
        back = back.dd
    }
    sets.TP.AoE = set_combine(sets.TP.Tank, {
        main = malevolence
    })

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
        waist = "Sailfi Belt +1",
        left_ear = "Thrud Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Epaminondas's Ring",
        right_ring = "Regal Ring",
        back = back.strws
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
        left_ear = "Friomisi Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Epaminondas's Ring",
        right_ring = "Metamorph Ring +1",
        back = back.mabws
    }

    sets.WS["Savage Blade"] = {
        ammo = "Aurgelmir Orb +1",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Rep. Plat. Medal",
        waist = "Sailfi Belt +1",
        left_ear = "Thrud Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Epaminondas's Ring",
        right_ring = "Regal Ring",
        back = back.strws
    }
    sets.WS.Atonement = set_combine(enmity, {
        waist = "Fotia Belt",
        right_ear = "Moonshade Earring"
    })
    sets.WS["Chant du Cygne"] = {
        ammo = "Aurgelmir Orb +1",
        head = "Blistering Sallet +1",
        body = "Hjarrandi Breast.",
        hands = flamma.hands,
        legs = lustratio.legs,
        feet = lustratio.feet,
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Cessance Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Begrudging Ring",
        right_ring = "Regal Ring",
        back = back.strws
    }
    sets.WS.Requiescat = {
        ammo = "Aurgelmir Orb +1",
        head = "Hjarrandi Helm",
        body = sakpata.body,
        hands = sakpata.hands,
        legs = sakpata.legs,
        feet = sakpata.feet,
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Cessance Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Petrov Ring",
        right_ring = "Regal Ring",
        back = back.strws
    }

    -- =========================================================================================================
    -- ***Job Ability Sets***
    -- =========================================================================================================
    sets.JA.Invincible = set_combine(enmity, {
        -- legs = relic.legs
    })
    sets.JA["Holy Circle"] = set_combine(enmity, {
        feet = af.feet
    })
    sets.JA["Shield Bash"] = set_combine(enmity, {
        -- hands = relic.hands
    })
    sets.JA.Sentinel = set_combine(enmity, {
        -- feet = relic.feet
    })
    sets.JA.Cover = set_combine(enmity, {
        -- head = af.head,
        -- body = relic.body
    })
    sets.JA.Rampart = set_combine(enmity, {
        -- head = relic.head
    })
    sets.JA.Majesty = enmity
    sets.JA.Fealty = set_combine(enmity, {
        -- body = relic.body
    })
    sets.JA.Chivalry = set_combine(enmity, {
        -- hands = relic.hands
    })
    sets.JA["Divine Emblem"] = set_combine(enmity, {
        feet = empy.feet
    })
    sets.JA.Sepulcher = enmity
    sets.JA.Palisade = enmity
    sets.JA.Intervene = enmity

    sets.JA.Provoke = enmity

    -- =========================================================================================================
    -- ***Item Sets***
    -- =========================================================================================================
    sets.item["Holy Water"] = {
        neck = "Nicander's Necklace",
        left_ring = "Purity Ring",
        right_ring = "Blenmot's Ring +1"
    }

    -- =========================================================================================================
    -- ***Precast sets for spells***
    -- =========================================================================================================
    sets.precast.FastCast = { -- 66%
        ammo = "Sapience Orb", -- 2%
        head = carmine.head, -- 14%
        body = "Sacro Breastplate", -- 10%
        hands = "Leyline Gloves", -- 7%
        feet = carmine.feet, -- 8%
        neck = "Orunmila's Torque", -- 5%
        left_ear = "Enchntr. Earring +1", -- 2%
        right_ear = "Loquac. Earring", -- 2%
        left_ring = "Rahab Ring", -- 2%
        right_ring = "Kishar Ring", -- 4%
        back = back.fc -- 10%
    }

    -- =========================================================================================================
    -- ***Midcast Sets***
    -- =========================================================================================================
    sird = { -- 106%, plus 10% from merits
        ammo = "Staunch Tathlum +1", -- 11%
        head = souveran.head, -- 20%
        legs = "Founder's Host", -- 30%
        feet = odyssean.feet.fc, -- 20%
        neck = "Moonlight Necklace", -- 15%
        waist = "Audumbla Sash" -- 10%
    }
    sird_enmity = {
        ammo = "Staunch Tathlum +1", -- 11%, 3% DT
        head = souveran.head, -- 20%
        body = "Hjarrandi Breast.", -- 12% DT
        -- body = af.body,
        hands = sakpata.hands, -- 8% DT
        legs = "Founder's Hose", -- 30%
        feet = odyssean.feet.fc, -- 20%
        neck = "Moonlight Necklace", -- 15%
        waist = "Audumbla Sash", -- 10%
        left_ear = "Odnowa Earring +1", -- 3% DT
        right_ear = "Cryptic Earring",
        left_ring = "Defending Ring", -- 10% DT
        right_ring = "Eihwaz Ring",
        back = back.block
        -- back = back.pdt -- 10% DT
    }

    sets.midcast.Cure = {
        ammo = "Staunch Tathlum +1",
        head = souveran.head,
        body = souveran.body,
        hands = souveran.hands,
        -- hands = "Macabre Gauntlets +1",
        legs = "Founder's Hose",
        feet = odyssean.feet.fc,
        neck = "Moonlight Necklace",
        waist = "Audumbla Sash",
        left_ear = "Tuisto Earring",
        -- right_ear = "Nourishing Earring +1",
        left_ring = "Gelatinous Ring +1",
        right_ring = "Eihwaz Ring"
        -- back = back.cure,
    }

    sets.midcast.Divine = {
        main = "Brilliance",
        ammo = "Staunch Tathlum +1",
        head = souveran.head,
        -- head = "Jumalik Helm",
        -- body = relic.body,
        hands = souveran.hands,
        -- hands = "Eschite Gauntlets",
        legs = "Founder's Hose",
        feet = souveran.feet,
        neck = "Incanter's Torque",
        waist = "Bishop's Sash",
        left_ear = "Halasz Earring",
        -- left_ear = "Knight's Earring",
        -- right_ear = "Diving Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = "Altruistic Cape"
    }
    sets.midcast.Divine.SIRD = {
        main = "Brilliance",
        ammo = "Staunch Tathlum +1",
        head = souveran.head,
        -- head = "Jumalik Helm",
        -- body = relic.body,
        hands = souveran.hands,
        -- hands = "Eschite Gauntlets",
        legs = "Founder's Hose",
        feet = souveran.feet,
        neck = "Incanter's Torque",
        waist = "Audumbla Sash",
        left_ear = "Halasz Earring",
        -- left_ear = "Knight's Earring",
        -- right_ear = "Diving Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = "Altruistic Cape"
    }
    sets.midcast.Flash = {
        ammo = "Sapience Orb",
        head = "Loess Barbuta +1",
        body = souveran.body,
        -- body = af.body,
        hands = souveran.hands,
        legs = souveran.legs,
        feet = souveran.feet,
        -- feet = "Eschite Greaves",
        neck = "Moonlight Necklace",
        waist = "Creed Baudrier",
        left_ear = "Odnowa Earring +1",
        right_ear = "Cryptic Earring",
        left_ring = "Supershear Ring",
        right_ring = "Eihwaz Ring",
        back = back.fc
    }
    sets.midcast.Flash.SIRD = {
        ammo = "Staunch Tathlum +1",
        head = souveran.head,
        body = souveran.body,
        -- body = af.body,
        hands = souveran.hands,
        legs = "Founder's Hose",
        feet = odyssean.feet.fc,
        neck = "Moonlight Necklace",
        waist = "Audumbla Sash",
        left_ear = "Odnowa Earring +1",
        right_ear = "Cryptic Earring",
        left_ring = "Supershear Ring",
        right_ring = "Eihwaz Ring",
        back = back.fc
    }
    sets.midcast.Flash.TH = set_combine(sets.midcast.Flash, th_gear)
    sets.midcast.Holy = {
        ammo = "Pemphredo Tathlum",
        head = nyame.head,
        body = nyame.body,
        hands = nyame.hands,
        legs = nyame.legs,
        feet = nyame.feet,
        neck = "Baetyl Pendant",
        waist = "Eschan Stone",
        left_ear = "Crematio Earring",
        right_ear = "Friomisi Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Metamorph Ring +1",
        back = back.mabws
    }
    sets.midcast.HolyMB = set_combine(sets.midcast.Holy, {
        left_ring = "Mujin Band"
    })
    sets.midcast.Banish = sets.midcast.Flash.SIRD
    sets.midcast.Banishga = sets.midcast.Banish
    sets.midcast.Banishga.TH = set_combine(sets.midcast.Banish, th_gear)

    sets.midcast.Enhancing = {
        ammo = "Sapience Orb",
        head = souveran.head,
        body = "Shabti Cuirass +1",
        hands = "Regal Gauntlets",
        legs = "Founder's Hose",
        feet = odyssean.feet.fc,
        neck = "Moonlight Necklace",
        waist = "Audumbla Sash",
        left_ear = "Odnowa Earring +1",
        right_ear = "Cryptic Earring",
        left_ring = "Gelatinous Ring +1",
        right_ring = "Defending Ring",
        back = back.fc
    }
    sets.midcast.EnhancingDuration = set_combine(sets.midcast.Enhancing, {
        -- sub = "Ajax +1",
        body = "Shabti Cuirass +1",
        hands = "Regal Gauntlets"
    })
    sets.midcast.Phalanx = sets.Idle.Phalanx
    sets.midcast.Phalanx.SIRD = {
        main = sakpata.sword,
        ammo = "Staunch Tathlum +1",
        head = souveran.head,
        body = yorium.body.phalanx,
        hands = souveran.hands,
        legs = "Founder's Hose",
        feet = souveran.feet,
        neck = "Moonlight Necklace",
        waist = "Audumbla Sash",
        left_ear = "Mimir Earring",
        right_ear = "Odnowa Earring +1",
        left_ring = "Moonlight Ring",
        right_ring = "Moonlight Ring",
        back = "Weard Mantle"
    }
    sets.midcast.Phalanx.SIRD.withBuffs = {}
    sets.midcast.Phalanx.SIRD.withBuffs.Rampart = sets.Idle.Phalanx
    sets.midcast.Reprisal = {
        ammo = "Sapience Orb",
        head = souveran.head,
        body = "Shabti Cuirass +1",
        hands = "Regal Gauntlets",
        legs = "Founder's Hose",
        feet = odyssean.feet.fc,
        neck = "Moonlight Necklace",
        waist = "Audumbla Sash",
        left_ear = "Odnowa Earring +1",
        right_ear = "Cryptic Earring",
        left_ring = "Gelatinous Ring +1",
        right_ring = "Defending Ring",
        back = back.fc
    }

    sets.midcast.Jettatura = sird_enmity
    sets.midcast['Blank Gaze'] = sird_enmity
    sets.midcast.Soporific = sird_enmity
    sets.midcast.Sandspin = sird_enmity
    sets.midcast['Sheep Song'] = sird_enmity
    sets.midcast['Geist Wall'] = sird_enmity
    sets.midcast['Healing Breeze'] = sird_enmity
    sets.midcast['Wild Carrot'] = sird_enmity
    sets.midcast.Pollen = sird_enmity
    sets.midcast.Cocoon = sird_enmity

    -- ==========================================================================================================
    -- Distance Gear
    -- ==========================================================================================================

    sets.Distance = {
        waist = "Orpheus's Sash"
    }

end
