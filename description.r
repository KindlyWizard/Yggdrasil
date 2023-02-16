

FindDescriptionHooks <- function(CharSpecies, CharClass, CharStats, ComputedStatValue) {
 if (CharSpecies == "Human") {
CharacterHooks <<- AddHook(CharSpecies)
 }
}

AddHook <<- function(CharSpecies) {
}

AddCharStatHook <<- function(Stat, SelectedBackgroundNumber) {
    CharDescription[SelectedBackgroundNumber] <<- CharStatHooks[[Stat]][[SelectedBackgroundNumber]]
}

InputCharStatHooksFromCSV <<- function() {
    CharStatHooks <<- (read.csv(file = "data\\DescriptionMatrix.csv"))
}