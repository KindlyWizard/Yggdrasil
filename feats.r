InputFeatListFromCSV <- function() {
  FeatList <<- length(1024)
  FeatList <<- unlist(read.csv(file = "data\\FeatList.csv", header = FALSE))
}

OutputFeatListToCSV <- function() {
  write.table(unlist(FeatList)
  , file = "data\\FeatList.csv"
  , row.names = FALSE
  , col.names = FALSE)
}

DisplayFeats <-function() {
    print(CharFeats)
    print(paste("Unassigned Feats:", UnassignedFeatPoints))
}

AssignFeat <<- function(Feat) {
  if (UnassignedFeatPoints > 0) {
UnassignedFeatPoints <<- UnassignedFeatPoints - 1
CharFeats[[Feat]] <<- 1
  } else {
    print("No unassigned feats!")
  }
}

UnassignFeat <<- function(Feat) {
  CharFeats[[Feat]] <<- 0
  UnassignedFeatPoints <<- UnassignedFeatPoints + 1
}

AddFeatPoints <<-function() {
  UnassignedFeatPoints <<- UnassignedFeatPoints + 1
  if (CharSpecies == "Human") {
    UnassignedFeatPoints <<- UnassignedFeatPoints + 1
  }
  if (CharClass == "Fighter") {
    UnassignedFeatPoints <<- UnassignedFeatPoints +1
  }
}

DisplayFeats <-function() {
    for (x in seq_along(CharFeats)) {
        if (CharFeats[x] > 0) {
            print(CharFeats[x])
        }
    }
    print(paste("Unused Feats:", UnassignedFeatPoints))
}

RecommendFeats <- function() {

}