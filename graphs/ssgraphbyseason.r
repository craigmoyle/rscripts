# Load required packages
library(superNetballR)
library(tidyverse)
library(ggdark)

# List of Super Netball colours that are CVD friendly
SquadName_Colours <- c("#FDE725FF", "#73D055FF", "#27AD81FF", 
 "#7E4E90FF", "#CC6A70FF", "#2D708EFF", "#C0C0C0", "#F68F46FF")
names(SquadName_Colours) <- c("Sunshine Coast Lightning", "West Coast Fever", "Melbourne Vixens", 
"Queensland Firebirds", "Adelaide Thunderbirds", "NSW Swifts", "Collingwood Magpies", "GIANTS Netball")

# Graph Super Shot attempted by team for the season
SSN_2021 %>% filter(stat=="attempt_from_zone2") %>% group_by(squadName) %>% summarise(Total = sum(value)) %>% arrange(desc(Total)) %>%
    ggplot(aes(x = reorder(squadName, -Total), y = Total, colour = squadName)) +
    geom_point(size = 10) + geom_segment(aes(x = squadName, y = 0, xend = squadName, yend = Total, colour = squadName), linetype = "dashed") +
    geom_text(aes(label = Total), size = 4, colour = "black", check_overlap = TRUE) +
    scale_colour_manual(values = SquadName_Colours) + scale_fill_manual(values = SquadName_Colours) +
    scale_y_continuous(expand = c(0,0), limits = c(0, 1600), breaks = seq(0,1600, by = 100)) +
    labs(x = NULL, y = "Number of Super Shot Attempt \n", title = "\n Suncorp Super Netball 2021 \n Total Super Shot Atempt \n") +
    dark_theme_gray()  + theme(plot.title = element_text(size = 14, face = "bold", hjust = 0.5),
        plot.background = element_rect(fill = "grey10"), panel.background = element_blank(),
        panel.grid.major = element_blank(), panel.grid.minor = element_blank(), legend.background = element_blank(),
        axis.title.y = element_text(size = 12, face = "bold"), axis.ticks.x =  element_line(color = "grey30", size = 0.1),
        axis.line.x =  element_line(color = "grey30", size = 0.1), 
        axis.text.x = element_text(size = 12, face = "bold", angle = 45, vjust = 1, hjust = 1),
        axis.ticks.y =  element_line(color = "grey30", size = 0.1), axis.line.y =  element_line(color = "grey30", size = 0.1),
        axis.text.y = element_text(size = 10, face = "bold"),legend.title = element_blank(), legend.position = "none")

# Graph Super Shot made by team for the season
SSN_2021 %>% filter(stat=="goal_from_zone2") %>% group_by(squadName) %>% summarise(Total = sum(value)) %>% arrange(desc(Total)) %>%
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

# Create frame with made and attempts
SS_2021_Attempt <- SSN_2021 %>% filter(stat=="attempt_from_zone2") %>% group_by(squadName) %>% summarise(Attempt = sum(value)) %>% arrange(desc(Attempt))
SS_2021_Made <- SSN_2021 %>% filter(stat=="goal_from_zone2") %>% group_by(squadName) %>% summarise(Made = sum(value)) %>% arrange(desc(Made))
SS_2021_All <- left_join(SS_2021_Made, SS_2021_Attempt, by = "squadName")

# Graph Super Shot % by team for the season
SS_2021_All %>% group_by(squadName) %>% summarise(Total = (Made/Attempt)*100) %>% arrange(desc(Total)) %>%
    ggplot(aes(x = reorder(squadName, -Total), y = Total, colour = squadName)) +
    geom_point(size = 10) + geom_segment(aes(x = squadName, y = 0, xend = squadName, yend = Total, colour = squadName), linetype = "dashed") +
    geom_text(aes(label = round(Total, digits = 1)), size = 4, colour = "black", check_overlap = TRUE) +
    scale_colour_manual(values = SquadName_Colours) + scale_fill_manual(values = SquadName_Colours) +
    scale_y_continuous(expand = c(0,0), limits = c(0, 100), breaks = seq(0,100, by = 10)) +
    labs(x = NULL, y = "% of Super Shot Made \n", title = "\n Suncorp Super Netball 2021 \n Total Super Shot % \n") +
    dark_theme_gray()  + theme(plot.title = element_text(size = 14, face = "bold", hjust = 0.5),
        plot.background = element_rect(fill = "grey10"), panel.background = element_blank(),
        panel.grid.major = element_blank(), panel.grid.minor = element_blank(), legend.background = element_blank(),
        axis.title.y = element_text(size = 12, face = "bold"), axis.ticks.x =  element_line(color = "grey30", size = 0.1),
        axis.line.x =  element_line(color = "grey30", size = 0.1), 
        axis.text.x = element_text(size = 12, face = "bold", angle = 45, vjust = 1, hjust = 1),
        axis.ticks.y =  element_line(color = "grey30", size = 0.1), axis.line.y =  element_line(color = "grey30", size = 0.1),
        axis.text.y = element_text(size = 10, face = "bold"),legend.title = element_blank(), legend.position = "none")