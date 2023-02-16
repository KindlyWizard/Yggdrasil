StatList2 <<- 
ValidDieSize <- list(4L, 6L, 8L, 10L, 12L, 20L, 100L)
#SpeciesList <<- list("Human"
#, "Dwarf"
#, "Elf"
#, "Human"
#, "Gnome"
#, "Half-Orc"
#, "Half-Elf")
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
BaseSkillPoints <<- list("")
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
FirstNames <<- NULL
FantasyFirstNames <<- NULL
LastNames <<- NULL
FantasyEndTitles <<- NULL
FantasyNickNames <<- NULL
FantasyMainTitles <<- NULL
NameComponents <<- c("FantasyMainTitles" = FantasyMainTitles
, "FirstNames" = FirstNames
, "FantasyNickNames" = FantasyNickNames
, "LastNames" = LastNames
, "FantasyEndTitles" = FantasyEndTitles)
names(BaseSkillPoints) <- ClassList
CharSkills <<- list(0L)
CharFeats <<- list(0L)
UnassignedFeatPoints <<- 0L
names(StartingWealthList) <- ClassList
CharMoney <<- 0L
CharStatHook <<- NULL
CharDescription <<- NULL