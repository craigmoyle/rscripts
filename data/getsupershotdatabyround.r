# Load required packages
library(superNetballR)
library(tidyverse)
library(ggdark)

# SSN_2020 <- FirebirdsVixens[0,]
SeasonID = 11108
# Set the number of rounds in the season
numRounds = 14
getRound = 1

# Create two empty data.frames
SS_By_Round <- data.frame(Doubles=double(),
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
        supershot <- tidy_match %>% filter(stat=="generalPlayTurnovers") %>% group_by(squadName) %>% summarise(total = sum(value),round) %>% distinct()
        supershot <- data.frame(supershot)
        # Append
        SS_By_Round <- rbind(SS_By_Round,supershot)
    }
    getRound <- getRound + 1
}

# Filter required data from season data
turnovers_season  <- data.frame(Doubles=double(),
                        Ints=integer(),
                        Factors=factor(),
                        Logicals=logical(),
                        Characters=character(),
                        stringsAsFactors=FALSE)
numRounds = 10
getRound = 1
while (getRound <= numRounds) {	
    turnovers <- ssn_matchdata_2021 %>% filter(stat=="generalPlayTurnovers") %>% filter(round==getRound) %>% group_by(squadName) %>% summarise(total = sum(value),round) %>% distinct()
    turnovers <- data.frame(turnovers)
    turnovers_season <- rbind(turnovers_season,turnovers)
    getRound <- getRound + 1
}

# Filter required data from season data
turnovers_season  <- data.frame(Doubles=double(),
                        Ints=integer(),
                        Factors=factor(),
                        Logicals=logical(),
                        Characters=character(),
                        stringsAsFactors=FALSE)
numRounds = 14
getRound = 1
while (getRound <= numRounds) {	
    turnovers <- ssn_matchdata_2017 %>% filter(stat=="turnovers") %>% filter(round==getRound) %>% group_by(round) %>% summarise(total = sum(value)) %>% distinct()
    turnovers <- data.frame(turnovers)
    turnovers <- cbind(turnovers, year = 2017)
    turnovers_season <- rbind(turnovers_season,turnovers)
    getRound <- getRound + 1
}


# Filter required data from season data - average
turnovers_season_avg  <- data.frame(Doubles=double(),
                        Ints=integer(),
                        Factors=factor(),
                        Logicals=logical(),
                        Characters=character(),
                        stringsAsFactors=FALSE)
numRounds = 10
getRound = 1
while (getRound <= numRounds) {	
    turnovers <- ssn_matchdata_2021 %>% filter(stat=="generalPlayTurnovers") %>% filter(round<=getRound) %>% group_by(squadName) %>% summarise(total = sum(value)/getRound,round) %>% distinct()
    turnovers <- turnovers %>% filter(round==getRound)
    turnovers <- data.frame(turnovers)
    turnovers_season_avg <- rbind(turnovers_season_avg,turnovers)
    getRound <- getRound + 1
}

# Filter required data from season data - average
unforcedturnovers_season_avg  <- data.frame(Doubles=double(),
                        Ints=integer(),
                        Factors=factor(),
                        Logicals=logical(),
                        Characters=character(),
                        stringsAsFactors=FALSE)
numRounds = 10
getRound = 1
while (getRound <= numRounds) {	
    unforcedturnovers <- ssn_matchdata_2021 %>% filter(stat=="unforcedTurnovers") %>% filter(round<=getRound) %>% group_by(squadName) %>% summarise(total = sum(value)/getRound,round) %>% distinct()
    unforcedturnovers <- unforcedturnovers %>% filter(round==getRound)
    unforcedturnovers <- data.frame(unforcedturnovers)
    unforcedturnovers_season_avg <- rbind(unforcedturnovers_season_avg,unforcedturnovers)
    getRound <- getRound + 1
}



unforcedturnovers_season  <- data.frame(Doubles=double(),
                        Ints=integer(),
                        Factors=factor(),
                        Logicals=logical(),
                        Characters=character(),
                        stringsAsFactors=FALSE)
numRounds = 14
getRound = 1
while (getRound <= numRounds) {	
    unforcedturnovers <- ssn_matchdata_2021 %>% filter(stat=="unforcedTurnovers") %>% filter(round==getRound) %>% group_by(round) %>% summarise(total = sum(value)) %>% distinct()
    unforcedturnovers <- data.frame(unforcedturnovers)
    unforcedturnovers <- cbind(unforcedturnovers, year = 2021)
    unforcedturnovers_season <- rbind(unforcedturnovers_season,unforcedturnovers)
    getRound <- getRound + 1
}
