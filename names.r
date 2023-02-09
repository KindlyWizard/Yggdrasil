InitializeData <- function() {
  InputFirstNamesFromCSV()
  InputLastNamesFromCSV()
  InputFantasyNickNamesFromCSV()
  InputMainTitlesFromCSV()
  InputEndTitlesFromCSV()
}

OutputData <- function() {
OutputFirstNamesToCSV()
OutputLastNamesToCSV()
OutputFantasyNickNamesToCSV()
OutputMainTitlesToCSV()
OutputEndTitlesToCSV()
}

InitializeData2 <- function() {
  NameComponents <<- matrix(length)
  NameComponents <<- read.csv(file = "data\\NameLists.csv")
}

OutputData2 <- function() {
  write.table(NameComponents
  , file = "data\\NameLists.csv"
  , row.names = FALSE
  , col.names = FALSE)
}


GenerateName <- function(Genre = "Fantasy") {
CharFullName <<- if (Genre == "Fantasy") {
  gsub("  ", " ", trimws(paste(PickMainTitle("Fantasy")
  , PickFirstName("Fantasy")
  , PickNickName("Fantasy")
  , PickLastName("Fantasy")
  , PickEndTitle("Fantasy"))), fixed = TRUE)
  }
  return(CharFullName)
}

OutputMainTitlesToCSV <- function() {
  write.table(unlist(FantasyMainTitles)
  , file = "data\\FantasyMainTitles.csv"
  , row.names = FALSE
  , col.names = FALSE)
}

InputMainTitlesFromCSV <- function() {
  FantasyMainTitles <<- length(1024)
  FantasyMainTitles <<- list(read.csv(file = "data\\FantasyMainTitles.csv", header = FALSE))
}

OutputEndTitlesToCSV <- function() {
  write.table(unlist(FantasyEndTitles)
  , file = "data\\FantasyEndTitles.csv"
  , row.names = FALSE
  , col.names = FALSE)
}

InputEndTitlesFromCSV <- function() {
  FantasyEndTitles <<- length(1024)
  FantasyEndTitles <<- list(read.csv(file = "data\\FantasyEndTitles.csv", header = FALSE))
}

OutputFantasyNickNamesToCSV <- function() {
  write.table(unlist(FantasyNickNames)
  , file = "data\\FantasyNickNames.csv"
  , row.names = FALSE
  , col.names = FALSE)
}

InputFantasyNickNamesFromCSV <- function() {
  FantasyNickNames <<- length(1024)
  FantasyNickNames <<- list(read.csv(file = "data\\FantasyNickNames.csv", header = FALSE))
}

OutputFirstNamesToCSV <- function() {
  write.table(unlist(FirstNames)
  , file = "data\\FirstNames.csv"
  , row.names = FALSE
  , col.names = FALSE)
}

InputFirstNamesFromCSV <- function() {
  FirstNames <<- length(1024)
  FirstNames <<- list(read.csv(file = "data\\FirstNames.csv", header = FALSE))
}

OutputLastNamesToCSV <- function() {
  write.table(unlist(LastNames)
  , file = "data\\LastNames.csv"
  , row.names = FALSE
  , col.names = FALSE)
}

InputLastNamesFromCSV <- function() {
  LastNames <<- list(read.csv(file = "data\\LastNames.csv", header = FALSE))
  length(LastNames) <- 1024
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
    trimws(paste("'"
    , (FantasyNickNames[(sample(seq_along(FantasyNickNames), 1))])
    , "'"
    , sep = ""))
  }
}

PickFantasyEndTitle <- function() {
  if (RollDice(10) == 1) {
    trimws(paste("'"
    , (FantasyEndTitles[(sample(seq_along(FantasyEndTitles), 1))])
    , "'"
    , sep = ""))
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