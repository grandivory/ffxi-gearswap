include('set-behavior')
include('organizer-lib')

function define_sets()
    Idle_Modes = T {'Salmon'}

    sets.Idle = {
        ranged = "Halcyon Rod",
        ammo = "Fly Lure",
        body = "Fsh. Tunica",
        hands = "Fsh. Gloves",
        legs = "Fisherman's Hose",
        feet = "Fisherman's Boots",
        neck = "Fisher's Torque",
        left_ring = "Pelican Ring",
        right_ring = "Pelican Ring"
    }

    sets.Idle.Salmon = set_combine(sets.Idle, {})
end
