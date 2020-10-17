# Load required packages
library(superNetballR)
library(tidyverse)
library(ggdark)
# First, create an empty data.frame for the season
# SSN_2020 <- FirebirdsVixens[0,]
SeasonID = 11108
# Set the number of rounds in the season
numRounds = 14
getRound = 1

SS_Round <- data.frame(Doubles=double(),
                        Ints=integer(),
                        Factors=factor(),
                        Logicals=logical(),
                        Characters=character(),
                        stringsAsFactors=FALSE)
SS_Attempt_By_Round_2020 <- data.frame(Doubles=double(),
                                        Ints=integer(),
                                        Factors=factor(),
                                        Logicals=logical(),
                                        Characters=character(),
                                        stringsAsFactors=FALSE)
# Loop for the number of rounds in the season
while (getRound <= numRounds) {
    # Run a loop to grab data for the round
    for (mm in 1:4) {
        # Download match
        matchData <- downloadMatch(SeasonID,getRound,mm)
        # Tidy data
        tidy_match <- tidyMatch(matchData)
        supershot <- tidy_match %>% filter(stat=="attempt_from_zone2") %>% group_by(squadName) %>% summarise(total = sum(value),round) %>% distinct()
        supershot <- data.frame(supershot)
        # Append
        SS_Round <- rbind(SS_Round,supershot)
    }
    getRound <- getRound + 1
    SS_Attempt_By_Round_2020 <- rbind(SS_Attempt_By_Round_2020,SS_Round)
}