StatList <<- list("Strength"
, "Dexterity"
, "Constitution"
, "Intelligence"
, "Wisdom"
, "Charisma")
ValidDieSize <- list(4L, 6L, 8L, 10L, 12L, 20L, 100L)
SpeciesList <<- list("Human"
, "Dwarf"
, "Elf"
, "Human"
, "Gnome"
, "Half-Orc"
, "Half-Elf")
ComputedStatList <- list("StrengthBonus"
, "DexterityBonus"
, "ConstitutionBonus"
, "IntelligenceBonus"
, "WisdomBonus"
, "CharismaBonus"
, "FortitudeSave"
, "ReflexSave"
, "WillSave"
, "InitiativeBonus"
, "BaseAttackBonus")
BaseComputedStatList <- list("StrengthBonus"
, "DexterityBonus"
, "ConstitutionBonus"
, "IntelligenceBonus"
, "WisdomBonus"
, "CharismaBonus")
ClassList <- list("Barbarian"
, "Bard"
, "Cleric"
, "Druid"
, "Fighter"
, "Monk"
, "Paladin"
, "Ranger"
, "Rogue"
, "Sorceror"
, "Wizard")
CharStats <- list(0L, 0L, 0L, 0L, 0L, 0L)
ColorList <- list("", "", "", "", "", "")
TargetDummyAC <- 10L
TempDice <- 0L
TotalRolled <- 0L
CharClass <- "Monk"
AttackLog <- list(0, 0)
CharacterData <- list("CharFullName", "CharStats", "ComputedStatValue")
ComputedStatValue <<- list(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
HitPoints <- 0L
CharacterLevel <- 1L
UnusedSkillPoints <- 0L
CharSpecies <- "Human"
CharFullName <- "Jane Doe"
NameComponents <<- c("FantasyMainTitles" = FantasyMainTitles
, "FirstNames" = FirstNames
, "FantasyNickNames" = FantasyNickNames
, "LastNames" = LastNames
, "FantasyEndTitles" = FantasyEndTitles)
FirstNames <- NULL
LastNames <- NULL
FantasyEndTitles <- NULL
FantasyNickNames <- NULL
FantasyMainTitles <- NULL
BaseSkillPoints <- list(4, 6, 2, 4, 2, 4, 2, 6, 8, 2, 2)
names(BaseSkillPoints) <- ClassList