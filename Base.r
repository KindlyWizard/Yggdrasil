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



#ClassHitDice <<- list(c(12L, 8L, 8L, 8L, 10L, 8L, 10L, 10L, 8L, 6L, 6L))
#names(ClassHitDice) <<- list(ClassList)

AddHitDie <<- function(CharClass) {
  HitPoints <<- AddClassHitDie(CharClass) + ComputedStatValue$ConstitutionBonus
}

CharGen <- function(Genre = "Fantasy", Game = "DandD", Method = "4d6droplow") {
  GenerateName()
  AssignSpecies()
  GenerateStats(Game, Method)
  CharClass <<- RecommendClass()
  ComputeStats(CharStats)
  AssignClass(CharClass)
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

LoadSkillsFromCSV <- function() {

}

GenerateSkills <- function(CharStats) {
}

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