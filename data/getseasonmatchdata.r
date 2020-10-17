# Load required packages
library(superNetballR)
library(tidyverse)
library(ggdark)
# Enter the season ID
SeasonID = 11108
# Set the number of rounds in the season
numRounds = 14
# Init the getRound counter
getRound = 1
# Create an empty data.frame for the season and round
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
  # Run a loop to grab data for all the games in the round
  for (mm in 1:4) {
    # Download match
    matchData <- downloadMatch(SeasonID,getRound,mm)
    # Tidy data
    tidy_match <- tidyMatch(matchData)
    # Append
    SSN_Round <- rbind(tidy_match,SSN_Round)
  }
  # Increment the counter
  getRound <- getRound + 1
  # Append round data to the season
  SSN_2020 <- rbind(SSN_2020,SSN_Round)
}
# Inspect the data
tail(SSN_2020, 12)