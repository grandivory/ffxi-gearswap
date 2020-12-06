#Baeron's Gearswap Luas

These luas are meant to be a generic way to set up gearsets for any job and have them automatically behave the way you want. You can include `set-behavior.lua` in your job-specific file, which gives you the ability to only have to define the gearsets you use - everything else is taken care of. Here are the features that `set-behavior.lua` gives you:

* In your job-specific lua, you need only create a function `define_sets()`, which will be called once by `set-behavior.lua` to read the sets to use for that job.
* You can define a `lockstyleset` variable to select which lockstyle to use on that job. This can be done either inside of `define_sets()` or outside of it.
* TP and Idle modes:
  * When defining TP and Idle sets (`sets.TP` and `sets.Idle`), you can specify as many as you want, e.g. `sets.TP.Att`, `sets.TP.Acc`, etc.
  * TP modes can be cycled with `f9`. Idle modes can be cycled with `f10`
  * If you want your modes to be displayed in a particular order, you can do so by specifying `TP_Mode_Order` or `Idle_Mode_Order` as variables, e.g.:
      ```TP_Mode_Order = T{'Att', 'TH', 'Crit', 'DT', 'DTTH'}```
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
