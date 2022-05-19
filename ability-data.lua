include('utils')

no_action_types = S {"Item", "Trust"}

ElementalWS = S {"Gust Slash", "Cyclone", "Energy Steal", "Energy Drain", "Aeolian Edge", "Burning Blade",
                 "Red Lotus Blade", "Shining Blade", "Seraph Blade", "Spirits Within", "Sanguine Blade", "Atonement",
                 "Frostbite", "Freezebite", "Herculean Slash", "Cloudsplitter", "Primal Rend", "Dark Harvest",
                 "Shadow of Death", "Infernal Scythe", "Thunder Thrust", "Raiden Thrust", "Blade: Teki", "Blade: To",
                 "Blade: Chi", "Blade: Ei", "Blade: Yu", "Tachi: Goten", "Tachi: Kagero", "Tachi: Jinpu", "Tachi: Koki",
                 "Shining Strike", "Seraph Strike", "Flash Nova", "Rock Crusher", "Earth Crusher", "Starburst",
                 "Sunburst", "Cataclysm", "Vidohunir", "Garland of Bliss", "Omniscience", "Flaming Arrow", "Hot Shot",
                 "Wildfire", "Trueflight", "Leaden Salute"}

RangedJAs = S {'Eagle Eye Shot', 'Shadowbind', 'Bounty Shot'}
BuffJAs = S {'Accession', 'Accomplice', 'Addendum: Black', 'Addendum: White', 'Afflatus Misery', 'Afflatus Solace',
             'Aggressor', 'Alacrity', 'Altruism', 'Ancient Circle', 'Apogee', 'Arcane Circle', 'Aspir Samba',
             'Aspir Samba II', 'Assassin\'s Charge', 'Astral Conduit', 'Astral Flow', 'Asylum', 'Avatar\'s Favor',
             'Azure Lore', 'Barrage', 'Battuta', 'Berserk', 'Blaze of Glory', 'Blood Weapon', 'Bolster', 'Boost',
             'Brazen Rush', 'Burst Affinity', 'Camouflage', 'Cascade', 'Celerity', 'Chain Affinity', 'Chainspell',
             'Clarion Call', 'Composure', 'Conspirator', 'Consume Mana', 'Contradance', 'Convergence', 'Counterstance',
             'Cover', 'Dark Arts', 'Dark Seal', 'Decoy Shot', 'Deep Breathing', 'Defender', 'Dematerialize',
             'Diabolic Eye', 'Diffusion', 'Divine Caress', 'Divine Emblem', 'Divine Seal', 'Dodge', 'Double Shot',
             'Ebullience', 'Efflux', 'Elemental Seal', 'Elemental Sforzo', 'Embolden', 'Enlightenment', 'Entrust',
             'Equanimity', 'Familiar', 'Fan Dance', 'Fealty', 'Feint', 'Flashy Shot', 'Flee', 'Fly High',
             'Focalization', 'Focus', 'Footwork', 'Formless Strikes', 'Futae', 'Grand Pas', 'Hagakure', 'Hasso', 'Hide',
             'Holy Circle', 'Hundred Fists', 'Immanence', 'Impetus', 'Inner Strength', 'Innin', 'Invincible',
             'Issekigan', 'Killer Instinct', 'Last Resort', 'Light Arts', 'Majesty', 'Mana Wall', 'Manafont',
             'Manawell', 'Manifestation', 'Mantra', 'Marcato', 'Meditate', 'Meikyo Shisui', 'Mighty Strikes', 'Mikage',
             'Nether Void', 'Nightingale', 'One for All', 'Overdrive', 'Overkill', 'Palisade', 'Parsimony', 'Penury',
             'Perfect Counter', 'Perfect Dodge', 'Perpetuance', 'Pflug', 'Pianissimo', 'Presto', 'Rampart', 'Rapture',
             'Restraint', 'Retaliation', 'Run Wild', 'Saboteur', 'Sacrosanctity', 'Sange', 'Scarlet Delirium', 'Seigan',
             'Sekkanoki', 'Sengikori', 'Sentinel', 'Sharpshot', 'Snake Eye', 'Sneak Attack', 'Soul Enslavement',
             'Soul Voice', 'Souleater', 'Spirit Bond', 'Spirit Surge', 'Spontaneity', 'Spur', 'Stealth Shot', 'Stymie',
             'Sublimation', 'Subtle Sorcery', 'Swordplay', 'Tabula Rasa', 'Tenuto', 'Theurgic Focus', 'Third Eye',
             'Trance', 'Tranquility', 'Trick Attack', 'Triple Shot', 'Troubadour', 'Unbridled Learning',
             'Unbridled Wisdom', 'Unleash', 'Unlimited Shot', 'Valiance', 'Vallation', 'Velocity Shot', 'Warcry',
             'Warding Circle', 'Warrior\'s Charge', 'Widened Compass', 'Yaegasumi', 'Yonin'}

NaSpells = S {"Blindna", "Cursna", "Erase", "Paralyna", "Poisona", "Silena", "Stona", "Viruna"}
EnhancingSpells = S {"Aquaveil", "Barfire", "Barfira", "Barblizzard", "Barblizzara", "Baraero", "Baraera", "Barstone",
                     "Barstonra", "Barthunder", "Barthundra", "Barwater", "Barwatera", "Boost-STR", "Boost-DEX",
                     "Boost-VIT", "Boost-AGI", "Boost-INT", "Boost-MND", "Boost-CHR", "Enthunder", "Enstone", "Enaero",
                     "Enblizzard", "Enfire", "Enwater", "EnthunderII", "Enstone II", "Enaero II", "Enblizzard II",
                     "Enfire II", "Enwater II", "Gain-STR", "Gain-DEX", "Gain-VIT", "Gain-AGI", "Gain-INT", "Gain-MND",
                     "Gain-CHR", "Phalanx", "Phalanx II", "Temper", "Temper II"}
EnfeeblingMND = S {"Addle", "Addle II", "Distract II", "Distract III", "Frazzle", "Frazzle II", "Frazzle III",
                   "Paralyze", "Paralyze II", "Silence", "Slow", "Slow II"}
EnfeeblingINT = S {"Bind", "Blind", "Break", "Breakga", "Dispel", "Gravity", "Gravity II", "Poison", "Poison II",
                   "Poisonga"}
DivineEnfeebles = S {"Flash", "Repose"}
DivineEnhancing = S {"Enlight", "Enlight II"}

WeatherSpells = S {"Absorb-ACC", "Absorb-AGI", "Absorb-Attri", "Absorb-CHR", "Absorb-DEX", "Absorb-INT", "Absorb-MND",
                   "Absorb-STR", "Absorb-TP", "Absorb-VIT", "Aspir", "Aspir II", "Aspir III", "Bio", "Bio II",
                   "Bio III", "Drain", "Drain II", "Drain III", "Kaustra", "Stun", "Aero", "Aero II", "Aero III",
                   "Aero IV", "Aero V", "Aero VI", "Aeroga", "Aeroga II", "Aeroga III", "Aeroja", "Aerora", "Aerora II",
                   "Aerora III", "Blizzaga", "Blizzaga II", "Blizzaga III", "Blizzaja", "Blizzara", "Blizzara II",
                   "Blizzara III", "Blizzard", "Blizzard II", "Blizzard III", "Blizzard IV", "Blizzard V",
                   "Blizzard VI", "Burn", "Burst", "Burst II", "Comet", "Drown", "Fira", "Fira II", "Fira III",
                   "Firaga", "Firaga II", "Firaga III", "Firaja", "Fire", "Fire II", "Fire III", "Fire IV", "Fire V",
                   "Fire VI", "Flare", "Flare II", "Flood", "Flood II", "Freeze", "Freeze II", "Frost", "Impact",
                   "Quake", "Quake II", "Rasp", "Shock", "Stone", "Stone II", "Stone III", "Stone IV", "Stone V",
                   "Stone VI", "Stonega", "Stoneja", "Stonera", "Stonera II", "Stonera III", "Thundaga", "Thundaga II",
                   "Thundaga III", "Thundaja", "Thundara", "Thundara II", "Thundara III", "Thunder", "Thunder II",
                   "Thunder III", "Thunder IV", "Thunder V", "Thunder VI", "Tornado", "Tornado II", "Water", "Water II",
                   "Water III", "Water IV", "Water V", "Water VI", "Watera", "Watera II", "Watera III", "Waterga",
                   "Waterga II", "Waterga III", "Waterja", "Addle", "Addle II", "Bind", "Blind", "Blind II", "Break",
                   "Breakga", "Dia", "Dia II", "Dia III", "Diaga", "Dispel", "Distract", "Distract II", "Distract III",
                   "Frazzle", "Frazzle II", "Frazzle III", "Gravity", "Gravity II", "Paralyze", "Paralyze II", "Poison",
                   "Poison II", "Poisonga", "Sleep", "Sleep II", "Sleepga", "Sleepga II", "Silence", "Slow", "Slow II",
                   "Banish", "Banish II", "Banish III", "Banishga", "Banishga II", "Holy", "Holy II", "Flash", "Repose",
                   "Cure", "Cure II", "Cure III", "Cure IV", "Cure V", "Cure VI", "Curaga", "Curaga II", "Curaga III",
                   "Curaga IV", "Curaga V", "Cura", "Cura II", "Cura III", "Light Threnody", "Light Threnody II",
                   "Dark Threnody", "Dark Threnody II", "Earth Threnody", "Earth Threnody II", "Water Threnody",
                   "Water Threnody II", "Wind Threnody", "Wind Threnody II", "Fire Threnody", "Fire Threnody II",
                   "Ice Threnody", "Ice Threnody II", "Lightning Threnody", "Lightning Threnody II", "Foe Requiem",
                   "Foe Requiem II", "Foe Requiem III", "Foe Requiem IV", "Foe Requiem V", "Foe Requiem VI",
                   "Foe Requiem VII", "Foe Lullaby", "Foe Lullaby II", "Horde Lullaby", "Horde Lullaby II",
                   "Magic Finale", "Battlefield Elegy", "Carnage Elegy", "Pining Nocturne", "Kurayami: Ichi",
                   "Hojo: Ichi", "Dokumori: Ichi", "Jubaku: Ichi", "Kurayami: Ni", "Hojo: Ni", "Aisha: Ichi",
                   "Yurin: Ichi", "Katon: Ichi", "Katon: Ni", "Katon: San", "Suiton: Ichi", "Suiton: Ni", "Suiton: San",
                   "Raiton: Ichi", "Raiton: Ni", "Raiton: San", "Doton: Ichi", "Doton: Ni", "Doton: San", "Huton: Ichi",
                   "Huton: Ni", "Huton: San", "Hyoton: Ichi", "Hyoton: Ni", "Hyoton: San", "Sandspin", "Cursed Sphere",
                   "Blastbomb", "Blood Drain", "Poison Breath", "Soporific", "Bomb Toss", "Chaotic Eye", "Sound Blast",
                   "Death Ray", "Digest", "Blank Gaze", "Mysterious Light", "MP Drainkiss", "Venom Shell",
                   "Stinking Gas", "Blitzstrahl", "Awful Eye", "Magnetite Cloud", "Blood Saber", "Ice Break",
                   "Self-Destruct", "Frightful Roar", "Cold Wave", "Filamented Hold", "Hecatomb Wave", "Radiant Breath",
                   "Light of Penance", "Flying Hip Press", "Eyes On Me", "Bad Breath", "Maelstrom", "1000 Needles",
                   "Voracious Trunk", "Feather Tickle", "Yawn", "Infrasonics", "Corrosive Ooze", "Sandspray",
                   "Frost Breath", "Enervation", "Firespit", "Regurgitation", "Heat Breath", "Lowing", "Temporal Shift",
                   "Mind Blast", "Actinic Burst", "Magic Hammer", "Acrid Stream", "Leafstorm", "Cimicine Discharge",
                   "Blazing Bound", "Demoralizing Roar", "Auroral Drape", "Osmosis", "Thermal Pulse", "Dream Flower",
                   "Charged Whisker", "Evryone. Grudge", "Reaving Wind", "Mortal Ray", "Water Bomb", "Dark Orb",
                   "Thunderbolt", "Vapor Spray", "Absolute Terror", "Thunder Breath", "Gates of Hades", "Wind Breath",
                   "Tem. Upheaval", "Embalming Earth", "Rending Deluge", "Foul Waters", "Retinal Glare",
                   "Droning Whirlwind", "Blistering Roar", "Subduction", "Diffusion Ray", "Rail Cannon", "Uproot",
                   "Crashing Thunder", "Polar Roar", "Molting Plumage", "Nectarous Deluge", "Atra. Libations",
                   "Searing Tempest", "Blinding Fulgor", "Spectral Floe", "Scouring Spate", "Anvil Lightning",
                   "Silent Storm", "Entomb", "Tenebral Crush", "Palling Salvo", "Cruel Joke", "Cesspool", "Tearing Gust"}

BlueMagicTypes = {
    ['phys'] = 'physical',
    ['addeffect'] = 'addeffect',
    ['mag'] = 'magical',
    ['breath'] = 'breath',
    ['cure'] = 'cure',
    ['buff'] = 'buff',
    ['debuff'] = 'debuff',
    ['static'] = 'static'
}

BlueMagic = {
    ['1000 Needles'] = BlueMagicTypes.debuff,
    ['Absolute Terror'] = BlueMagicTypes.debuff,
    ['Acrid Stream'] = BlueMagicTypes.mag,
    ['Actinic Burst'] = BlueMagicTypes.debuff,
    ['Amorphic Spikes'] = BlueMagicTypes.phys,
    ['Amplification'] = BlueMagicTypes.static,
    ['Animating Wail'] = BlueMagicTypes.static,
    ['Anvil Lightning'] = BlueMagicTypes.mag,
    ['Asuran Claws'] = BlueMagicTypes.phys,
    ['Atra. Libations'] = BlueMagicTypes.debuff,
    ['Auroral Drape'] = BlueMagicTypes.debuff,
    ['Awful Eye'] = BlueMagicTypes.debuff,
    ['Bad Breath'] = BlueMagicTypes.breath,
    ['Barbed Crescent'] = BlueMagicTypes.addeffect,
    ['Barrier Tusk'] = BlueMagicTypes.static,
    ['Battery Charge'] = BlueMagicTypes.static,
    ['Battle Dance'] = BlueMagicTypes.phys,
    ['Benthic Typhoon'] = BlueMagicTypes.addeffect,
    ['Bilgestorm'] = BlueMagicTypes.addeffect,
    ['Blank Gaze'] = BlueMagicTypes.debuff,
    ['Blastbomb'] = BlueMagicTypes.mag,
    ['Blazing Bound'] = BlueMagicTypes.mag,
    ['Blinding Fulgor'] = BlueMagicTypes.mag,
    ['Blistering Roar'] = BlueMagicTypes.debuff,
    ['Blitzstrahl'] = BlueMagicTypes.mag,
    ['Bloodrake'] = BlueMagicTypes.phys,
    ['Blood Drain'] = BlueMagicTypes.debuff,
    ['Blood Saber'] = BlueMagicTypes.debuff,
    ['Bludgeon'] = BlueMagicTypes.phys,
    ['Body Slam'] = BlueMagicTypes.phys,
    ['Bomb Toss'] = BlueMagicTypes.mag,
    ['Cannonball'] = BlueMagicTypes.phys,
    ['Carcharian Verve'] = BlueMagicTypes.static,
    ['Cesspool'] = BlueMagicTypes.mag,
    ['Charged Whisker'] = BlueMagicTypes.mag,
    ['Cimicine Discharge'] = BlueMagicTypes.debuff,
    ['Claw Cyclone'] = BlueMagicTypes.phys,
    ['Cocoon'] = BlueMagicTypes.static,
    ['Cold Wave'] = BlueMagicTypes.mag,
    ['Corrosive Ooze'] = BlueMagicTypes.mag,
    ['Chaotic Eye'] = BlueMagicTypes.debuff,
    ['Crashing Thunder'] = BlueMagicTypes.mag,
    ['Cruel Joke'] = BlueMagicTypes.debuff,
    ['Cursed Sphere'] = BlueMagicTypes.mag,
    ['Dark Orb'] = BlueMagicTypes.mag,
    ['Death Ray'] = BlueMagicTypes.mag,
    ['Death Scissors'] = BlueMagicTypes.phys,
    ['Delta Thrust'] = BlueMagicTypes.addeffect,
    ['Demoralizing Roar'] = BlueMagicTypes.debuff,
    ['Diamondhide'] = BlueMagicTypes.buff,
    ['Diffusion Ray'] = BlueMagicTypes.mag,
    ['Digest'] = BlueMagicTypes.debuff,
    ['Dimensional Death'] = BlueMagicTypes.phys,
    ['Disseverment'] = BlueMagicTypes.phys,
    ['Dream Flower'] = BlueMagicTypes.debuff,
    ['Droning Whirlwind'] = BlueMagicTypes.mag,
    ['Embalming Earth'] = BlueMagicTypes.mag,
    ['Empty Thrash'] = BlueMagicTypes.phys,
    ['Enervation'] = BlueMagicTypes.debuff,
    ['Entomb'] = BlueMagicTypes.mag,
    ['Erratic Flutter'] = BlueMagicTypes.static,
    ['Evryone. Grudge'] = BlueMagicTypes.mag,
    ['Exuviation'] = BlueMagicTypes.cure,
    ['Eyes On Me'] = BlueMagicTypes.mag,
    ['Fantod'] = BlueMagicTypes.static,
    ['Feather Barrier'] = BlueMagicTypes.static,
    ['Feather Storm'] = BlueMagicTypes.phys,
    ['Feather Tickle'] = BlueMagicTypes.debuff,
    ['Filamented Hold'] = BlueMagicTypes.debuff,
    ['Final Sting'] = BlueMagicTypes.phys,
    ['Firespit'] = BlueMagicTypes.mag,
    ['Flying Hip Press'] = BlueMagicTypes.breath,
    ['Foot Kick'] = BlueMagicTypes.phys,
    ['Foul Waters'] = BlueMagicTypes.mag,
    ['Frenetic Rip'] = BlueMagicTypes.phys,
    ['Frightful Roar'] = BlueMagicTypes.debuff,
    ['Frost Breath'] = BlueMagicTypes.breath,
    ['Frypan'] = BlueMagicTypes.addeffect,
    ['Gates of Hades'] = BlueMagicTypes.mag,
    ['Geist Wall'] = BlueMagicTypes.debuff,
    ['Goblin Rush'] = BlueMagicTypes.phys,
    ['Glutinous Dart'] = BlueMagicTypes.phys,
    ['Grand Slam'] = BlueMagicTypes.phys,
    ['Harden Shell'] = BlueMagicTypes.static,
    ['Head Butt'] = BlueMagicTypes.addeffect,
    ['Healing Breeze'] = BlueMagicTypes.cure,
    ['Heat Breath'] = BlueMagicTypes.breath,
    ['Heavy Strike'] = BlueMagicTypes.phys,
    ['Hecatomb Wave'] = BlueMagicTypes.breath,
    ['Helldive'] = BlueMagicTypes.phys,
    ['Hydro Shot'] = BlueMagicTypes.phys,
    ['Hysteric Barrage'] = BlueMagicTypes.phys,
    ['Ice Break'] = BlueMagicTypes.mag,
    ['Infrasonics'] = BlueMagicTypes.debuff,
    ['Jettatura'] = BlueMagicTypes.debuff,
    ['Jet Stream'] = BlueMagicTypes.phys,
    ['Leafstorm'] = BlueMagicTypes.mag,
    ['Light of Penance'] = BlueMagicTypes.debuff,
    ['Lowing'] = BlueMagicTypes.debuff,
    ['Maelstrom'] = BlueMagicTypes.mag,
    ['Magic Barrier'] = BlueMagicTypes.buff,
    ['Magic Fruit'] = BlueMagicTypes.cure,
    ['Magic Hammer'] = BlueMagicTypes.mag,
    ['Magnetite Cloud'] = BlueMagicTypes.breath,
    ['Mandibular Bite'] = BlueMagicTypes.phys,
    ['Memento Mori'] = BlueMagicTypes.static,
    ['Metallic Body'] = BlueMagicTypes.buff,
    ['Mighty Guard'] = BlueMagicTypes.static,
    ['Mind Blast'] = BlueMagicTypes.mag,
    ['Molting Plumage'] = BlueMagicTypes.mag,
    ['Mortal Ray'] = BlueMagicTypes.debuff,
    ['MP Drainkiss'] = BlueMagicTypes.debuff,
    ['Mysterious Light'] = BlueMagicTypes.mag,
    ['Nat. Meditation'] = BlueMagicTypes.static,
    ['Nectarous Deluge'] = BlueMagicTypes.mag,
    ['O. Counterstance'] = BlueMagicTypes.static,
    ['Occultation'] = BlueMagicTypes.buff,
    ['Osmosis'] = BlueMagicTypes.static,
    ['Palling Salvo'] = BlueMagicTypes.mag,
    ['Paralyzing Triad'] = BlueMagicTypes.addeffect,
    ['Pinecone Bomb'] = BlueMagicTypes.debuff,
    ['Plasma Charge'] = BlueMagicTypes.static,
    ['Plenilune Embrace'] = BlueMagicTypes.cure,
    ['Poison Breath'] = BlueMagicTypes.breath,
    ['Polar Roar'] = BlueMagicTypes.mag,
    ['Pollen'] = BlueMagicTypes.cure,
    ['Power Attack'] = BlueMagicTypes.phys,
    ['Pyric Bulwark'] = BlueMagicTypes.static,
    ['Quad. Continuum'] = BlueMagicTypes.phys,
    ['Quadrastrike'] = BlueMagicTypes.phys,
    ['Queasyshroom'] = BlueMagicTypes.phys,
    ['Radiant Breath'] = BlueMagicTypes.breath,
    ['Ram Charge'] = BlueMagicTypes.phys,
    ['Rail Cannon'] = BlueMagicTypes.mag,
    ['Reactor Cool'] = BlueMagicTypes.static,
    ['Reaving Wind'] = BlueMagicTypes.debuff,
    ['Refueling'] = BlueMagicTypes.static,
    ['Regeneration'] = BlueMagicTypes.static,
    ['Regurgitation'] = BlueMagicTypes.mag,
    ['Rending Deluge'] = BlueMagicTypes.mag,
    ['Restoral'] = BlueMagicTypes.cure,
    ['Retinal Glare'] = BlueMagicTypes.mag,
    ['Saline Coat'] = BlueMagicTypes.static,
    ['Sandspin'] = BlueMagicTypes.mag,
    ['Sandspray'] = BlueMagicTypes.debuff,
    ['Saurian Slide'] = BlueMagicTypes.addeffect,
    ['Scouring Spate'] = BlueMagicTypes.mag,
    ['Screwdriver'] = BlueMagicTypes.phys,
    ['Searing Tempest'] = BlueMagicTypes.mag,
    ['Seedspray'] = BlueMagicTypes.addeffect,
    ['Self-Destruct'] = BlueMagicTypes.mag,
    ['Sheep Song'] = BlueMagicTypes.debuff,
    ['Sickle Slash'] = BlueMagicTypes.phys,
    ['Silent Storm'] = BlueMagicTypes.debuff,
    ['Sinker Drill'] = BlueMagicTypes.phys,
    ['Smite of Rage'] = BlueMagicTypes.phys,
    ['Soporific'] = BlueMagicTypes.debuff,
    ['Sound Blast'] = BlueMagicTypes.debuff,
    ['Spectral Floe'] = BlueMagicTypes.mag,
    ['Spinal Cleave'] = BlueMagicTypes.phys,
    ['Spiral Spin'] = BlueMagicTypes.addeffect,
    ['Sprout Smack'] = BlueMagicTypes.addeffect,
    ['Stinking Gas'] = BlueMagicTypes.debuff,
    ['Subduction'] = BlueMagicTypes.mag,
    ['Sub-zero Smash'] = BlueMagicTypes.addeffect,
    ['Sudden Lunge'] = BlueMagicTypes.addeffect,
    ['Sweeping Gouge'] = BlueMagicTypes.addeffect,
    ['Tail Slap'] = BlueMagicTypes.addeffect,
    ['Tearing Gust'] = BlueMagicTypes.mag,
    ['Tem. Upheaval'] = BlueMagicTypes.mag,
    ['Temporal Shift'] = BlueMagicTypes.debuff,
    ['Tenebral Crush'] = BlueMagicTypes.mag,
    ['Terror Touch'] = BlueMagicTypes.addeffect,
    ['Thermal Pulse'] = BlueMagicTypes.mag,
    ['Thrashing Assault'] = BlueMagicTypes.phys,
    ['Thunderbolt'] = BlueMagicTypes.mag,
    ['Thunder Breath'] = BlueMagicTypes.breath,
    ['Tourbillion'] = BlueMagicTypes.addeffect,
    ['Triumphant Roar'] = BlueMagicTypes.static,
    ['Uppercut'] = BlueMagicTypes.phys,
    ['Uproot'] = BlueMagicTypes.mag,
    ['Vanity Dive'] = BlueMagicTypes.phys,
    ['Vapor Spray'] = BlueMagicTypes.breath,
    ['Venom Shell'] = BlueMagicTypes.debuff,
    ['Vertical Cleave'] = BlueMagicTypes.phys,
    ['Voracious Trunk'] = BlueMagicTypes.debuff,
    ['Warm-Up'] = BlueMagicTypes.static,
    ['Water Bomb'] = BlueMagicTypes.debuff,
    ['Whirl of Rage'] = BlueMagicTypes.addeffect,
    ['White Wind'] = BlueMagicTypes.cure,
    ['Wild Carrot'] = BlueMagicTypes.cure,
    ['Wild Oats'] = BlueMagicTypes.addeffect,
    ['Wind Breath'] = BlueMagicTypes.breath,
    ['Winds of Promy.'] = BlueMagicTypes.static,
    ['Yawn'] = BlueMagicTypes.debuff,
    ['Zephyr Mantle'] = BlueMagicTypes.static
}

CancelSpells = {
    ['Sneak'] = {
        ['Sneak'] = 1.3
    },
    ['Stoneskin'] = {
        ['Stoneskin'] = 4.6
    },
    ['Spectral Jig'] = {
        ['Sneak'] = 0
    },
    ['Trance'] = {
        ['Saber Dance'] = 0
    },
    ['Monomi: Ichi'] = {
        ['Sneak'] = 1.0
    },
    ['Utsusemi: Ichi'] = {
        ['Copy Image'] = 2.6,
        ['Copy Image (2)'] = 2.6
    }
}

NinjutsuTools = {
    ['Tonko: Ichi'] = 'Shinobi-tabi',
    ['Tonko: Ni'] = 'Shinobi-tabi',
    ['Utsusemi: Ichi'] = 'Shihei',
    ['Utsusemi: Ni'] = 'Shihei',
    ['Utsusemi: San'] = 'Shihei',
    ['Monomi: Ichi'] = 'Sanjaku-tenugui',
    ['Myoshu: Ichi'] = 'Kabenro',
    ['Migawari: Ichi'] = 'Mokujin',
    ['Gekka: Ichi'] = 'Ranka',
    ['Yain: Ichi'] = 'Furusumi',
    ['Kakka: Ichi'] = 'Ryuno',
    ['Kurayami: Ichi'] = 'Sairui-ran',
    ['Kurayami: Ni'] = 'Sairui-ran',
    ['Hojo: Ichi'] = 'Kaginawa',
    ['Hojo: Ni'] = 'Kaginawa',
    ['Dokumori: Ichi'] = 'Kodoku',
    ['Jubaku: Ichi'] = 'Jusatsu',
    ['Aisha: Ichi'] = 'Soshi',
    ['Yurin: Ichi'] = 'Jinko',
    ['Katon: Ichi'] = 'Uchitake',
    ['Katon: Ni'] = 'Uchitake',
    ['Katon: San'] = 'Uchitake',
    ['Suiton: Ichi'] = 'Mizu-deppo',
    ['Suiton: Ni'] = 'Mizu-deppo',
    ['Suiton: San'] = 'Mizu-deppo',
    ['Raiton: Ichi'] = 'Hiraishin',
    ['Raiton: Ni'] = 'Hiraishin',
    ['Raiton: San'] = 'Hiraishin',
    ['Doton: Ichi'] = 'Makibishi',
    ['Doton: Ni'] = 'Makibishi',
    ['Doton: San'] = 'Makibishi',
    ['Huton: Ichi'] = 'Kawahori-ogi',
    ['Huton: Ni'] = 'Kawahori-ogi',
    ['Huton: San'] = 'Kawahori-ogi',
    ['Hyoton: Ichi'] = 'Tsurara',
    ['Hyoton: Ni'] = 'Tsurara',
    ['Hyoton: San'] = 'Tsurara'
}

NinjutsuUniversalTools = {
    ['Tonko: Ichi'] = 'Shikanofuda',
    ['Tonko: Ni'] = 'Shikanofuda',
    ['Utsusemi: Ichi'] = 'Shikanofuda',
    ['Utsusemi: Ni'] = 'Shikanofuda',
    ['Utsusemi: San'] = 'Shikanofuda',
    ['Monomi: Ichi'] = 'Shikanofuda',
    ['Myoshu: Ichi'] = 'Shikanofuda',
    ['Migawari: Ichi'] = 'Shikanofuda',
    ['Gekka: Ichi'] = 'Shikanofuda',
    ['Yain: Ichi'] = 'Shikanofuda',
    ['Kakka: Ichi'] = 'Shikanofuda',
    ['Kurayami: Ichi'] = 'Chonofuda',
    ['Kurayami: Ni'] = 'Chonofuda',
    ['Hojo: Ichi'] = 'Chonofuda',
    ['Hojo: Ni'] = 'Chonofuda',
    ['Dokumori: Ichi'] = 'Chonofuda',
    ['Jubaku: Ichi'] = 'Chonofuda',
    ['Aisha: Ichi'] = 'Chonofuda',
    ['Yurin: Ichi'] = 'Chonofuda',
    ['Katon: Ichi'] = 'Inoshishinofuda',
    ['Katon: Ni'] = 'Inoshishinofuda',
    ['Katon: San'] = 'Inoshishinofuda',
    ['Suiton: Ichi'] = 'Inoshishinofuda',
    ['Suiton: Ni'] = 'Inoshishinofuda',
    ['Suiton: San'] = 'Inoshishinofuda',
    ['Raiton: Ichi'] = 'Inoshishinofuda',
    ['Raiton: Ni'] = 'Inoshishinofuda',
    ['Raiton: San'] = 'Inoshishinofuda',
    ['Doton: Ichi'] = 'Inoshishinofuda',
    ['Doton: Ni'] = 'Inoshishinofuda',
    ['Doton: San'] = 'Inoshishinofuda',
    ['Huton: Ichi'] = 'Inoshishinofuda',
    ['Huton: Ni'] = 'Inoshishinofuda',
    ['Huton: San'] = 'Inoshishinofuda',
    ['Hyoton: Ichi'] = 'Inoshishinofuda',
    ['Hyoton: Ni'] = 'Inoshishinofuda',
    ['Hyoton: San'] = 'Inoshishinofuda'
}

NinjutsuTypes = {
    ['buff'] = 'buff',
    ['debuff'] = 'debuff',
    ['nuke'] = 'nuke'
}

Ninjutsu = {
    ['Tonko: Ichi'] = NinjutsuTypes.buff,
    ['Utsusemi: Ichi'] = NinjutsuTypes.buff,
    ['Monomi: Ichi'] = NinjutsuTypes.buff,
    ['Tonko: Ni'] = NinjutsuTypes.buff,
    ['Utsusemi: Ni'] = NinjutsuTypes.buff,
    ['Myoshu: Ichi'] = NinjutsuTypes.buff,
    ['Migawari: Ichi'] = NinjutsuTypes.buff,
    ['Gekka: Ichi'] = NinjutsuTypes.buff,
    ['Yain: Ichi'] = NinjutsuTypes.buff,
    ['Kakka: Ichi'] = NinjutsuTypes.buff,
    ['Utsusemi: San'] = NinjutsuTypes.buff,
    ['Kurayami: Ichi'] = NinjutsuTypes.debuff,
    ['Hojo: Ichi'] = NinjutsuTypes.debuff,
    ['Dokumori: Ichi'] = NinjutsuTypes.debuff,
    ['Jubaku: Ichi'] = NinjutsuTypes.debuff,
    ['Kurayami: Ni'] = NinjutsuTypes.debuff,
    ['Hojo: Ni'] = NinjutsuTypes.debuff,
    ['Aisha: Ichi'] = NinjutsuTypes.debuff,
    ['Yurin: Ichi'] = NinjutsuTypes.debuff,
    ['Katon: Ichi'] = NinjutsuTypes.nuke,
    ['Katon: Ni'] = NinjutsuTypes.nuke,
    ['Katon: San'] = NinjutsuTypes.nuke,
    ['Suiton: Ichi'] = NinjutsuTypes.nuke,
    ['Suiton: Ni'] = NinjutsuTypes.nuke,
    ['Suiton: San'] = NinjutsuTypes.nuke,
    ['Raiton: Ichi'] = NinjutsuTypes.nuke,
    ['Raiton: Ni'] = NinjutsuTypes.nuke,
    ['Raiton: San'] = NinjutsuTypes.nuke,
    ['Doton: Ichi'] = NinjutsuTypes.nuke,
    ['Doton: Ni'] = NinjutsuTypes.nuke,
    ['Doton: San'] = NinjutsuTypes.nuke,
    ['Huton: Ichi'] = NinjutsuTypes.nuke,
    ['Huton: Ni'] = NinjutsuTypes.nuke,
    ['Huton: San'] = NinjutsuTypes.nuke,
    ['Hyoton: Ichi'] = NinjutsuTypes.nuke,
    ['Hyoton: Ni'] = NinjutsuTypes.nuke,
    ['Hyoton: San'] = NinjutsuTypes.nuke
}

PetAbilityTypes = {
    ['skill'] = 'skill',
    ['buff'] = 'buff',
    ['debuff'] = 'debuff',
    ['healing'] = 'healing',
    ['mnd'] = 'MND',
    ['magic'] = 'magic',
    ['magicTP'] = 'magicTP',
    ['physical'] = 'physical',
    ['physTP'] = 'physicalTP',
    ['multihit'] = 'multi-hit'
}

BloodPacts = {
    ['Inferno'] = PetAbilityTypes.magic,
    ['Earthen Fury'] = PetAbilityTypes.magic,
    ['Tidal Wave'] = PetAbilityTypes.magic,
    ['Aerial Blast'] = PetAbilityTypes.magic,
    ['Clarsach Call'] = PetAbilityTypes.magic,
    ['Diamond Dust'] = PetAbilityTypes.magic,
    ['Judgement Bolt'] = PetAbilityTypes.magic,
    ['Searing Light'] = PetAbilityTypes.magic,
    ['Howling Moon'] = PetAbilityTypes.magic,
    ['Ruinous Omen'] = PetAbilityTypes.magic,
    ['Punch'] = PetAbilityTypes.physical,
    ['Rock Throw'] = PetAbilityTypes.physical,
    ['Barracuda Dive'] = PetAbilityTypes.physical,
    ['Claw'] = PetAbilityTypes.physical,
    ['Welt'] = PetAbilityTypes.physical,
    ['Axe Kick'] = PetAbilityTypes.physical,
    ['Shock Strike'] = PetAbilityTypes.physical,
    ['Camisado'] = PetAbilityTypes.physical,
    ['Regal Scratch'] = PetAbilityTypes.physical,
    ['Poison Nails'] = PetAbilityTypes.physical,
    ['Moonlit Charge'] = PetAbilityTypes.debuff,
    ['Fire II'] = PetAbilityTypes.magicTP,
    ['Stone II'] = PetAbilityTypes.magicTP,
    ['Water II'] = PetAbilityTypes.magicTP,
    ['Aero II'] = PetAbilityTypes.magicTP,
    ['Blizzard II'] = PetAbilityTypes.magicTP,
    ['Thunder II'] = PetAbilityTypes.magicTP,
    ['Crescent Fang'] = PetAbilityTypes.physTP,
    ['Thunderspark'] = PetAbilityTypes.magic,
    ['Rock Buster'] = PetAbilityTypes.physTP,
    ['Burning Strike'] = PetAbilityTypes.magic,
    ['Roundhouse'] = PetAbilityTypes.physTP,
    ['Tail Whip'] = PetAbilityTypes.debuff,
    ['Double Punch'] = PetAbilityTypes.physical,
    ['Megalith Throw'] = PetAbilityTypes.physical,
    ['Double Slap'] = PetAbilityTypes.physical,
    ['Meteorite'] = PetAbilityTypes.magicTP,
    ['Fire IV'] = PetAbilityTypes.magic,
    ['Stone IV'] = PetAbilityTypes.magic,
    ['Water IV'] = PetAbilityTypes.magic,
    ['Aero IV'] = PetAbilityTypes.magic,
    ['Blizzard IV'] = PetAbilityTypes.magic,
    ['Thunder IV'] = PetAbilityTypes.magic,
    ['Sonic Buffet'] = PetAbilityTypes.magic,
    ['Eclipse Bite'] = PetAbilityTypes.physical,
    ['Nether Blast'] = PetAbilityTypes.magic,
    ['Flaming Crush'] = PetAbilityTypes.physical,
    ['Mountain Buster'] = PetAbilityTypes.physTP,
    ['Spinning Dive'] = PetAbilityTypes.physTP,
    ['Predator Claws'] = PetAbilityTypes.physical,
    ['Rush'] = PetAbilityTypes.physical,
    ['Chaotic Strike'] = PetAbilityTypes.physical,
    ['Zantetsuken'] = PetAbilityTypes.magic,
    ['Meteor Strike'] = PetAbilityTypes.magic,
    ['Geocrush'] = PetAbilityTypes.magic,
    ['Grand Fall'] = PetAbilityTypes.magic,
    ['Wind Blade'] = PetAbilityTypes.magic,
    ['Tornado II'] = PetAbilityTypes.magic,
    ['Heavenly Strike'] = PetAbilityTypes.magic,
    ['Thunderstorm'] = PetAbilityTypes.magic,
    ['Level ? Holy'] = PetAbilityTypes.magicTP,
    ['Holy Mist'] = PetAbilityTypes.magic,
    ['Lunar Bay'] = PetAbilityTypes.magicTP,
    ['Night Terror'] = PetAbilityTypes.magic,
    ['Conflag Strike'] = PetAbilityTypes.magicTP,
    ['Volt Strike'] = PetAbilityTypes.physical,
    ['Hysteric Assault'] = PetAbilityTypes.physical,
    ['Crag Throw'] = PetAbilityTypes.physical,
    ['Blindside'] = PetAbilityTypes.physical,
    ['Regal Gash'] = PetAbilityTypes.physical,
    ['Impact'] = PetAbilityTypes.magicTP,
    ['Altana\'s Favor'] = PetAbilityTypes.skill,
    ['Healing Ruby'] = PetAbilityTypes.healing,
    ['Lunatic Voice'] = PetAbilityTypes.debuff,
    ['Raise II'] = PetAbilityTypes.skill,
    ['Somnolence'] = PetAbilityTypes.debuff,
    ['Lunar Cry'] = PetAbilityTypes.debuff,
    ['Shining Ruby'] = PetAbilityTypes.buff,
    ['Mewing Lullaby'] = PetAbilityTypes.debuff,
    ['Aerial Armor'] = PetAbilityTypes.buff,
    ['Frost Armor'] = PetAbilityTypes.buff,
    ['Nightmare'] = PetAbilityTypes.debuff,
    ['Reraise II'] = PetAbilityTypes.skill,
    ['Rolling Thunder'] = PetAbilityTypes.buff,
    ['Katabatic Blades'] = PetAbilityTypes.buff,
    ['Lunar Roar'] = PetAbilityTypes.debuff,
    ['Slowga'] = PetAbilityTypes.debuff,
    ['Whispering Wind'] = PetAbilityTypes.healing,
    ['Ultimate Terror'] = PetAbilityTypes.debuff,
    ['Crimson Howl'] = PetAbilityTypes.buff,
    ['Sleepga'] = PetAbilityTypes.debuff,
    ['Lightning Armor'] = PetAbilityTypes.buff,
    ['Chinook'] = PetAbilityTypes.buff,
    ['Ecliptic Growl'] = PetAbilityTypes.buff,
    ['Glittering Ruby'] = PetAbilityTypes.buff,
    ['Earthen Ward'] = PetAbilityTypes.buff,
    ['Spring Water'] = PetAbilityTypes.healing,
    ['Hastega'] = PetAbilityTypes.buff,
    ['Noctoshield'] = PetAbilityTypes.buff,
    ['Bitter Elegy'] = PetAbilityTypes.debuff,
    ['Ecliptic Howl'] = PetAbilityTypes.buff,
    ['Eerie Eye'] = PetAbilityTypes.debuff,
    ['Dream Shroud'] = PetAbilityTypes.buff,
    ['Healing Ruby II'] = PetAbilityTypes.healing,
    ['Perfect Defense'] = PetAbilityTypes.skill,
    ['Deconstruction'] = PetAbilityTypes.skill,
    ['Chronoshift'] = PetAbilityTypes.skill,
    ['Earthen Armor'] = PetAbilityTypes.buff,
    ['Tidal Roar'] = PetAbilityTypes.debuff,
    ['Fleet Wind'] = PetAbilityTypes.buff,
    ['Inferno Howl'] = PetAbilityTypes.buff,
    ['Wind\'s Blessing'] = PetAbilityTypes.mnd,
    ['Diamond Storm'] = PetAbilityTypes.debuff,
    ['Shock Squall'] = PetAbilityTypes.debuff,
    ['Soothing Ruby'] = PetAbilityTypes.skill,
    ['Heavenward Howl'] = PetAbilityTypes.buff,
    ['Pavor Nocturnus'] = PetAbilityTypes.debuff,
    ['Pacifying Ruby'] = PetAbilityTypes.skill,
    ['Hastega II'] = PetAbilityTypes.buff,
    ['Soothing Current'] = PetAbilityTypes.buff,
    ['Crystal Blessing'] = PetAbilityTypes.buff
}

ReadyMoves = {
    ['Acid Mist'] = PetAbilityTypes.debuff,
    ['Acid Spray'] = PetAbilityTypes.magic,
    ['Back Heel'] = PetAbilityTypes.physical,
    ['Beak Lunge'] = PetAbilityTypes.physical,
    ['Big Scissors'] = PetAbilityTypes.physical,
    ['Blaster'] = PetAbilityTypes.debuff,
    ['Blockhead'] = PetAbilityTypes.physical,
    ['Brain Crush'] = PetAbilityTypes.physical,
    ['Bubble Curtain'] = PetAbilityTypes.buff,
    ['Bubble Shower'] = PetAbilityTypes.magic,
    ['Chaotic Eye'] = PetAbilityTypes.debuff,
    ['Charged Whisker'] = PetAbilityTypes.magic,
    ['Choke Breath'] = PetAbilityTypes.debuff,
    ['Chomp Rush'] = PetAbilityTypes.physical,
    ['Claw Cyclone'] = PetAbilityTypes.physical,
    ['Corrosive Ooze'] = PetAbilityTypes.magic,
    ['Cursed Sphere'] = PetAbilityTypes.magic,
    ['Cyclotail'] = PetAbilityTypes.physical,
    ['Crossthrash'] = PetAbilityTypes.physical,
    ['Dark Spore'] = PetAbilityTypes.magic,
    ['Disembowel'] = PetAbilityTypes.physical,
    ['Double Claw'] = PetAbilityTypes.physical,
    ['Dust Cloud'] = PetAbilityTypes.magic,
    ['Extirpating Salvo'] = PetAbilityTypes.physical,
    ['Filamented Hold'] = PetAbilityTypes.debuff,
    ['Fireball'] = PetAbilityTypes.magic,
    ['Fluid Spread'] = PetAbilityTypes.physical,
    ['Fluid Toss'] = PetAbilityTypes.physical,
    ['Foot Kick'] = PetAbilityTypes.physical,
    ['Foul Waters'] = PetAbilityTypes.magic,
    ['Frenzied Rage'] = PetAbilityTypes.buff,
    ['Frogkick'] = PetAbilityTypes.physical,
    ['Gloeosuccus'] = PetAbilityTypes.debuff,
    ['Gloom Spray'] = PetAbilityTypes.magic,
    ['Grapple'] = PetAbilityTypes.physical,
    ['Head Butt'] = PetAbilityTypes.physical,
    ['Hi-Freq Field'] = PetAbilityTypes.debuff,
    ['Hoof Volley'] = PetAbilityTypes.physical,
    ['Infected Leech'] = PetAbilityTypes.debuff,
    ['Infrasonics'] = PetAbilityTypes.debuff,
    ['Intimidate'] = PetAbilityTypes.debuff,
    ['Jettatura'] = PetAbilityTypes.debuff,
    ['Lamb Chop'] = PetAbilityTypes.physical,
    ['Leaf Dagger'] = PetAbilityTypes.physical,
    ['Mandibular Bite'] = PetAbilityTypes.physical,
    ['Mega Scissors'] = PetAbilityTypes.physical,
    ['Metallic Body'] = PetAbilityTypes.buff,
    ['Molting Plumage'] = PetAbilityTypes.magic,
    ['Nectarous Deluge'] = PetAbilityTypes.magic,
    ['Needle Shot'] = PetAbilityTypes.physical,
    ['Nepenthic Plunge'] = PetAbilityTypes.magic,
    ['Nimble Snap'] = PetAbilityTypes.physical,
    ['Noisome Powder'] = PetAbilityTypes.debuff,
    ['Numbing Noise'] = PetAbilityTypes.debuff,
    ['Numbshroom'] = PetAbilityTypes.physical,
    ['Palsy Pollen'] = PetAbilityTypes.debuff,
    ['Pecking Flurry'] = PetAbilityTypes.physical,
    ['Pentapeck'] = PetAbilityTypes.multihit,
    ['Pestilent Plume'] = PetAbilityTypes.magic,
    ['Power Attack'] = PetAbilityTypes.physical,
    ['Predatory Glare'] = PetAbilityTypes.debuff,
    ['Purulent Ooze'] = PetAbilityTypes.debuff,
    ['Queasyshroom'] = PetAbilityTypes.physical,
    ['Rage'] = PetAbilityTypes.buff,
    ['Razor Fang'] = PetAbilityTypes.physical,
    ['Recoil Dive'] = PetAbilityTypes.physical,
    ['Rhinowrecker'] = PetAbilityTypes.physical,
    ['Rhino Attack'] = PetAbilityTypes.physical,
    ['Ripper Fang'] = PetAbilityTypes.physical,
    ['Roar'] = PetAbilityTypes.debuff,
    ['Sandblast'] = PetAbilityTypes.debuff,
    ['Sandpit'] = PetAbilityTypes.debuff,
    ['Scissor Guard'] = PetAbilityTypes.buff,
    ['Scream'] = PetAbilityTypes.debuff,
    ['Scythe Tail'] = PetAbilityTypes.physical,
    ['Secretion'] = PetAbilityTypes.buff,
    ['Sensilla Blades'] = PetAbilityTypes.physical,
    ['Shakeshroom'] = PetAbilityTypes.physical,
    ['Sheep Charge'] = PetAbilityTypes.physical,
    ['Sheep Song'] = PetAbilityTypes.debuff,
    ['Sickle Slash'] = PetAbilityTypes.physical,
    ['Silence Gas'] = PetAbilityTypes.magic,
    ['Snow Cloud'] = PetAbilityTypes.debuff,
    ['Somersault'] = PetAbilityTypes.physical,
    ['Soporific'] = PetAbilityTypes.debuff,
    ['Spider Web'] = PetAbilityTypes.debuff,
    ['Spinning Top'] = PetAbilityTypes.physical,
    ['Spiral Spin'] = PetAbilityTypes.physical,
    ['Spoil'] = PetAbilityTypes.debuff,
    ['Spore'] = PetAbilityTypes.debuff,
    ['Stink Bomb'] = PetAbilityTypes.magic,
    ['Suction'] = PetAbilityTypes.debuff,
    ['Sudden Lunge'] = PetAbilityTypes.debuff,
    ['Sweeping Gouge'] = PetAbilityTypes.multihit,
    ['Swooping Frenzy'] = PetAbilityTypes.physical,
    ['Tail Blow'] = PetAbilityTypes.physical,
    ['Tegmina Buffet'] = PetAbilityTypes.physical,
    ['Tickling Tendrils'] = PetAbilityTypes.multihit,
    ['Tortoise Stomp'] = PetAbilityTypes.physical,
    ['Toxic Spit'] = PetAbilityTypes.debuff,
    ['Venom'] = PetAbilityTypes.magic,
    ['Venom Shower'] = PetAbilityTypes.magic,
    ['Venom Spray'] = PetAbilityTypes.debuff,
    ['Water Wall'] = PetAbilityTypes.buff,
    ['Whirl Claws'] = PetAbilityTypes.physical,
    ['Wild Oats'] = PetAbilityTypes.physical,
    ['Wing Slap'] = PetAbilityTypes.multihit,
    ['Zealous Snort'] = PetAbilityTypes.buff
}

PetAbilities = merge(BloodPacts, ReadyMoves)

Avatars = S {'Alexander', 'Atomos', 'Cait Sith', 'Carbuncle', 'Diabolos', 'Fenrir', 'Garuda', 'Ifrit', 'Leviathan',
             'Odin', 'Phoenix', 'Ramuh', 'Shiva', 'Siren', 'Titan'}
