
AssignClass <- function(CharClass) {
  if (CharClass %in% ClassList) {
    CharacterLevel <<- 1L
    AddHitDie(CharClass)
    AddSaves(CharClass)
    AddBaseAttackBonus(CharClass)
  }
}

RemoveClass <- function(CharClass) {
  if (CharClass %in% ClassList) {
    CharacterLevel <<- 0L
    RemoveHitDie(CharClass)
    RemoveSaves(CharClass)
    RemoveBaseAttackBonus(CharClass)
  }
}

RecommendClass <- function() {
  if (StatList[which.max(CharStats)] == "Strength") {
    if (CharStats$Constitution >= CharStats$Wisdom) {
    "Fighter"
    } else {
       "Barbarian"
    }
  } else
   if (StatList[which.max(CharStats)] == "Dexterity") {
          if (CharStats$Strength >= CharStats$Intelligence) {
    "Ranger"
    } else {
       "Rogue"
    }
     } else if
       (StatList[which.max(CharStats)] == "Constitution") {
            if (CharStats$Strength >= CharStats$Wisdom) {
    "Fighter"
    } else {
       "Cleric"
    }
        } else if
         (StatList[which.max(CharStats)] == "Intelligence") {
            if (CharStats$Constitution >= CharStats$Wisdom) {
    "Wizard"
    } else {
       "Rogue"
    }
        } else if
        (StatList[which.max(CharStats)] == "Wisdom") {
            if (CharStats$Dexterity >= CharStats$Constitution) {
        if (CharStats$Wisdom >= CharStats$Strength) {
    "Druid"
    } else {
       "Monk"
    }
    } else {
       "Cleric"
    }
        } else if
        (StatList[which.max(CharStats)] == "Charisma") {
            if (CharStats$Strength >= CharStats$Dexterity) {
    "Paladin"
    } else {
           if (CharStats$Intelligence >= CharStats$Constitution) {
    "Bard"
    } else {
       "Sorceror"
    }
    }
        } else {
        "Beats TF out of me!"
        }
    }

AddClassHitDie <<- function(CharClass) {
if (CharClass == "Barbarian") {
  return(12)
  } else
 if (CharClass %in% (list("Fighter", "Paladin", "Ranger"))) {
   return(10)
} else
 if (CharClass %in% (list("Druid", "Cleric", "Bard", "Monk", "Rogue"))) {
  return(8)
  } else
   if (CharClass %in% (list("Sorceror", "Wizard"))) {
  return(6)
  }
}

RemoveClassHitDie <<- function(CharClass) {
if (CharClass == "Barbarian") {
  return(0)
  } else
 if (CharClass %in% (list("Fighter", "Paladin", "Ranger"))) {
   return(0)
} else
 if (CharClass %in% (list("Druid", "Cleric", "Bard", "Monk", "Rogue"))) {
  return(0)
  } else
   if (CharClass %in% (list("Sorceror", "Wizard"))) {
  return(0)
  }
}