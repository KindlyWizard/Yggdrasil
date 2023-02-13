 AddBaseAttackBonus <<- function(CharClass) {
  if (CharClass %in% list("Barbarian", "Fighter", "Paladin", "Ranger"))
  ComputedStatValue$BaseAttackBonus <<- ComputedStatValue$BaseAttackBonus + 1
 }

 AddSaves <<- function(CharClass) {
  if (CharClass == "Barbarian") {
    ComputedStatValue$ReflexSave <<- (ComputedStatValue$ReflexSave + 2)
    } else
  if (CharClass == "Bard") {
    ComputedStatValue$ReflexSave <<- (ComputedStatValue$ReflexSave + 2)
    ComputedStatValue$WillSave <<- (ComputedStatValue$WillSave + 2)
  } else
  if (CharClass == "Cleric") {
    ComputedStatValue$FortitudeSave <<- (ComputedStatValue$FortitudeSave + 2)
    ComputedStatValue$WillSave <<- (ComputedStatValue$WillSave + 2)
    } else
  if (CharClass == "Druid") {
    ComputedStatValue$FortitudeSave <<- (ComputedStatValue$FortitudeSave + 2)
    ComputedStatValue$WillSave <<- (ComputedStatValue$WillSave + 2)
    } else
  if (CharClass == "Fighter") {
    ComputedStatValue$FortitudeSave <<- (ComputedStatValue$FortitudeSave + 2)
    } else
  if (CharClass == "Monk") {
    ComputedStatValue$ReflexSave <<- (ComputedStatValue$ReflexSave + 2)
    ComputedStatValue$FortitudeSave <<- (ComputedStatValue$FortitudeSave + 2)
    ComputedStatValue$WillSave <<- (ComputedStatValue$WillSave + 2)
    } else
  if (CharClass == "Paladin") {
    ComputedStatValue$FortitudeSave <<- (ComputedStatValue$FortitudeSave + 2)
    ComputedStatValue$WillSave <<- (ComputedStatValue$WillSave + 2)
    } else
  if (CharClass == "Ranger") {
    ComputedStatValue$FortitudeSave <<- (ComputedStatValue$FortitudeSave + 2)
    ComputedStatValue$ReflexSave <<- (ComputedStatValue$ReflexSave + 2)
    } else
  if (CharClass == "Rogue") {
    ComputedStatValue$ReflexSave <<- (ComputedStatValue$ReflexSave + 2)
    } else
  if (CharClass == "Sorceror") {
    ComputedStatValue$WillSave <<- (ComputedStatValue$WillSave + 2)
    } else
  if (CharClass == "Wizard") {
    ComputedStatValue$WillSave <<- (ComputedStatValue$WillSave + 2)
    }
    return(ComputedStatValue)
}


CalculateBaseAttackBonus <- function() {
  ComputedStatValue$BaseAttackBonus <<- ComputedStatValue$StrengthBonus
 }

CalculateFortitudeSave <- function() {
  ComputedStatValue$FortitudeSave <<- ComputedStatValue$ConstitutionBonus
 }

CalculateInitiativeBonus <- function() {
  ComputedStatValue$InitiativeBonus <<- ComputedStatValue$DexerityBonus
 }

CalculateReflexSave <- function() {
  ComputedStatValue$ReflexSave <<- ComputedStatValue$DexterityBonus
}

CalculateWillSave <- function() {
 ComputedStatValue$WillSave <<- ComputedStatValue$WisdomBonus
 }

 ComputeBaseStatBonus <- function(CharStat) {
 floor((as.numeric(ReturnStatValue(ReturnStatIndex(CharStat))) / 2) - 5)
}

ComputeOtherStats <- function(ComputedStat) {
  if (ComputedStat == "FortitudeSave") CalculateFortitudeSave()
    else if (ComputedStat == "ReflexSave") CalculateReflexSave()
    else if (ComputedStat == "WillSave") CalculateWillSave()
    else if (ComputedStat == "InitiativeBonus") CalculateInitiativeBonus()
    else if (ComputedStat == "BaseAttackBonus") CalculateBaseAttackBonus()
}

ComputeStat <- function(ComputedStat) {
  if (ComputedStat %in% BaseComputedStatList) {
    ComputedStatValue$ComputedStat <<- ComputeBaseStatBonus(ComputedStat)
    } else {
        ComputeOtherStats(ComputedStat)
      }
}

ComputeStats <- function(CharStats) {
  names(ComputedStatValue) <<- ComputedStatList
  for (x in seq_along(ComputedStatList)) {
  ComputedStatValue[x] <<- ComputeStat(unlist(ComputedStatList[x]))
  }
}

DamageBonus <- function() {
ReturnComputedStatValue("StrengthBonus")
}

DisplayComputedStats <- function() {
  for (x in seq_along(ComputedStatList)) {
    print(paste(ComputedStatList[x], ComputedStatValue[x], sep = " "))
  }
}

DisplayStats <- function() {
  for (x in seq_along(StatList)) {
    print(paste(StatList[x], CharStats[x]))
    }
}

RemoveBaseAttackBonus <<- function(CharClass) {
  if (CharClass %in% list("Barbarian", "Fighter", "Paladin", "Ranger"))
  ComputedStatValue$BaseAttackBonus <<- ComputedStatValue$BaseAttackBonus - 1
 }

 RemoveSaves <<- function(CharClass) {
  if (CharClass == "Barbarian") {
    ComputedStatValue$ReflexSave <<- (ComputedStatValue$ReflexSave - 2)
    } else
  if (CharClass == "Bard") {
    ComputedStatValue$ReflexSave <<- (ComputedStatValue$ReflexSave - 2)
    ComputedStatValue$WillSave <<- (ComputedStatValue$WillSave - 2)
  } else
  if (CharClass == "Cleric") {
    ComputedStatValue$FortitudeSave <<- (ComputedStatValue$FortitudeSave - 2)
    ComputedStatValue$WillSave <<- (ComputedStatValue$WillSave - 2)
    } else
  if (CharClass == "Druid") {
    ComputedStatValue$FortitudeSave <<- (ComputedStatValue$FortitudeSave - 2)
    ComputedStatValue$WillSave <<- (ComputedStatValue$WillSave - 2)
    } else
  if (CharClass == "Fighter") {
    ComputedStatValue$FortitudeSave <<- (ComputedStatValue$FortitudeSave - 2)
    } else
  if (CharClass == "Monk") {
    ComputedStatValue$ReflexSave <<- (ComputedStatValue$ReflexSave - 2)
    ComputedStatValue$FortitudeSave <<- (ComputedStatValue$FortitudeSave - 2)
    ComputedStatValue$WillSave <<- (ComputedStatValue$WillSave - 2)
    } else
  if (CharClass == "Paladin") {
    ComputedStatValue$FortitudeSave <<- (ComputedStatValue$FortitudeSave - 2)
    ComputedStatValue$WillSave <<- (ComputedStatValue$WillSave - 2)
    } else
  if (CharClass == "Ranger") {
    ComputedStatValue$FortitudeSave <<- (ComputedStatValue$FortitudeSave - 2)
    ComputedStatValue$ReflexSave <<- (ComputedStatValue$ReflexSave - 2)
    } else
  if (CharClass == "Rogue") {
    ComputedStatValue$ReflexSave <<- (ComputedStatValue$ReflexSave - 2)
    } else
  if (CharClass == "Sorceror") {
    ComputedStatValue$WillSave <<- (ComputedStatValue$WillSave - 2)
    } else
  if (CharClass == "Wizard") {
    ComputedStatValue$WillSave <<- (ComputedStatValue$WillSave - 2)
    }
    return(ComputedStatValue)
}