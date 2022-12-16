include('set-behavior')

-- Set this to to /equipset you want to use for your lockstyle
lockstyleset = 1

-- This whole section is optional. These are the defaults, but you can change them to whatever you wish
text_settings = {
    pos = {
        x = 1775,
        y = 1290
    },
    text = {
        size = 14
    },
    padding = 1,
    flags = {
        bold = true,
        draggable = false
    }
}

function define_sets()
    -- These define the different modes that you can use with your sets.
    -- When you define a set like `sets.TP`, if you define `sets.TP.DT` and
    -- you have your melee mode set to `DT`, then the latter will be used. If there is no `sets.TP.DT`
    -- and you're in `DT` mode, then the normal `sets.TP` will be used.
    -- Every single spell and ability is associated with one of these modes
    --     Melee Mode: TP, JAs, WSs, and ranged attacks
    --     Idle Mode: Idle (not engaged) and Resting
    --     Magic Modes: Everything else
    Melee_Modes = T {'Att', 'DT', 'Refresh'}
    Idle_Modes = T {'Refresh', 'DT'}
    Magic_Modes = T {'Acc', 'MAB'}

    fastcast = .8 -- This defines how much fast cast you have, which is used when canceling spell effects (.8 = 80%)

    -- Ninja tool counting
    tool_threshold = 10 -- Below this, the lua will warn you that you're low on tools

    -- =========================================================================================================
    -- ***Stances***
    -- =========================================================================================================
    stances.SAM = S {'Hasso', 'Seigan'} -- This will cause these abilities to be reused any time they fall off, if the ability is off cooldown. Using the other ability will overwrite the stance, so that if you use Seigan, it won't try to reuse Hasso anymore, and vice versa.
    stances.WAR = S {'Berserk'} -- Putting a stance under a different name allows multiple stances to be tracked at once. Here, you can have the lua automatically keep up both Berserk and Hasso

    -- =========================================================================================================
    -- ***Not Engaged Sets***
    -- =========================================================================================================
    sets.Idle = {}
    sets.Idle.DT = {}
    sets.Idle_Avatar = {} -- Used while an Avatar is out
    sets.Idle_Spirit = {} -- Used while a spirit is out
    sets.Idle_Pet = {} -- Used while any pet is out
    sets.Resting = {}
    sets.Resting.DT = {} -- Modes can be applied to other sets, too

    -- =========================================================================================================
    -- ***Engaged Sets***
    -- =========================================================================================================
    sets.TP = {}
    sets.TP.DT = {}
    sets.TP.Refresh = {}
    sets.TP_Avatar = {} -- Used while an Avatar is out
    sets.TP_Spirit = {} -- Used while a spirit is out
    sets.TP_Pet = {} -- Used while any pet is out
    sets.TPMod['Sneak Attack'] = {} -- This set will be used if you engage while "Sneak Attack" is active

    -- =========================================================================================================
    -- ***Ranged Attacks***
    -- =========================================================================================================
    ammo_threshold = 20 -- Below this, the lua will warn you that you're low on ammo
    no_shoot_ammo = S {'Hauksbok Bullet'}
    sets.precast.RA = {} -- Snapshot gear, etc.
    sets.midcast.RA = {} -- What gear you want to have equipped when the ranged attack hits

    -- =========================================================================================================
    -- ***Weapon Skill Sets***
    -- =========================================================================================================
    sets.WS.Generic = {} -- Any physical weapon skill that isn't otherwise specified
    sets.WS.MAB = {} -- Any magical weapon skill that isn't otherwise specified
    sets.WS["Savage Blade"] = {}
    sets.WS["Rudra's Storm"] = {}
    sets.WS["Rudra's Storm"].withBuffs = {} -- Leave this empty
    sets.WS["Rudra's Storm"].withBuffs["Sneak Attack"] = {} -- This is used when you have "Sneak Attack" up

    -- =========================================================================================================
    -- ***Job Ability Sets***
    -- =========================================================================================================
    sets.JA.Hide = {}
    sets.JA['Phantom Roll'] = {}
    sets.JA['Quick Draw'] = {}
    sets.JA['Blood Pact'] = {}

    -- =========================================================================================================
    -- ***Item Sets***
    -- =========================================================================================================
    sets.item['Holy Water'] = {} -- This set will be used when you use holy water FROM A MACRO (/item "Holy Water" <me>)

    -- =========================================================================================================
    -- ***Precast Sets for Spells***
    -- =========================================================================================================
    sets.precast.FastCast = {}
    sets.precast.Utsusemi = {}
    sets.precast.BlueMagic = {}

    -- =========================================================================================================
    -- ***Midcast Sets for Spells***
    -- =========================================================================================================
    sets.midcast.Cur = {} -- This will match any spell containing "Cur" in the name, so Cure, Curaga, etc.
    sets.midcast.CureSelf = {} -- This will be used when casting any healing magic on yourself
    sets.midcast.Healing = {} -- Any Healing Magic
    sets.midcast.NaSpell = {}
    sets.midcast.Enhancing = {}
    sets.midcast.EnhancingSelf = {}
    sets.midcast.EnhancingDuration = {}
    sets.midcast.EnhancingDurationSelf = {}
    sets.midcast.EnfeeblingMND = {}
    sets.midcast.EnfeeblingINT = {}
    sets.midcast.Enfeebling = {}
    sets.midcast.ElementalEnfeeble = {}
    sets.midcast.DivineEnfeeble = {}
    sets.midcast.DivineEnhancing = {}
    sets.midcast.Divine = {}
    sets.midcast.DivineMB = {}
    sets.midcast.Elemental = {} -- Any nuke
    sets.midcast.Elemental.Acc = {} -- This will be used when in 'Acc' magic mode
    sets.midcast.ElementalMB = {} -- This is used during magic bursts
    sets.midcast.ElementalMB.Acc = {} -- This is used in 'Acc' mode during magic bursts
    sets.midcast['Death'] = {}
    sets.midcast.BlueMagic.Physical = {}
    sets.midcast.BlueMagic.MAB = {}
    sets.midcast.BlueMagic.Breath = {}
    sets.midcast.BlueMagic.Cure = {}
    sets.midcast.BlueMagic.CureSelf = {}
    sets.midcast.BlueMagic.Debuff = {}
    sets.midcast.BlueMagic.Skill = {}
    sets.midcast.Geomancy = {}
    sets.midcast.Summon = {}
    sets.midcast.Songs.Buff = {}
    sets.midcast.Songs.Debuff = {}
    sets.midcast.Generic = {} -- If no other set is found, this set is used instead

    sets.midcast.mod["Diffusion"] = { -- This will be used for ANY spell while "Diffusion" is active
        feet = "Luhlaza Charuqs +1"
    }

    -- =========================================================================================================
    -- ***Pet Midcast Sets***
    -- =========================================================================================================
    sets.pet_midcast["Impact"] = {} -- Used if your pet is casting "Impact"
    sets.pet_midcast["Crush"] = {} -- Used if your pet is casting anything with "Crush" in the name
    sets.pet_midcast.Buff = {}
    sets.pet_midcast.BuffMND = {}
    sets.pet_midcast.MAcc = {}
    sets.pet_midcast.Healing = {}
    sets.pet_midcast.Magic = {}
    sets.pet_midcast.MagicTP = {}
    sets.pet_midcast.Physical = {}
    sets.pet_midcast.PhysicalTP = {}
    sets.pet_midcast["Summoning Skill"] = {}
    sets.pet_midcast.Generic = {} -- If no other set is found, this set is used instead

    -- =========================================================================================================
    -- ***Special Sets***
    -- =========================================================================================================
    sets.Weather = {
        waist = "Hachirin-no-obi",
        back = "Twilight Cape"
    }

    sets.Distance = {
        waist = "Orpheus's Sash"
    }

    sets.WakeUp = {}

end
