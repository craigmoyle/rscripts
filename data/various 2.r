# List of Super Netball colours that are CVD friendly
SquadName_Colours <- c("#FDE725FF", "#73D055FF", "#27AD81FF", 
 "#7E4E90FF", "#CC6A70FF", "#2D708EFF", "#C0C0C0", "#F68F46FF")
names(SquadName_Colours) <- c("Sunshine Coast Lightning", "West Coast Fever", "Melbourne Vixens", 
"Queensland Firebirds", "Adelaide Thunderbirds", "NSW Swifts", "Collingwood Magpies", "GIANTS Netball")









# Make it even happier!
FirebirdsVixens %>% filter(stat=="goal_from_zone2") %>% 
    ggplot(aes(x = period, y = value, colour = squadName)) + geom_line(linetype = "dashed") + geom_point(size = 8) +
    geom_text(aes(label = value), size = 4, colour = "black", check_overlap = TRUE) +
    scale_colour_manual(values = SquadName_Colours) + scale_fill_manual(values = SquadName_Colours) +
    scale_x_continuous(limits = c(1,4), breaks = c(1:4), labels = function(x) paste0("Quarter ", x)) +
    scale_y_continuous(expand = c(0,0), limits = c(0, 10), breaks = seq(0,10, by = 2)) +
    labs(x = NULL, y = "Number of Super Shots Made \n", title = "\n Rd13 - Firebirds v Vixens \n Super Shots Made \n") +
    dark_theme_gray()  + 
    theme(plot.title = element_text(size = 14, face = "bold", hjust = 0.5),
        plot.background = element_rect(fill = "grey10"), panel.background = element_blank(),
        panel.grid.major = element_blank(), panel.grid.minor = element_blank(), legend.background = element_blank(),
        axis.title.y = element_text(size = 12, face = "bold"), axis.ticks.x =  element_line(color = "grey30", size = 0.1),
        axis.line.x =  element_line(color = "grey30", size = 0.1), axis.text.x = element_text(size = 12, face = "bold"),
        axis.ticks.y =  element_line(color = "grey30", size = 0.1), axis.line.y =  element_line(color = "grey30", size = 0.1),
        axis.text.y = element_text(size = 10, face = "bold"), legend.title = element_blank(), legend.position = "bottom")

# Make it even happier!
FirebirdsVixens %>% filter(stat=="goal_from_zone2") %>% 
    ggplot(aes(x = period, y = value, colour = squadName)) + geom_line(linetype = "dashed") + geom_point(size = 8) +
    geom_text(aes(label = value), size = 4, colour = "black", check_overlap = TRUE) +
    scale_colour_manual(values = SquadName_Colours) + scale_fill_manual(values = SquadName_Colours) +
    scale_x_continuous(limits = c(1,4), breaks = c(1:4), labels = function(x) paste0("Quarter ", x)) +
    scale_y_continuous(expand = c(0,0), limits = c(0, 10), breaks = seq(0,10, by = 2)) +
    labs(x = NULL, y = "Number of Super Shots Made \n", title = "\n Rd13 - Firebirds v Vixens \n Super Shots Made \n") +
    dark_theme_gray()  + 
    theme(plot.title = element_text(size = 14, face = "bold", hjust = 0.5),
        plot.background = element_rect(fill = "grey10"), panel.background = element_blank(),
        panel.grid.major = element_blank(), panel.grid.minor = element_blank(), legend.background = element_blank(),
        axis.title.y = element_text(size = 12, face = "bold"), axis.ticks.x =  element_line(color = "grey30", size = 0.1),
        axis.line.x =  element_line(color = "grey30", size = 0.1), axis.text.x = element_text(size = 12, face = "bold"),
        axis.ticks.y =  element_line(color = "grey30", size = 0.1), axis.line.y =  element_line(color = "grey30", size = 0.1),
        axis.text.y = element_text(size = 10, face = "bold"), legend.title = element_blank(), legend.position = "bottom")


SSN_2020 %>% filter(stat=="goal_from_zone2") %>% group_by(squadName) %>% summarise(Total = sum(value)) %>% arrange(desc(Total)) %>%
    ggplot(aes(x = reorder(squadName, -Total), y = Total, colour = squadName)) +
    geom_point(size = 10) + geom_segment(aes(x = squadName, y = 0, xend = squadName, yend = Total, colour = squadName), linetype = "dashed") +
    geom_text(aes(label = Total), size = 4, colour = "black", check_overlap = TRUE) +
    scale_colour_manual(values = SquadName_Colours) + scale_fill_manual(values = SquadName_Colours) +
    scale_y_continuous(expand = c(0,0), limits = c(0, 1600), breaks = seq(0,1600, by = 100)) +
    labs(x = NULL, y = "Number of Super Shot Made \n", title = "\n Suncorp Super Netball 2020 \n Total Super Shot Made \n") +
    dark_theme_gray()  + theme(plot.title = element_text(size = 14, face = "bold", hjust = 0.5),
        plot.background = element_rect(fill = "grey10"), panel.background = element_blank(),
        panel.grid.major = element_blank(), panel.grid.minor = element_blank(), legend.background = element_blank(),
        axis.title.y = element_text(size = 12, face = "bold"), axis.ticks.x =  element_line(color = "grey30", size = 0.1),
        axis.line.x =  element_line(color = "grey30", size = 0.1), 
        axis.text.x = element_text(size = 12, face = "bold", angle = 45, vjust = 1, hjust = 1),
        axis.ticks.y =  element_line(color = "grey30", size = 0.1), axis.line.y =  element_line(color = "grey30", size = 0.1),
        axis.text.y = element_text(size = 10, face = "bold"),legend.title = element_blank(), legend.position = "none")

SS_All %>% group_by(squadName) %>% summarise(Total = (Made/Attempt)*100) %>% arrange(desc(Total)) %>%
    ggplot(aes(x = reorder(squadName, -Total), y = Total, colour = squadName)) +
    geom_point(size = 10) + geom_segment(aes(x = squadName, y = 0, xend = squadName, yend = Total, colour = squadName), linetype = "dashed") +
    geom_text(aes(label = round(Total, digits = 1)), size = 4, colour = "black", check_overlap = TRUE) +
    scale_colour_manual(values = SquadName_Colours) + scale_fill_manual(values = SquadName_Colours) +
    scale_y_continuous(expand = c(0,0), limits = c(0, 100), breaks = seq(0,100, by = 10)) +
    labs(x = NULL, y = "% of Super Shot Made \n", title = "\n Suncorp Super Netball 2020 \n Total Super Shot % \n") +
    dark_theme_gray()  + theme(plot.title = element_text(size = 14, face = "bold", hjust = 0.5),
        plot.background = element_rect(fill = "grey10"), panel.background = element_blank(),
        panel.grid.major = element_blank(), panel.grid.minor = element_blank(), legend.background = element_blank(),
        axis.title.y = element_text(size = 12, face = "bold"), axis.ticks.x =  element_line(color = "grey30", size = 0.1),
        axis.line.x =  element_line(color = "grey30", size = 0.1), 
        axis.text.x = element_text(size = 12, face = "bold", angle = 45, vjust = 1, hjust = 1),
        axis.ticks.y =  element_line(color = "grey30", size = 0.1), axis.line.y =  element_line(color = "grey30", size = 0.1),
        axis.text.y = element_text(size = 10, face = "bold"),legend.title = element_blank(), legend.position = "none")


SSN_2020 %>% filter(stat=="goal_from_zone2") %>% 
    ggplot( aes(x=round, y=value, group=squadName, color=squadName_Colours)) +
    geom_line()
    # ggplot(aes(x = round, y = value, colour = squadName)) + geom_line(linetype = "dashed") + geom_point(size = 8) +
    # geom_text(aes(label = value), size = 4, colour = "black", check_overlap = TRUE) +
    # scale_colour_manual(values = SquadName_Colours) + scale_fill_manual(values = SquadName_Colours) +
    # scale_x_continuous(limits = c(1,4), breaks = c(1:4), labels = function(x) paste0("Quarter ", x)) +
    # scale_y_continuous(expand = c(0,0), limits = c(0, 10), breaks = seq(0,10, by = 2)) +
    # labs(x = NULL, y = "Number of Super Shots Made \n", title = "\n Rd13 - Firebirds v Vixens \n Super Shots Made \n") +











# First, create an empty data.frame for the season
SSN_2020 <- FirebirdsVixens[0,]
SeasonID = 11108
# Set the number of rounds in the season
numRounds = 14
# Loop for the number of rounds in the season
for (rr in 1:numRounds) {
    # Run a loop to grab data for the round
    for (q in 1:4) {
        # First, create an empty data.frame for the round
        SSN_Round <- FirebirdsVixens[0,]
        # Download match
        matchData <- downloadMatch(SeasonID,getRound,q)
        # Tidy data
        tidy_match <- tidyMatch(matchData)
        # Append
        SSN_RoundTidy <- rbind(tidy_match,SSN_Round)
    }
    SSN_2020 <- rbind(SSN_RoundTidy)
}
# Inspect
tail(SSN_2020, 12)

SSN_2020 %>% filter(stat=="goal_from_zone2") %>% group_by(round,squadName) %>% summarise(Total = sum(value)) %>% 
    arrange(desc(Total)) %>% ggplot(aes(x = reorder(squadName, -Total), y = Total, colour = squadName)) +
    geom_point(size = 10) + geom_segment(aes(x = squadName, y = 0, xend = squadName, yend = Total, colour = squadName), linetype = "dashed") +
    geom_text(aes(label = Total), size = 4, colour = "black", check_overlap = TRUE) +
    scale_colour_manual(values = SquadName_Colours) + scale_fill_manual(values = SquadName_Colours) +
    scale_y_continuous(expand = c(0,0), limits = c(0, 60), breaks = seq(0,60, by = 10)) +
    labs(x = NULL, y = "Number of General Play Turnovers \n", title = "\n Suncorp Super Netball 2020 \n Rd13 - General Play Turnovers \n") +
    dark_theme_gray()  + theme(plot.title = element_text(size = 14, face = "bold", hjust = 0.5),
        plot.background = element_rect(fill = "grey10"), panel.background = element_blank(),
        panel.grid.major = element_blank(), panel.grid.minor = element_blank(), legend.background = element_blank(),
        axis.title.y = element_text(size = 12, face = "bold"), axis.ticks.x =  element_line(color = "grey30", size = 0.1),
        axis.line.x =  element_line(color = "grey30", size = 0.1), 
        axis.text.x = element_text(size = 12, face = "bold", angle = 45, vjust = 1, hjust = 1),
        axis.ticks.y =  element_line(color = "grey30", size = 0.1), axis.line.y =  element_line(color = "grey30", size = 0.1),
        axis.text.y = element_text(size = 10, face = "bold"),legend.title = element_blank(), legend.position = "none")