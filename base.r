InitializeData <- function() {
ValidDieSize <- list(4L, 6L, 8L, 10L, 12L, 20L, 100L)
CharStats <- list(0L, 0L, 0L, 0L, 0L, 0L)
ColorList <- list("", "", "", "", "", "")
TargetDummyAC <- 10L
TempDice <- 0L
TotalRolled <- 0L
CharClass <- "Monk"
AttackLog <- list(0, 0)
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
BaseSkillPoints <- list(4, 6, 2, 4, 2, 4, 2, 6, 8, 2, 2)
names(BaseSkillPoints) <- ClassList
CharSkills <<- list(0L)
CharFeats <<- list(0L)
UnassignedFeatPoints <<- 0L
StartingWealthList <<- list(3, 3, 4, 2, 5, 1, 5, 5, 4, 2, 2)
names(StartingWealthList) <- ClassList
CharMoney <<- 0L
CharStatHook <<- NULL
CharDescription <<- NULL
ClassList <<- list("")
ClassMatrix <<- matrix()
}

source("loaddata.r")
LoadAllCSVs()
InitializeData()
source("names.r")
source("classes.r")
source("species.r")
source("output.r")
source("basestats.r")
source("computedstats.r")
source("attack.r")
source("defaults.r")
source("diceroller.r")
source("skills.r")
source("feats.r")
source("vitalstats.r")
source("money.r")
source("description.r")
source("AIDescription.r")
InitializeData()


ClassHitDice <<- list(c(12L, 8L, 8L, 8L, 10L, 8L, 10L, 10L, 8L, 6L, 6L))

AddHitDie <<- function(CharClass) {
  HitPoints <<- AddClassHitDie(CharClass) + ComputedStatValue$ConstitutionBonus
}

ClearData <-function() {
  UnassignedFeatPoints <<- 0L
}

CharGen <- function(Genre = "Fantasy", Game = "DandD", Method = "4d6droplow") {
  ClearData()
  GenerateName()
  AssignSpecies()
  GenerateStats(Game, Method)
  CharClass <<- RecommendClass()
  ComputeStats(CharStats)
  AssignClass(CharClass)
  AddSkillPoints(CharClass)
  AddFeatPoints()
  AssignVitalStats(CharSpecies, CharClass)
  GenerateWealth(CharClass)
  FindDescriptionHooks(CharSpecies, CharClass, CharStats, ComputedStatValue)
  #GenerateAIDescription(CharSpecies, CharClass, CharFullName)
  DisplayChar()
  Attack(Swings = 100)
  #DisplayAttackLog()
  #SaveChar()
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

# LoadSkillsFromCSV <- function() {
#}

#GenerateSkills <- function(CharStats) {
#}

LoadChar <- function(CharFile) {
  load(CharFile)
  DisplayChar()
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

OutputData <- function() {
OutputFirstNamesToCSV()
OutputLastNamesToCSV()
OutputFantasyNickNamesToCSV()
OutputMainTitlesToCSV()
OutputEndTitlesToCSV()
OutputSkillListToCSV()
OutputFeatListToCSV()
}