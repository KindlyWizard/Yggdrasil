ColorStats <- function() {
 c(for (x in seq_along(StatList)) {
  if (FindMaxStat() == CharStats[x]) {
    ColorList[x] <<- "blue"
    } else
    if (FindMinStat() == CharStats[x]) {
      ColorList[x] <<- "red"
      } else {
       ColorList[x] <<- "black"
       }
     }
   )
}

DisplayChar <- function() {
  print(CharFullName)
OutputSpeciesAndClass()
 DisplayStats()
  print(paste("HP:", HitPoints, sep = " "))
  DisplayComputedStats()
  #GraphStats()
  DisplaySkills()
  DisplayFeats()
}

OutputSpecies <- function() {
  print(trimws(CharSpecies))
  }

OutputSpeciesAndClass <- function() {
 print(paste(CharSpecies, CharClass))
}

GraphStats <- function() {
  ColorStats()
   barplot(as.numeric(CharStats)
   , names.arg = substr(StatList, 1, 3)
   , col = unlist(ColorList))
}

StatColors <- function(CharStats, MaxStats) {
  MaxStats <<- max(unlist(CharStats))
}
