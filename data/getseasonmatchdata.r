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

SSN_Round <- data.frame(Doubles=double(),
                           Ints=integer(),
                           Factors=factor(),
                           Logicals=logical(),
                           Characters=character(),
                           stringsAsFactors=FALSE)
SSN_2020 <- data.frame(Doubles=double(),
                             Ints=integer(),
                             Factors=factor(),
                             Logicals=logical(),
                             Characters=character(),
                             stringsAsFactors=FALSE)
# Loop for the number of rounds in the season
while (getRound <= numRounds) {
  # Run a loop to grab data for the round
  for (mm in 1:4) {
    # First, create an empty data.frame for the round
#    SSN_Round <- FirebirdsVixens[0,]
    # Download match
    matchData <- downloadMatch(SeasonID,getRound,mm)
    # Tidy data
    tidy_match <- tidyMatch(matchData)
    # Append
    SSN_Round <- rbind(tidy_match,SSN_Round)
  }
  getRound <- getRound + 1
  SSN_2020 <- rbind(SSN_2020,SSN_Round)
}
# Inspect
tail(SSN_2020, 12)