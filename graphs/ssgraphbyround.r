# Load required packages
library(superNetballR)
library(tidyverse)
library(ggdark)

# List of Super Netball colours that are CVD friendly
SquadName_Colours <- c("#FDE725FF", "#73D055FF", "#27AD81FF", 
 "#7E4E90FF", "#CC6A70FF", "#2D708EFF", "#C0C0C0", "#F68F46FF")
names(SquadName_Colours) <- c("Sunshine Coast Lightning", "West Coast Fever", "Melbourne Vixens", 
"Queensland Firebirds", "Adelaide Thunderbirds", "NSW Swifts", "Collingwood Magpies", "GIANTS Netball")

SS_Attempt_By_Round_2021 %>%
    ggplot(aes(x=round, y=total, group=squadName, color=squadName)) +
    geom_line() + geom_point() +
    geom_text(aes(label = total), size = 4, colour = "black", check_overlap = TRUE) +
    scale_colour_manual(values = SquadName_Colours) + scale_fill_manual(values = SquadName_Colours) +
    scale_x_continuous(limits = c(1,14), breaks = c(1:14)) +
    scale_y_continuous(expand = c(0,0), limits = c(0, 26), breaks = seq(0,26, by = 2)) +
    labs(x = NULL, y = "Number of Super Shots Made \n", title = "\n Super Netball 2021 \n Super Shots Attempts per Team By Round\n") +
    dark_theme_gray() +
    theme(plot.title = element_text(size = 14, face = "bold", hjust = 0.5),
        plot.background = element_rect(fill = "grey10"), panel.background = element_blank(),
        panel.grid.major = element_blank(), panel.grid.minor = element_blank(), legend.background = element_blank(),
        axis.title.y = element_text(size = 12, face = "bold"), axis.ticks.x =  element_line(color = "grey30", size = 0.1),
        axis.line.x =  element_line(color = "grey30", size = 0.1), axis.text.x = element_text(size = 12, face = "bold"),
        axis.ticks.y =  element_line(color = "grey30", size = 0.1), axis.line.y =  element_line(color = "grey30", size = 0.1),
        axis.text.y = element_text(size = 10, face = "bold"), legend.title = element_blank(), legend.position = "bottom")