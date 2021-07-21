# Load required packages
library(superNetballR)
library(tidyverse)
library(ggdark)
# Enter the season ID
SeasonID = 10083
# Set the number of rounds in the season
numRounds = 14
# Init the getRound counter
getRound = 1
# Create an empty data.frame for the season
ssn_matchdata_2017 <- data.frame(Doubles=double(),
                             Ints=integer(),
                             Factors=factor(),
                             Logicals=logical(),
                             Characters=character(),
                             stringsAsFactors=FALSE)
ssn_playerdata_2017 <- data.frame(Doubles=double(),
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
    ssn_matchdata_2017 <- rbind(tidy_match,ssn_matchdata_2017)
    ssn_playerdata_2017 <- rbind(tidy_player,ssn_playerdata_2017)
  }
  # Increment the counter
  getRound <- getRound + 1
}