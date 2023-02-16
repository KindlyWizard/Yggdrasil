AddSkillPoints <<- function(CharClass) {
 UnusedSkillPoints <<- ComputedStatValue$IntelligenceBonus + BaseSkillPoints[[CharClass]]
 if (CharSpecies == "Human") {
 UnusedSkillPoints <<- UnusedSkillPoints + 1
 }
 #AssignCharSkills()
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
    if (as.numeric(CharSkills[[SelectedSkill]]) > 0) {
    UnusedSkillPoints <<- UnusedSkillPoints + 1
    CharSkills[[SelectedSkill]] <<- as.numeric(CharSkills[[SelectedSkill]]) - 1
    } else {
        print("Error: No Skill Points Remaining In Skill")
    }
}

AssignCharSkills <<-function() {
    for (x in seq_along(SkillMatrix["Skill"])) {
        #list(CharSkills) <<- c(CharSkills, SkillMatrix[x])
        }
    names(CharSkills) <<- SkillList
}

OutputSkillListToCSV <- function() {
  write.table(unlist(SkillList)
  , file = "data\\SkillList.csv"
  , row.names = FALSE
  , col.names = FALSE)
}

DisplaySkills <-function() {
    for (x in seq_along(CharSkills)) {
        if (CharSkills[x] > 0) {
            print(CharSkills[x])
        }
    }
    print(paste("Unused Skill Points:", UnusedSkillPoints))
}

RecommendSkills <- function(CharSkills, CharClassSkills) {
#sample(CharClassSkills, UnusedSkillPoints)
}

GenerateSkillListFromMatrix <-function() {

}

AssignSkillPoint <-function() {

}