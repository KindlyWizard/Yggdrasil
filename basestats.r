GenerateStats <- function(Game, Method = "3d6") {
  if (Method == "3d6") {
    for (y in seq_along(StatList)) {
      CharStats[y] <<- RollDice(6, 3)
       print(paste(StatList[y], CharStats[y]))
       }
       names(CharStats) <<- StatList
       } else
  if (Method == "4d6droplow") {
    for (y in seq_along(StatList)){
        for (x in 1:4){
          TempDice[x] <- RollDice(6, 1)
          }
          TempDice[which.min(TempDice)] <- 0
          CharStats[y] <<- Reduce("+", TempDice)
        }
        } else {
           if (Method == "PointBuy") {
            for (x in seq_along(StatList)) {
              CharStats[x]  <- 12L
            }
           }
        }
        names(CharStats) <<- StatList
}

ValidateStatSwap <- function(FirstStat, SecondStat) {
  if (FirstStat == SecondStat
   || !(FirstStat %in% StatList)
   || !(SecondStat %in% StatList)) {
    FALSE
    } else {
      TRUE
      }
 }

 SwapStats <- function(FirstStat, SecondStat) {
if (ValidateStatSwap(FirstStat, SecondStat)) {
  replace(CharStats
  , c(ReturnStatIndex(FirstStat)
  , ReturnStatIndex(SecondStat))
  , CharStats <<- CharStats[c(ReturnStatIndex(SecondStat)
  , ReturnStatIndex(FirstStat))])
  DisplayChar()
  RecommendClass(CharStats)
}
 }

GenerateBaseStatList <<- function() {
 StatList <<- unlist(read.csv(file = "data\\BaseStats.csv", header = FALSE))
 }
