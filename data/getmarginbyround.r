# Load required packages
library(superNetballR)
library(tidyverse)
library(ggdark)

# SSN_2020 <- FirebirdsVixens[0,]
SeasonID = 11391
# Set the number of rounds in the season
numRounds = 9
getRound = 1

# Create empty data.frame
season_winners <- data.frame(Doubles=double(),
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
        match_points <- matchPoints(tidy_match)
        winner <- match_points %>% filter(points==4)
        winner <- data.frame(winner)
        # Append
        season_winners <- rbind(season_winners,winner)
    }
    getRound <- getRound + 1
}
diff <- select(season_winners, score_diff)
colSums(diff)
colSums(diff)/(numRounds*4)