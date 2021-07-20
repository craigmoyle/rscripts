# Load required packages
library(superNetballR)
library(tidyverse)
library(ggdark)
# Enter the season ID
SeasonID = 11391
# Set the number of rounds in the season
numRounds = 10
# Init the getRound counter
getRound = 9
# Create an empty data.frame for the season
ssn_matchdata_2021 <- data.frame(Doubles=double(),
                             Ints=integer(),
                             Factors=factor(),
                             Logicals=logical(),
                             Characters=character(),
                             stringsAsFactors=FALSE)
ssn_playerdata_2021 <- data.frame(Doubles=double(),
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
    tidy_player <- tidyPlayers(matchData)
    # Append
    ssn_matchdata_2021 <- rbind(tidy_match,ssn_matchdata_2021)
    ssn_playerdata_2021 <- rbind(tidy_player,ssn_playerdata_2021)
  }
  # Increment the counter
  getRound <- getRound + 1
}