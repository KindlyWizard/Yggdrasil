AddSkillPoints <<- function(CharClass) {
 UnusedSkillPoints <<- ComputedStatValue$IntelligenceBonus + BaseSkillPoints[[CharClass]]
 if (CharSpecies == "Human") {
 UnusedSkillPoints <<- UnusedSkillPoints + 1
 }
 AssignCharSkills()
}

AddSkillPoint <<- function(SelectedSkill) {
    if (UnusedSkillPoints > 0) {
    UnusedSkillPoints <<- UnusedSkillPoints - 1
    CharSkills[[SelectedSkill]] <<- as.numeric(CharSkills[[SelectedSkill]]) + 1
    } else {
        print("Error: No Unspent Skill Points Remaining")
    }
}

RemoveSkillPoints <<- function(SelectedSkill) {
    if (CharSkills[[SelectedSkill]] > 0) {
    UnusedSkillPoints <<- UnusedSkillPoints + 1
    CharSkills[[SelectedSkill]] <<- as.numeric(CharSkills[[SelectedSkill]]) - 1
    } else {
        print("Error: No Skill Points Remaining In Skill")
    }
}

AssignCharSkills <<-function() {
    for (x in seq_along(SkillList)) {CharSkills[x]<-0L}
    names(CharSkills) <<- SkillList
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
    print(CharSkills)
    print(paste("Unused Skill Points:", UnusedSkillPoints))
}