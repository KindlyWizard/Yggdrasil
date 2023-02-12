GenerateWealth <- function(CharClass) {
    CharMoney <<- RollDice(6, StartingWealthList[[CharClass]]) * 100000
}

GenerateMoneyString <- function(CharMoney, CharMainTitle, FirstName) {
    trimws(paste(CharMainTitle
    , CharFirstName
    , "has"
    , as.character(CharMoney / 10000)
    , "gold,"
    , as.character(0)
    , "silver, and"
    , as.character(0)
    , "copper"))
}