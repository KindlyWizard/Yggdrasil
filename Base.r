AddSpeciesBonus <- function(Stat, Bonus = 0L) {
  for (x in seq_along(StatList)) {
    if (Stat == (as.character(StatList[x]))) {
      CharStats[x] <- as.numeric(CharStats[x]) + Bonus
   }
  }
 }

AdjustStatsSpecies <- function(CharSpecies = "Human") {
 if (CharSpecies == "Dwarf") {
   AddSpeciesBonus("Constitution", 2)
   AddSpeciesBonus("Wisdom", 2)
   AddSpeciesBonus("Charisma", -2)
   }
 if (CharSpecies == "Elf") {
   AddSpeciesBonus("Dexterity", 2)
   AddSpeciesBonus("Intelligence", 2)
   AddSpeciesBonus("Constitution", -2)
   }
 if (CharSpecies == "Gnome") {
   AddSpeciesBonus("Constitution", 2)
   AddSpeciesBonus("Charisma", 2)
   AddSpeciesBonus("Strength", -2)
   }
 if (CharSpecies == "Half-Elf") {
   AddSpeciesBonus(StatList[which.max(CharStats)], 2)
   }
 if (CharSpecies == "Half-Orc") {
   AddSpeciesBonus(StatList[which.max(CharStats)], 2)
   }
 if (CharSpecies == "Halfling") {
   AddSpeciesBonus("Dexterity", 2)
   AddSpeciesBonus("Charisma", 2)
   AddSpeciesBonus("Strength", -2)
   }
 if (CharSpecies == "Human") {
   AddSpeciesBonus(StatList[which.max(CharStats)], 2)
   }
  }

AssignClass <- function(ClassPicked) {
  if (ClassPicked %in% ClassList) {
    CharClass <<- ClassPicked
  }
}

AssignSpecies <- function(Game = "DandD") {
  if (Game == "DandD") {
    CharSpecies <<- sample(SpeciesList, 1)
    }
  AdjustStatsSpecies(CharSpecies)
 }

Attack <- function(Weapon = "Stick", Swings = 1L) {
  for (x in 1:Swings) {
  AttackLog[x] <<- if (RollDice(20, 1, SwingBonus()) >= TargetDummyAC) {
    as.integer(RollDice(4, 1, DamageBonus()))
  } else {
   AttackLog[x] <- 0L
  }
 }
}

CalculateFortitudeSave <- function(ComputedStat) {
  ComputedStatValue[ComputedStat] <<- ComputedStatValue["ConstitutionBonus"]
 }

CalculateInitiative <- function(ComputedStat) {
  ComputedStatValue[ComputedStat] <<- ComputedStatValue["ConstitutionBonus"]
 }

CalculateReflexSave <- function(ComputedStat) {
  ComputedStatValue[ComputedStat] <<- ComputedStatValue["DexterityBonus"]
}

CalculateWillSave <- function(ComputedStat) {
 ComputedStatValue[ComputedStat] <<- ComputedStatValue["WisdomBonus"]
 }

CharGen <- function(Genre = "Fantasy", Game = "DandD", Method = "4d6droplow") {
  GenerateName()
  AssignSpecies()
  GenerateStats(Game, Method)
  AssignClass(RecommendClass())
  ComputeStats(CharStats)
  DisplayChar()
  Attack(Swings = 100)
  DisplayAttackLog()
  SaveChar()
 }

ColorStats <- function() {
 c(for (x in seq_along(StatList)) {
  if (FindMaxStat() == CharStats[x]) {
    ColorList[x] <<- "blue"
    } else
    if (FindMinStat() == CharStats[x]) {
      ColorList[x] <<- "red"
      } else {
       ColorList[x] <<- "black"
       }
     }
   )
}

ComputeBaseStatBonus <- function(CharStat) {
 floor((as.numeric(ReturnStatValue(ReturnStatIndex(CharStat))) / 2) - 5)
}

ComputeOtherStats <- function(ComputedStat) {
  if (ComputedStat == "FortitudeSave")
   CalculateFortitudeSave(ComputedStat)
    else if (ComputedStat == "ReflexSave") CalculateReflexSave(ComputedStat)
     else if (ComputedStat == "WillSave") CalculateWillSave(ComputedStat)
      else if (ComputedStat == "Initiative") CalculateInitiative(ComputedStat)
}

ComputeStat <- function(ComputedStat) {
  if (ComputedStat %in% BaseComputedStatList) {
    ComputedStatValue[ComputedStat] <<- ComputeBaseStatBonus(ComputedStat)
    } else
    if (ComputedStat == "FortitudeSave") {
    CalculateFortitudeSave(ComputedStat)
    } else
    if (ComputedStat == "ReflexSave") {
    CalculateReflexSave(ComputedStat)
    } else {
        ComputeOtherStats(ComputedStat)
      }
}

ComputeStats <- function(CharStats) {
  for (x in seq_along(ComputedStatList)) ComputeStat(unlist(ComputedStatList[x]))
}


DamageBonus <- function() {
ReturnComputedStatValue("StrengthBonus")
}

RollDice <- function(DieSize = 6L, DiceNumber = 1L, Bonus = 0L) {
if (ValidateDieRoll(DieSize, DiceNumber, Bonus) == TRUE) {
  for (x in 1:DiceNumber){
    TotalRolled <- TotalRolled + (sample(1:DieSize, 1))
    }
   TotalRolled + as.numeric(Bonus)
   } else {
    print("Invalid Entry")
  }
}

DisplayAttackLog <- function() {
  barplot(table(unlist(AttackLog[seq_along(AttackLog)])))
}

DisplayChar <- function() {
  print(CharFullName)
OutputSpeciesAndClass()
 DisplayStats()
  print("")
  DisplayComputedStats()
  GraphStats()
}

DisplayComputedStats <- function() {
  for (x in seq_along(ComputedStatList)) {
    ComputeStats()
    print(paste(ComputedStatList[x], ComputedStatValue[x], sep = " "))
  }
}

DisplayStats <- function() {
  for (x in seq_along(StatList)) {
    print(paste(StatList[x], CharStats[x]))
    }
    }

FindMaxStat <- function() {
max(unlist(CharStats))
}

FindNthBestStat <- function() {
maxN <- function(CharStats, N = 5) {
  len <- length(CharStats)
  if (N > len) {
    warning("N greater than length(x).  Setting N=length(x)")
    N <- length(CharStats)
  }
  sort(CharStats, partial = len - N + 1)[len - N + 1]
}
maxN(1:10)
}

FindMinStat <- function() {
min(unlist(CharStats))
}

GenerateName <- function(Genre = "Fantasy") {
CharFullName <<- if (Genre == "Fantasy") {
  gsub("  ", " ", trimws(paste(PickMainTitle("Fantasy"), PickFirstName("Fantasy"), PickNickName("Fantasy"), PickLastName("Fantasy"), PickEndTitle("Fantasy"))), fixed = TRUE)
  }
  return(CharFullName)
}

GenerateSkillMatrix <- function(SkillList) {
}

SkillMatrix <<- matrix(nrow = length(SkillList), ncol = 2)

GenerateSkills <- function(CharStats) {
}

GenerateStats <- function(Game, Method = "3d6") {
  if (Method == "3d6") {
    for (y in seq_along(StatList)) {
      CharStats[y] <<- RollDice(6, 3)
       print(paste(StatList[y], CharStats[y]))
       }
       names(CharStats) <<- StatList
       } else {
  if (Method == "4d6droplow") {
    for (y in seq_along(StatList)){
        for (x in 1:4){
          TempDice[x] <<- RollDice(6, 1)
          }
          TempDice[which.min(TempDice)] <- 0
          CharStats[y] <<- Reduce("+", TempDice)
        }
        }
        }
        names(CharStats) <<- StatList
}

GraphStats <- function() {
  ColorStats()
   barplot(as.numeric(CharStats), names.arg = substr(StatList, 1, 3), col = unlist(ColorList))
}

LoadChar <- function(CharFile) {
  load(CharFile)
  DisplayChar()
}

OutputSpecies <- function() {
  print(trimws(CharSpecies))
  }

OutputSpeciesAndClass <- function() {
 print(paste(CharSpecies, CharClass))
}

PickEndTitle <- function(Genre = "Fantasy") {
  if (Genre == "Fantasy") {
  paste(PickFantasyEndTitle())
  }
}

PickFantasyMainTitle <- function() {
 if (RollDice(10) == 1) {
  return(FantasyMainTitles[(sample(seq_along(FantasyMainTitles), 1))])
 }
}

PickFantasyNickName <- function() {
  if (RollDice(10) == 1) {
    trimws(paste("'", (FantasyNickNames[(sample(seq_along(FantasyNickNames), 1))]), "'", sep = ""))
  }
}

PickFantasyEndTitle <- function() {
  if(RollDice(10) == 1) {
    trimws(paste("'", (FantasyNickNames[(sample(seq_along(FantasyEndTitles), 1))]), "'", sep = ""))
  }
}

PickFirstName <- function(Genre = "Fantasy") {
  FirstNames[sample(length(FirstNames), 1)]
  }

PickLastName <- function(Genre = "Fantasy") {
  LastNames[sample(length(LastNames), 1)]
  }

PickMainTitle <- function(Genre = "Fantasy") {
  if (Genre == "Fantasy") {
    paste(PickFantasyMainTitle())
    }
  }

PickNickName <- function(Genre = "Fantasy") {
  if (Genre == "Fantasy") {
  paste(PickFantasyNickName())
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


RemoveStatsSpecies <- function(CharSpecies = "Human") {
if (CharSpecies == "Dwarf") {
  AddSpeciesBonus("Constitution", -2)
  AddSpeciesBonus("Wisdom", -2)
  AddSpeciesBonus("Charisma", 2)
}
  if (CharSpecies == "Elf") {
   AddSpeciesBonus("Dexterity", -2)
   AddSpeciesBonus("Intelligence", -2)
   AddSpeciesBonus("Constitution", 2)
  }
  if (CharSpecies == "Gnome") {
   AddSpeciesBonus("Constitution", -2)
   AddSpeciesBonus("Charisma", -2)
   AddSpeciesBonus("Strength", 2)
  }
  if (CharSpecies == "Half-Elf") {
   AddSpeciesBonus(StatList[which.max(CharStats)], -2)
  }
  if (CharSpecies == "Half-Orc") {
    AddSpeciesBonus(StatList[which.max(CharStats)], -2)
  }
  if (CharSpecies == "Halfling") {
    AddSpeciesBonus("Dexterity", -2)
    AddSpeciesBonus("Charisma", -2)
    AddSpeciesBonus("Strength", 2)
  }
  if (CharSpecies == "Human") {
  AddSpeciesBonus(StatList[which.max(CharStats)], -2)
   }
  }

ReturnComputedStatIndex <- function(ComputedStat) {
   which(ComputedStatList == ComputedStat)
}

ReturnComputedStatValue <- function(ComputedStat) {
  ComputedStatValue[which(ComputedStatList == ComputedStat)]
}

ReturnComputedStatDescription <- function(ComputedStat) {
return(ComputedStatList[which(ComputedStatList == ComputedStat)])
}

ReturnStatDescription <- function(StatIndex) {
  return(StatList[StatIndex])
}

ReturnStatIndex <- function(StatToIndex) {
  which(StatToIndex == ComputedStatList)
}

ReturnStatValue <- function(StatIndex) {
  return(CharStats[StatIndex])
}
SaveChar <- function() {
  save(CharacterData, file = paste(CharFullName, ".rds", sep = ""))
  }
StatColors <- function(CharStats, MaxStats) {
  MaxStats <<- max(unlist(CharStats))
}
SwapStats <- function(FirstStat, SecondStat) {
if (ValidateStatSwap(FirstStat, SecondStat)) {
  replace(CharStats, c(ReturnStatIndex(FirstStat), ReturnStatIndex(SecondStat)), CharStats <<- CharStats[c(ReturnStatIndex(SecondStat), ReturnStatIndex(FirstStat))])
  DisplayChar()
  RecommendClass(CharStats)
}
}
SwingBonus <- function() {
  ReturnComputedStatValue("StrengthBonus")
}
ValidateDieRoll <- function(DieSize, DiceNumber, Bonus) {
  if (DieSize %in% ValidDieSize && DiceNumber >= 1L && Bonus == as.integer(Bonus)) {
    return(TRUE)
    } else {
      return(FALSE)
      }
}
ValidateStatSwap <- function(FirstStat, SecondStat) {
  if (FirstStat == SecondStat || !(FirstStat %in% StatList) || !(SecondStat %in% StatList)) {
    FALSE
    } else {
      TRUE
      }
 }
StatList <<- list("Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma")
ValidDieSize <- list(4L, 6L, 8L, 10L, 12L, 20L, 100L)
SpeciesList <<- list("Human", "Dwarf", "Elf", "Human", "Gnome", "Half-Orc", "Half-Elf")
ComputedStatList <- list("StrengthBonus", "DexterityBonus", "ConstitutionBonus", "IntelligenceBonus", "WisdomBonus", "CharismaBonus", "FortitudeSave", "ReflexSave", "WillSave", "Initiative", "BaseAttackBonus")
BaseComputedStatList <- list("StrengthBonus", "DexterityBonus", "ConstitutionBonus", "IntelligenceBonus", "WisdomBonus", "CharismaBonus")
ClassList <- list("Barbarian", "Bard", "Cleric", "Druid", "Fighter", "Monk", "Paladin", "Ranger", "Rogue", "Sorceror", "Wizard")
FantasyEndTitles <- list("of the Mirkwood", ", Mother of Dragons", "The Bootlicker", ", Maimer of Men", "The Pyromancer", ", King of the Wild Frontier")
FantasyMainTitles <- list("King", "Queen", "Lord", "Lady", "Huntress", "Duke", "Duchess", "Prince", "Princess")
FantasyNickNames <- list("Kit", "Strider", "The Defenestrator", "Bork", "Elvenfriend", "Silverhair", "Barkeep")
FirstNames <- list("Gwendolyn", "Echnoid", "Maydela", "Starla", "Pearl", "Mirella", "Raspberry", "FireSika", "Janet", "Jennifer", "Nico", "Barbara", "Carol", "Molly", "Diana")
LastNames <- list("Young", "of the House of Elrond", "Borogrove", "Symmetry", "Blue", "Celeste", "Agbayani", "Holman", "Van Dyne", "Walters", "Minoru", "Gordon",  "Danvers", "Hayes", "Prince")
CharStats <- list(0L, 0L, 0L, 0L, 0L, 0L)
ColorList <- list("", "", "", "", "", "")
TargetDummyAC <- 10L
TempDice <- 0L
TotalRolled <- 0L
ComputedStatValue <- 0L
CharClass <- "Monk"
AttackLog <- list(0, 0)
CharacterData <- list("CharFullName", "CharStats", "ComputedStatValue")