include('set-behavior')
include('organizer-lib')

lockstyleset = 5

function define_sets()
    Idle_Modes = T {'Idle'}
    Magic_Modes = T {'Proc', 'Nuke'}

    sets.Idle = {
        main = "Malignance Pole",
        sub = "Khonsu",
        ammo = "Sapience Orb",
        head = "Spurrina Coif",
        body = "Jhakri Robe +2",
        hands = "Serpentes Cuffs",
        legs = "Assid. Pants +1",
        feet = "Herald's Gaiters",
        neck = "Loricate Torque +1",
        waist = "Slipor Sash",
        left_ear = "Andoaa Earring",
        right_ear = "Regal Earring",
        left_ring = "Defending Ring",
        right_ring = {
            name = "Dark Ring",
            augments = {'Phys. dmg. taken -5%', 'Magic dmg. taken -6%'}
        },
        back = "Fi Follet Cape +1"
    }

    sets.precast.FastCast = {
        main = "Oranyan",
        sub = "Khonsu",
        ammo = "Sapience Orb",
        head = "Vanya Hood",
        body = "Zendik Robe",
        hands = telchine.hands.enhfc,
        legs = "Volte Brais",
        feet = "Amalric Nails",
        neck = "Orunmila's Torque",
        waist = "Embla Sash",
        left_ear = "Malignance Earring",
        right_ear = "Loquac. Earring",
        left_ring = "Kishar Ring",
        right_ring = "Rahab Ring",
        back = "Fi Follet Cape +1"
    }

    sets.midcast.Elemental = {
        main = "Contemplator +1",
        sub = "Khonsu",
        ammo = "Pemphredo Tathlum",
        head = "Jhakri Coronal +2",
        body = "Amalric Doublet +1",
        hands = "Jhakri Cuffs +2",
        legs = "Jhakri Slops +2",
        feet = "Amalric Nails +1",
        neck = "Baetyl Pendant",
        waist = "Eschan Stone",
        left_ear = "Malignance Earring",
        right_ear = "Regal Earring",
        left_ring = "Freke Ring",
        right_ring = "Shiva Ring +1",
        back = "Aurist's Cape"
    }

    sets.midcast.Elemental.Proc = set_combine(sets.Idle, {})

    sets.Distance = {
        waist = "Orpheus's Sash"
    }

    sets.Resting = {
        main = "Contemplator +1"
    }

    organizer_items = {
        bseals = "Beastmen's Seal",
        kseals = "Kindred's Seal",
        kcrests = "Kindred's Crest",
        hkcrests = "High Kindred's Crest",
        skcrest = "Sacred Kindred's Crest",
        warp_ring = "Warp Ring",
        caliber_ring = "Caliber Ring",
        vocation_ring = "Vocation Ring",
        facility_ring = "Facility Ring",
        aptitude_mantle = "Aptitude Mantle"
    }
end
