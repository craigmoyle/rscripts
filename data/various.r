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
    # First, create an empty data.frame for the round
#    SSN_Round <- FirebirdsVixens[0,]
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
# Inspect
tail(SS_Attempt_By_Round_2020, 12)

SS_Attempt_By_Round_2020 %>%
    ggplot(aes(x=round, y=total, group=squadName, color=squadName)) +
    geom_line() + geom_point() +
    geom_text(aes(label = total), size = 4, colour = "black", check_overlap = TRUE) +
    scale_colour_manual(values = SquadName_Colours) + scale_fill_manual(values = SquadName_Colours) +
    scale_x_continuous(limits = c(1,14), breaks = c(1:14)) +
    scale_y_continuous(expand = c(0,0), limits = c(0, 26), breaks = seq(0,26, by = 2)) +
    labs(x = NULL, y = "Number of Super Shots Made \n", title = "\n Super Netball 2020 \n Super Shots Attempts per Team By Round\n") +
    dark_theme_gray() +
    theme(plot.title = element_text(size = 14, face = "bold", hjust = 0.5),
        plot.background = element_rect(fill = "grey10"), panel.background = element_blank(),
        panel.grid.major = element_blank(), panel.grid.minor = element_blank(), legend.background = element_blank(),
        axis.title.y = element_text(size = 12, face = "bold"), axis.ticks.x =  element_line(color = "grey30", size = 0.1),
        axis.line.x =  element_line(color = "grey30", size = 0.1), axis.text.x = element_text(size = 12, face = "bold"),
        axis.ticks.y =  element_line(color = "grey30", size = 0.1), axis.line.y =  element_line(color = "grey30", size = 0.1),
        axis.text.y = element_text(size = 10, face = "bold"), legend.title = element_blank(), legend.position = "bottom")