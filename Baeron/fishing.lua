include('set-behavior')
include('organizer-lib')

lockstyleset = nil

function define_sets()
    Idle_Modes = T {'Fish', 'Speed'}

    sets.Idle = {
        ranged = "Lu Shang's F. Rod",
        ammo = "Meatball",
        head = "Tlahtlamah Glasses",
        body = "Fisherman's Smock",
        hands = "Fsh. Gloves",
        legs = "Fisherman's Hose",
        feet = "Waders",
        neck = "Fisher's Torque",
        left_ring = "Pelican Ring",
        right_ring = "Pelican Ring",
        waist = "Fisherman's Belt"
    }

    sets.Idle.Speed = set_combine(sets.Idle, {
        legs = "Carmine Cuisses +1",
        feet = "Jute Boots +1"
    })
end
