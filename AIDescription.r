InitializeGPT <-function() { 
  library(rgpt3)
  gpt3_authenticatesilent("access_key.txt")
}

gpt3_authenticatesilent <-function(path) {
      apikey_ = readLines(path)
    api_key <<- apikey_
}

InitializeGPT()

GenerateAIDescription <- function(CharSpecies, CharClass, CharFullName) {
 GPTCharDescription <<- gpt3_single_completion(paste("Make up a 4-paragraph backstory for a"
 , CharSpecies
 , CharClass
 , "named"
 , CharFullName
 , "including history, physical description, and up to 3 additional characters.")
 , max_tokens = 500)
 GPTCharDescription[-2]
 CharDescription <<- gsub("\n", "", GPTCharDescription[1])
 CharDescription <<- trimws(CharDescription[1])
}