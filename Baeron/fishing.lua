include('set-behavior')
include('organizer-lib')

lockstyleset = nil

function define_sets()
    Idle_Modes = T {'Fish', 'Speed'}

    sets.Idle = {
        ranged = "Ebisu F. Rod +1",
        ammo = "Dwarf Pugil",
        head = "Tlahtlamah Glasses",
        body = "Fisherman's Smock",
        hands = "Fisherman's Gloves",
        legs = "Fisherman's Hose",
        feet = "Waders",
        neck = "Fisher's Torque",
        left_ring = "Noddy Ring",
        right_ring = "Puffin Ring",
        waist = "Fisher's Rope"
    }

    sets.Idle.Speed = set_combine(sets.Idle, {
        legs = "Carmine Cuisses +1",
        feet = "Jute Boots +1"
    })
end
