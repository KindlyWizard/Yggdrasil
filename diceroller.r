RollDice <- function(DieSize = 6L, DiceNumber = 1L, Bonus = 0L) {
if (ValidateDieRoll(DieSize, DiceNumber, Bonus) == TRUE) {
  for (x in 1:DiceNumber){
    TotalRolled <- TotalRolled + (sample(1:DieSize, 1))
    }
   TotalRolled + as.numeric(Bonus)
   } else {
    print("Invalid Entry")
  }
}

ValidateDieRoll <- function(DieSize, DiceNumber, Bonus = 0L) {
  if (
    DieSize %in% ValidDieSize && DiceNumber >= 1L && Bonus == as.integer(Bonus)
    ) {
    return(TRUE)
    } else {
      return(FALSE)
      }
}