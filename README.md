# Baeron's Gearswap Luas

These luas are meant to be a generic way to set up gearsets for any job and have them automatically behave the way you want. You can include `set-behavior.lua` in your job-specific file, which gives you the ability to only have to define the gearsets you use - everything else is taken care of. Here are the features that `set-behavior.lua` gives you:

* In your job-specific lua, you need only create a function `define_sets()`, which will be called once by `set-behavior.lua` to read the sets to use for that job.
* You can define a `lockstyleset` variable to select which lockstyle to use on that job. This can be done either inside of `define_sets()` or outside of it.
* Modes:
  * You can define `Melee_Modes`, `Idle_Modes`, and `Magic_Modes` in order to define quick behavior swaps for your sets, e.g. `Melee_Modes =  T{'Att', 'TH', 'Crit', 'DT', 'DTTH'}`
  * For every set you define, you can create a corresponding set that uses one of your modes. When you are in that mode, the mode-specific set will be used.
    * For example, suppose you have a set `sets.TP` already defined. You've decided to add a `DT` mode to `Melee_Modes`, so you add the line `Melee_Modes = T{'Normal', 'DT'}` to your lua. Then, you can define `sets.TP.DT`. Whenever you switch to `DT` mode, `sets.TP.DT` will be used. When in `Normal` mode, `sets.TP` will be used.
  * All spells and abilities that you use have a corresponding mode that is correlated with them:
    * Melee Modes: TP, Job Abilities, Weapon Skills, and Ranged Attacks
    * Idle Modes: Idle (not engaged) and Resting
    * Magic Modes: Everything Else
  * TP modes can be cycled with `f9`, Idle modes can be cycled with `f10`, and Magic modes can be cycled with `f11`
  * You can also switch directly to a specific mode with `gs c MeleeMode DT` (for example), or `/console gs c MeleeMode DT` from a macro
* TP Mods:
  * If you have `sets.TPMod['Buff name']` defined, then any gear there will be added to your TP set while `Buff name` is active
* Distance Threshold:
  * You can set `distance_threshold` to some value, and put gear into `sets.Distance`. Then, if you are closer than `distance_threshold` while using an elemental ability, the `sets.Distance` gear will be added to your set.
* Magic burst mode:
  * If you call `gs c MB` (or `/console gs c MB` from a macro), it will turn on magic-burst mode. This will use a magic-burst-specific set for your NEXT SPELL ONLY if one is defined. No matter what you cast next, magic burst mode will be turned off after you finish casting.
* `f12` is set to equip whatever the correct gear is for that time. If you are engaged, it will equip the correct TP set. If you are not, it will equip the correct Idle set. It will also turn on the lockstyle for your job
* Mode display:
  * The current modes will display on your screen in a position and style defined by `text_settings`. An example `text_settings` is:
      ```{
            pos = {
                x = 2180,
                y = 1242
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
      ````
* For ANY set you define, you can also define a `withBuffs` property to add buff modifiers. Note: All buff-modified sets should be full sets. No items from the base set will be used if the buff is active.
  * For example, I can define a `sets.WS["Rudra's Storm"]`, then also add in the lines:
      ```
        sets.WS["Rudra's Storm"].withBuffs = {}
        sets.WS["Rudra's Storm"].withBuffs["Sneak Attack"] = {... my sneak attack Rudra's set}
      ```
* If you use an item or summon a trust, gearswap will do nothing.

## Precast
* If you have a `sets.precast[spell name]`, that set will be used
* If you have a `sets.JA[spell name]`, that set will be used
* If you have a `sets.WS[spell name]`, that set will be used
* For ranged attacks, if you have a `sets.precast.RA`, that set will be used
* For phantom roll, you can use `sets.precast["Phantom Roll"]` or `sets.JA["Phantom Roll"]` for a generic roll set. For specific rolls, define a set using the spell names, as above!
* For quick draw, you can use `sets.precast["Quick Draw"]` or `sets.JA["Quick Draw"]`
* For summoner blood pacts, you can use `sets.precast["Blood Pact"]` or `sets.JA["Blood Pact"]`
* If you define a `sets.precast["Something"]`, "Somthing" will be searched against the full spell name of what you're casting, then the type, so you can (for example) define a `sets.precast.Cur` that will match to ANY cure spell, Curaga, or Cura, or you can define `sets.precast.Healing` for any healing magic
* If you use a weapon skill and don't have a ws-specific set defined, then the lua will look for `sets.WS.MAB` or `sets.WS.Elemental` for elemental-based WS, or `sets.WS.Generic` for physical-based WS
  * Further, for elemental weapon skills, the lua will check against the current weather and day to equip `sets.Weather`, if it's defined
* If the spell has a cast time, the lua looks for `sets.precast.FastCast` to equip
* You can define a `mod_precast(spell, precast_set)` function in your lua to make any changes to the behavior defined up to this point! That function will be passed the current spell and the set that my lua thinks you should be using, and whatever is returned is what will actually be used.
* Ammo counting! You can set an `ammo_threshold` variable (default 10) and the lua will warn you when you're running low on ammo.
* If you define a `no_shoot_ammo` variable as `S{'Bullet 1', 'Bullet 2'}` (yes, the S matters), then the lua won't let you shoot that bullet, even if you put it into a set
* Tool counting! You can set a `tool_threshold` variable (default 10) and the lua will warn you when you're running low on ninja tools. This works for both the spell-specific tools and the universal tools, if you're on ninja main.
* Auto-canceling! The lua will automatically cancel shadows (1.5 seconds into casting) if you're casting Utsusemi: Ichi and have fewer than 3 remaining, will automatically cancel Stoneskin when casting Stoneskin, cancel Sneak for SPectral Jig or Sneak, and a few others.

## Midcast
* If the spell has no cast time, midcast is ignored. Everything shou8ld happen in precast.
* If magic burst mode is on and you have a `sets.midcast[spell name MB]` (e.g. `sets.midcast.HelixMB`), then that set will be used
* If you're casting on yourself and you have a `sets.midcast[spell name Self']` (e.g. `sets.midcast.CureSelf)`, then that set will be used
* If you have a `sets.midcast[spell name]` defined, that set will be used.
* For ranged attacks, the lua looks for `sets.midcast.RA`
* If you define a `sets.midcast["Something"]`, "Something" will be searched against the full name of the spell you're casting, then the type, so you could define (for example) a `sets.midcast.Cur` that would match to ANY Cure spell, Curaga, or Cura, or you can define `sets.midcast.Healing` for any Healing magic.
* Additionally, you can define `sets.midcast["SomethingMB"]` or `sets.midcast["SomethingSelf"]` to match "Something" against the full name of the spell when magic burst mode is on or when you're targeting yourself, respectively.
* For healing magic:
  * The lua will look for a `sets.midcast.NaSpell` for any -na spells.
  * The lua will look for a `sets.midcast.CureSelf` if you're targeting yourself.
  * The lua will look for a `sets.midcast.Healing` for any other case.
* For Enhancing magic:
  * The lua will look for a `sets.midcast.EnhancingSelf` for any spells where skill matters, if you're targeting yourself.
  * The lua will look for a `sets.midcast.Enhancing` for any spells where skill matters.
  * The lua will look for a `sets.midcast.EnhancingDurationSelf` for any other spells where you're targeting yourself.
  * The lua will look for a `sets.midcast.EnhancingDuration` for any other case.
* For Enfeebling magic:
  * The lua will look for a `sets.midcast.EnfeeblingMND` for spells that are MND-dependent for potency or accuracy
  * The lua will look for a `sets.midcast.EnfeeblingINT` for spells that are INT-dependent for potency or accuracy
  * The lua will look for a `sets.midcast.Enfeebling` if no set was picked from the above
  * The lua will look for a `sets.midcast.MAcc` for any other case
* For Divine magic:
  * The lua will look for `sets.midcast.DivineEnfeeble` for Flash or Repose
  * The lua will look for `sets.midcast.DivineEnhancing` for Enlight
  * The lua will look for `sets.midcast.DivineMB` if magic burst mode is on
  * The lua will look for `sets.midcast.Divine` for any other case
* For Elemental magic:
  * If magic burst mode is on, the lua will look for `sets.midcast.ElementalMB`
  * The lua will look for `sets.midcast.Elemental` otherwise
* For Blue magic:
  * `sets.midcast.BlueMagic.Physical` for physical spells
  * `sets.midcast.BlueMagic.MAB` for magic spells
  * `sets.midcast.BlueMagic.Breath` for breath spells
  * `sets.midcast.BlueMagic.Cure` for cures
  * `sets.midcast.BlueMagic.CureSelf` for cures targeted on yourself
  * `sets.midcast.BlueMagic.Debuff` or `sets.midcast.BlueMagic.Skill` for enfeebles
  * `sets.midcast.BlueMagic.Skill` for all other spells
* For Geomancy:
  * `sets.midcast.Geomancy`
* For Summoning Magic:
  * `sets.midcast.Summon`
* If `sets.midcast.Generic` is defined, then that set will be used
* If there is STILL no set chosen, then your steady stat (tp or idle) gear will be chosen
* If the spell you are casting is affected by the currently active weather or day, then the lua will look for `sets.Weather` to add to your set
* The lua will look through all sets defined in `sets.midcast.mod` to determine if they should be equipped based on current buffs
  * For example, I have a `sets.midcast.mod["Diffusion"] = { feet: "Luhlaza Charuqs +1" }` defined in my BLU lua. If Diffusion is active, the Luhlaza Charuqs +1 will be equipped for ANY spell I cast.
* You can define a `mod_midcast(spell, midcast_set)` function to alter anything abou the gear that's been chosen up to this point.

## Aftercast
* Aftercast will always choose the steady state gear based on whether you're engaged (TP set) or not (Idle set)

## Pet Midcast
* For pet classes, you can define sets that will be equipped when your pet is using an ability
* If you have a `sets.pet_midcast[spell name]` defined, that set will be used.
* If you define a `sets.pet_midcast["Something"]`, "Something" will be searched against the full name of the ability your pet is using.
* For blood pacts:
  * The lua will look for a `sets.pet_midcast.Buff` for buff blood pacts
  * The lua will look for a `sets.pet_midcast.BuffMND` for buff blood pacts that are affected by MND (Wind's Blessing)
  * The lua will look for a `sets.pet_midcast.MAcc` for debuff blood pacts
  * The lua will look for a `sets.pet_midcast.Healing` for healing blood pacts
  * The lua will look for a `sets.pet_midcast.Magic` for magic blood pacts that are not based on TP or if no `MagicTP` set is defined
  * The lua will look for a `sets.pet_midcast.MagicTP` for magic blood pacts that can make use of a TP bonus
  * The lua will look for a `sets.pet_midcast.Physical` for physical blood pacts that are not based on TP or if no `PhysicalTP` set is defined
  * The lua will look for a `sets.pet_midcast.PhysicalTP` for physical blood pacts that can make use of a TP bonus
  * The lua will look for a `sets.pet_midcast["Summoning Skill"]` for blood pacts that rely mostly on summoning skill
* The lua will look for a `sets.pet_midcast.Generic` if no other sets have yet been selected
* You can define a `mod_pet_midcast(spell, midcast_set)` function to alter anything abou the gear that's been chosen up to this point.

## Status Change
* If you define `sets.Resting`, it will be equipped when you start resting
* Otherwise, your steady state gear will be equipped

## Pet Classes
* If you have a pet out and that pet is mid-action, then gearswap is temporarily disabled - it will not change gear until your pet finishes their action (which makes sure that your pet gear stays on until they finish)
* If you have defined a `sets.TP_Avatar`, `sets.TP_Spirit`, `sets.Idle_Avatar`, or `sets.Idle_Spirit`, then those sets will be used in place of your normal TP or Idle sets when you have an avatar or spirit summoned, respectively.