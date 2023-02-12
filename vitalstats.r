AssignVitalStats <- function(CharSpecies, CharClass) {
 if (CharSpecies == "Human") {
    Age <<- if (CharClass %in% list("Barbarian", "Rogue", "Sorceror")) {
        15 + RollDice(4, 1, 0)
    } else if (CharClass %in% list("Bard", "Fighter", "Paladin", "Ranger")) {
        15 + RollDice(6, 1, 0)
    } else  if (CharClass %in% list("Cleric", "Druid", "Monk", "Wizard")) {
        15 + RollDice(6, 2, 0)
    }
    VitalRoll <-RollDice(10 ,2, 0)
    Height <<- 58 + VitalRoll
    Weight <<- 120 + (VitalRoll * RollDice(4, 2, 0))
 } else if (CharSpecies == "Elf") {
    Age <<- if (CharClass %in% list("Barbarian", "Rogue", "Sorceror")) {
        15 + RollDice(6, 4, 0)
    } else if (CharClass %in% list("Bard", "Fighter", "Paladin", "Ranger")) {
        15 + RollDice(6, 6, 0)
    } else  if (CharClass %in% list("Cleric", "Druid", "Monk", "Wizard")) {
        15 + RollDice(6, 10, 0)
    }
    VitalRoll <-RollDice(6 ,2, 0)
    Height <<- 53 + VitalRoll
    Weight <<- 120 + (VitalRoll * RollDice(6, 1, 0))
 } else if (CharSpecies == "Dwarf") {
    Age <<- if (CharClass %in% list("Barbarian", "Rogue", "Sorceror")) {
        40 + RollDice(6, 3, 0)
    } else if (CharClass %in% list("Bard", "Fighter", "Paladin", "Ranger")) {
        40 + RollDice(6, 5, 0)
    } else  if (CharClass %in% list("Cleric", "Druid", "Monk", "Wizard")) {
        40 + RollDice(6, 7, 0)
    }
    VitalRoll <-RollDice(4 ,2, 0)
    Height <<- 58 + VitalRoll
    Weight <<- 120 + (VitalRoll * RollDice(6, 2, 0))
 } else if (CharSpecies == "Halfling") {
    Age <<- if (CharClass %in% list("Barbarian", "Rogue", "Sorceror")) {
        20 + RollDice(4, 2, 0)
    } else if (CharClass %in% list("Bard", "Fighter", "Paladin", "Ranger")) {
        20 + RollDice(6, 3, 0)
    } else  if (CharClass %in% list("Cleric", "Druid", "Monk", "Wizard")) {
        20 + RollDice(6, 4, 0)
    }
    VitalRoll <-RollDice(4 ,2, 0)
    Height <<- 32 + VitalRoll
    Weight <<- 30 + (VitalRoll * RollDice(4, 2, 0))
 } else if (CharSpecies == "Gnome") {
    Age <<- if (CharClass %in% list("Barbarian", "Rogue", "Sorceror")) {
        15 + RollDice(4, 1, 0)
    } else if (CharClass %in% list("Bard", "Fighter", "Paladin", "Ranger")) {
        15 + RollDice(6, 1, 0)
    } else  if (CharClass %in% list("Cleric", "Druid", "Monk", "Wizard")) {
        15 + RollDice(6, 2, 0)
    }
    VitalRoll <-RollDice(4 ,2, 0)
    Height <<- 36 + VitalRoll
    Weight <<- 40 + (VitalRoll * RollDice(4, 2, 0))
 } else if (CharSpecies == "Half-Elf") {
    Age <<- if (CharClass %in% list("Barbarian", "Rogue", "Sorceror")) {
        20 + RollDice(4, 1, 0)
    } else if (CharClass %in% list("Bard", "Fighter", "Paladin", "Ranger")) {
        20 + RollDice(6, 1, 0)
    } else  if (CharClass %in% list("Cleric", "Druid", "Monk", "Wizard")) {
        20 + RollDice(6, 2, 0)
    }
    VitalRoll <-RollDice(8 ,2, 0)
    Height <<- 55 + VitalRoll
    Weight <<- 100 + (VitalRoll * RollDice(4, 2, 0))
 } else if (CharSpecies == "Half-Orc") {
    Age <<- if (CharClass %in% list("Barbarian", "Rogue", "Sorceror")) {
        14 + RollDice(4, 1, 0)
    } else if (CharClass %in% list("Bard", "Fighter", "Paladin", "Ranger")) {
        14 + RollDice(6, 1, 0)
    } else  if (CharClass %in% list("Cleric", "Druid", "Monk", "Wizard")) {
        14 + RollDice(6, 2, 0)
    }
    VitalRoll <-RollDice(12 ,2, 0)
    Height <<- 58 + VitalRoll
    Weight <<- 150 + (VitalRoll * RollDice(6, 2, 0))
}
}