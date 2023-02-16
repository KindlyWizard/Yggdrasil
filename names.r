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


InitializeData <- function() {
  InputFirstNamesFromCSV()
  InputLastNamesFromCSV()
  InputFantasyNickNamesFromCSV()
  InputMainTitlesFromCSV()
  InputEndTitlesFromCSV()
  InputFantasyFirstNamesFromCSV()
  InputFantasyLastNamesFromCSV()
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

OutputEndTitlesToCSV <- function() {
  write.table(unlist(FantasyEndTitles)
  , file = "data\\FantasyEndTitles.csv"
  , row.names = FALSE
  , col.names = FALSE)
}

OutputFantasyNickNamesToCSV <- function() {
  write.table(unlist(FantasyNickNames)
  , file = "data\\FantasyNickNames.csv"
  , row.names = FALSE
  , col.names = FALSE)
}

OutputFantasyLastNamesToCSV <- function() {
  write.table(unlist(FantasyLastNames)
  , file = "data\\FantasyLastNames.csv"
  , row.names = FALSE
  , col.names = FALSE)
}

OutputFirstNamesToCSV <- function() {
  write.table(unlist(FirstNames)
  , file = "data\\FirstNames.csv"
  , row.names = FALSE
  , col.names = FALSE)
}

OutputLastNamesToCSV <- function() {
  write.table(unlist(LastNames)
  , file = "data\\LastNames.csv"
  , row.names = FALSE
  , col.names = FALSE)
}

PickFantasyFirstName <- function() {
  CharFirstName <<- FantasyFirstNames[(sample(seq_along(FantasyFirstNames), 1))]
  return(CharFirstName)
}

PickFantasyLastName <- function() {
  CharLastName <<- FantasyLastNames[(sample(seq_along(FantasyLastNames), 1))]
  return(CharLastName)
}

PickEndTitle <- function(Genre = "Fantasy") {
  if (Genre == "Fantasy") {
  paste(PickFantasyEndTitle())
  }
}

PickFantasyMainTitle <- function(CharMainTitle = "") {
 if (RollDice(10) == 1) {
  CharMainTitle <<- FantasyMainTitles[(sample(seq_along(FantasyMainTitles), 1))]
 } else {
  CharMainTitle <<- NULL
 }
 return(CharMainTitle)
}

PickFantasyNickName <- function() {
  if (RollDice(10) == 1) {
    CharNickName <<- trimws(paste("'"
    , (FantasyNickNames[(sample(seq_along(FantasyNickNames), 1))])
    , "'"
    , sep = ""))
  return(CharNickName)
  }
}

PickFantasyEndTitle <- function() {
  if (RollDice(10) == 1) {
    CharEndTitle <<- trimws(paste("'"
    , (FantasyEndTitles[(sample(seq_along(FantasyEndTitles), 1))])
    , "'"
    , sep = ""))
    return(CharEndTitle)
  }
}

PickFirstName <- function(Genre = "Fantasy") {
if (Genre == "Fantasy")   {
  paste(PickFantasyFirstName())
  }
}

PickLastName <- function(Genre = "Fantasy") {
  if (Genre == "Fantasy")   {
  paste(PickFantasyLastName())
  }
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

