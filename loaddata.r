LoadAllCSVs <-function() {
    InputBaseStatsFromCSV()
    InputSpeciesListFromCSV()
    InputClassListFromCSV()
    InputBaseComputedStatListFromCSV()
    InputSkillListFromCSV()
    InputSkillMatrixFromCSV()
    InputFeatListFromCSV()
    InputFirstNamesFromCSV()
    InputLastNamesFromCSV()
    InputFantasyFirstNamesFromCSV()
    InputFantasyLastNamesFromCSV()
    InputFantasyNickNamesFromCSV()
    InputMainTitlesFromCSV()
    InputEndTitlesFromCSV()
    InputDescriptionMatrixFromCSV()
    InputCharacterDataFromCSV()
    InputBaseStatsMatrixFromCSV()
    }

InputSpecifiedCSV <- function(modulecsv, headers) { #does not work yet, do not use
 modulecsv <<- unlist(read.csv(file = paste("data\\", Module, ".csv", sep = "", header = headers)))
}

InputDescriptionMatrixFromCSV <- function() {
  DescriptionMatrix <<- unlist(read.csv(file = "data\\DescriptionMatrix.csv", header = FALSE))  
}

InputCharacterDataFromCSV <- function() {
  CharacterData <<- unlist(read.csv(file = "data\\CharacterData.csv", header = FALSE))  
}

InputBaseStatsMatrixFromCSV <- function() {
  BaseStatsMatrix <<- unlist(read.csv(file = "data\\BaseStatsMatrix.csv", header = FALSE))  
}

InputFantasyLastNamesFromCSV <- function() {
  FantasyLastNames <<- unlist(read.csv(file = "data\\FantasyLastNames.csv", header = FALSE))
}

InputFantasyNickNamesFromCSV <- function() {
  FantasyNickNames <<- unlist(read.csv(file = "data\\FantasyNickNames.csv", header = FALSE))
}

InputFirstNamesFromCSV <- function() {
  FirstNames <<- unlist(read.csv(file = "data\\FirstNames.csv", header = FALSE))
}

InputLastNamesFromCSV <- function() {
  LastNames <<- unlist(read.csv(file = "data\\LastNames.csv", header = FALSE))
}

InputFantasyFirstNamesFromCSV <- function() {
  FantasyFirstNames <<- unlist(read.csv(file = "data\\FantasyFirstNames.csv", header = FALSE))
}

InputMainTitlesFromCSV <- function() {
  FantasyMainTitles <<- unlist(read.csv(file = "data\\FantasyMainTitles.csv", header = FALSE))
}

InputEndTitlesFromCSV <- function() {
  FantasyEndTitles <<- unlist(read.csv(file = "data\\FantasyEndTitles.csv", header = FALSE))
}

InputBaseStatsFromCSV <- function() {
    BaseStats <<- unlist(read.csv(file = "data\\BaseStats.csv", header = FALSE))
}

InputSpeciesListFromCSV <- function() {
    SpeciesList <<- unlist(read.csv(file = "data\\SpeciesList.csv", header = FALSE))
}

InputClassListFromCSV <- function() {
    ClassList <<- unlist(read.csv(file = "data\\ClassList.csv", header = FALSE))
}

InputComputedStatListFromCSV <- function() {
    ComputedStatList <<- unlist(read.csv(file = "data\\ComputedStatList.csv", header = FALSE))
}

InputBaseComputedStatListFromCSV <- function() {
    BaseComputedStatList <<- unlist(read.csv(file = "data\\BaseComputedStatList.csv", header = FALSE))
}

InputSkillListFromCSV <- function() {
    SkillList <<- unlist(read.csv(file = "data\\SkillList.csv", header = FALSE))
}

InputSkillMatrixFromCSV <- function() {
      SkillMatrix <<- read.csv(file = "data\\SkillMatrix.csv", row.names = 1)
}

InputFeatListFromCSV <- function() {
    FeatList <<- unlist(read.csv(file = "data\\FeatList.csv", header = FALSE))
}