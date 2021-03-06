include('set-behavior')
include('organizer-lib')

lockstyleset = nil

function define_sets()
    Idle_Modes = T {'HQ', 'Success'}
    sets.Idle.HQ = {
        main = "Debahocho +1",
        head = "Chef's Hat",
        body = "Culinarian's Smock",
        neck = "Culin. Torque",
        left_ring = "Craftmaster's Ring",
        right_ring = "Artificer's Ring"
    }
    sets.Idle.Success = set_combine(sets.Idle.HQ, {
        left_ring = "Craftkeeper's Ring"
    })
end
