-- =========================================================================================================
-- A single file to define all of the augmented gear that I have available
-- =========================================================================================================
-- =========================================================================================================
-- Odyssey Sets
-- =========================================================================================================
nyame = {
    head = "Nyame Helm",
    body = "Nyame Mail",
    hands = "Nyame Gauntlets",
    legs = "Nyame Flanchard",
    feet = "Nyame Sollerets"
}

mpaca = {
    head = "Mpaca's Cap",
    body = "Mpaca's Doublet",
    hands = "Mpaca's Gloves",
    legs = "Mpaca's Hose",
    feet = "Mpaca's Boots"
}

gleti = {
    head = "Gleti's Mask",
    body = "Gleti's Cuirass",
    hands = "Gleti's Gauntlets",
    legs = "Gleti's Breeches",
    feet = "Gleti's Boots"
}

bunzi = {
    head = "Bunzi's Cap",
    body = "Bunzi's Robe",
    hands = "Bunzi's Gloves",
    legs = "Bunzi's Pants",
    feet = "Bunzi's Sabots"
}

sakpata = {}

-- =========================================================================================================
-- Ambuscade Sets
-- =========================================================================================================
flamma = {
    body = "Flamma Korazin +2"
}

ayanmo = {
    head = "Aya. Zucchetto +2",
    body = "Ayanmo Corazza +2",
    hands = "Aya. Manopolas +2",
    legs = "Aya. Cosciales +2",
    feet = "Aya. Gambieras +2"
}

-- =========================================================================================================
-- Unity Sets
-- =========================================================================================================
tatenashi = {
    body = "Tatena. Harama. +1",
    legs = "Tatena. Haidate +1",
    feet = "Tatena. Sune"
}

-- =========================================================================================================
-- Oseem Augments
-- =========================================================================================================
herc = {}
herc.head = {
    refresh = {
        name = "Herculean Helm",
        augments = {'VIT+9', 'Rng.Acc.+26', '"Refresh"+2', 'Accuracy+11 Attack+11'}
    },
    dexta = {
        name = "Herculean Helm",
        augments = {'Accuracy+24', '"Triple Atk."+3', 'DEX+10'}
    }
}

herc.hands = {
    refresh = {
        name = "Herculean Gloves",
        augments = {'Accuracy+3', 'CHR+6', '"Refresh"+2', 'Accuracy+12 Attack+12', 'Mag. Acc.+8 "Mag.Atk.Bns."+8'}
    },
    -- strta = {
    --     name = "Herculean Gloves",
    --     augments = {'Accuracy+8', '"Triple Atk."+3', 'STR+8', 'Attack+15'}
    -- },
    dexta = {
        name = "Herculean Gloves",
        augments = {'Accuracy+20', '"Triple Atk."+3', 'DEX+10', 'Attack+10'}
    }
}

herc.legs = {
    refresh = {
        name = "Herculean Trousers",
        augments = {'"Mag.Atk.Bns."+5', '"Rapid Shot"+3', '"Refresh"+2'}
    }
}

herc.feet = {
    thmab = {
        name = "Herculean Boots",
        augments = {'Weapon skill damage +4%', 'MND+4', '"Treasure Hunter"+2', 'Accuracy+13 Attack+13',
                    'Mag. Acc.+17 "Mag.Atk.Bns."+17'}
    },
    refresh = {
        name = "Herculean Boots",
        augments = {'Mag. Acc.+7 "Mag.Atk.Bns."+7', 'CHR+7', '"Refresh"+2'}
    },
    -- strta = {
    --     name = "Herculean Boots",
    --     augments = {'"Triple Atk."+3', 'STR+10', 'Accuracy+3', 'Attack+3'}
    -- },
    dexta = {
        name = "Herculean Boots",
        augments = {'"Triple Atk."+4', 'DEX+10', 'Accuracy+8'}
    },
    strcrit = {
        name = "Herculean Boots",
        augments = {'Attack+11', 'Crit. hit damage +4%', 'STR+9'}
    }
}

chironic = {}
chironic.head = {
    th = {
        name = "Chironic Hat",
        augments = {'Mag. Acc.+14', 'Pet: DEX+5', '"Treasure Hunter"+2'}
    },
    refresh = {
        name = "Chironic Hat",
        augments = {'Pet: DEX+4', 'Attack+6', '"Refresh"+2', 'Mag. Acc.+3 "Mag.Atk.Bns."+3'}
    }
}

-- =========================================================================================================
-- Skirmish Augments
-- =========================================================================================================
taeon = {}
taeon.head = {
    pet = {
        name = "Taeon Chapeau",
        augments = {'Pet: Accuracy+25 Pet: Rng. Acc.+25', 'Pet: "Dbl. Atk."+5', 'Pet: Damage taken -4%'}
    }
}
taeon.body = {
    fc = {
        name = "Taeon Tabard",
        augments = {'"Fast Cast"+5'}
    },
    pet = {
        name = "Taeon Tabard",
        augments = {'Pet: Accuracy+23 Pet: Rng. Acc.+23', 'Pet: "Dbl. Atk."+5', 'Pet: Damage taken -4%'}
    }
}
taeon.hands = {
    pet = {
        name = "Taeon Gloves",
        augments = {'Pet: Accuracy+25 Pet: Rng. Acc.+25', 'Pet: "Dbl. Atk."+5', 'Pet: Damage taken -4%'}
    }
}
taeon.legs = {
    pet = {
        name = "Taeon Tights",
        augments = {'Pet: Accuracy+23 Pet: Rng. Acc.+23', 'Pet: "Dbl. Atk."+5', 'Pet: Damage taken -4%'}
    }
}
taeon.feet = {
    pet = {
        name = "Taeon Boots",
        augments = {'Pet: Accuracy+23 Pet: Rng. Acc.+23', 'Pet: "Dbl. Atk."+5', 'Pet: Damage taken -4%'}
    }
}

telchine = {}
telchine.head = {
    enhfc = {
        name = "Telchine Cap",
        augments = {'"Fast Cast"+5', 'Enh. Mag. eff. dur. +9'}
    }
}
telchine.body = {
    enhfc = {
        name = "Telchine Chas.",
        augments = {'"Fast Cast"+5', 'Enh. Mag. eff. dur. +9'}
    }
}
telchine.hands = {
    enhfc = {
        name = "Telchine Gloves",
        augments = {'"Fast Cast"+5', 'Enh. Mag. eff. dur. +9'}
    }
}
telchine.legs = {
    enhfc = {
        name = "Telchine Braconi",
        augments = {'"Fast Cast"+5', 'Enh. Mag. eff. dur. +10'}
    }
}
telchine.feet = {
    enhfc = {
        name = "Telchine Pigaches",
        augments = {'"Fast Cast"+5', 'Enh. Mag. eff. dur. +10'}
    }
}
