include('set-behavior')
include('organizer-lib')

lockstyleset = nil

function define_sets()
    Idle_Modes = T {'HQ', 'Success', 'NoHQ'}
    sets.Idle.HQ = {
        main = "Debahocho +1",
        sub = "Chef's Shield",
        head = "Chef's Hat",
        body = "Culinarian's Smock",
        neck = "Culin. Torque",
        left_ring = "Craftmaster's Ring",
        right_ring = "Artificer's Ring"
    }
    sets.Idle.HQ.withBuffs = {
        Food = {
            main = "Debahocho +1",
            sub = "Chef's Shield",
            head = "Chef's Hat",
            body = "Culinarian's Smock",
            neck = "Culin. Torque",
            left_ring = "Craftmaster's Ring",
            right_ring = "Confectioner's Ring"
        }
    }
    sets.Idle.Success = set_combine(sets.Idle.HQ, {
        left_ring = "Craftkeeper's Ring"
    })
    sets.Idle.NoHQ = set_combine(sets.Idle.Success, {
        left_ring = "Chef's Ring"
    })
end
