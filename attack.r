Attack <- function(Weapon = "Stick", Swings = 1L) {
  for (x in 1:Swings) {
  AttackLog[x] <<- if (RollDice(20, 1, SwingBonus()) >= TargetDummyAC) {
    as.integer(RollDice(4, 1, DamageBonus()))
  } else {
   AttackLog[x] <- 0L
  }
 }
}

DisplayAttackLog <- function() {
  barplot(table(unlist(AttackLog[seq_along(AttackLog)])))
}

SwingBonus <- function() {
  ComputedStatValue$BaseAttackBonus
}