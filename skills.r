AddSkillPoints <<- function(CharClass) {
 UnusedSkillPoints <<- ComputedStatValue$IntelligenceBonus + BaseSkillPoints[[CharClass]]
 if (CharSpecies == "Human") {
 UnusedSkillPoints <<- UnusedSkillPoints +1
 }
}

OutputSkillListToCSV <- function() {
  write.table(unlist(SkillList)
  , file = "data\\SkillList.csv"
  , row.names = FALSE
  , col.names = FALSE)
}

InputSkillListFromCSV <- function() {
  SkillList <<- length(1024)
  SkillList <<- unlist(read.csv(file = "data\\SkillList.csv", header = FALSE))
}

DisplaySkills <-function() {
    print(paste("Unused Skill Points:", UnusedSkillPoints))
}