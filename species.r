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

AssignSpecies <- function(Game = "DandD") {
  if (Game == "DandD") {
    CharSpecies <<- sample(SpeciesList, 1)
    }
  AdjustStatsSpecies(CharSpecies)
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
