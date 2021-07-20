# Load required packages
library(superNetballR)
library(tidyverse)
library(ggdark)

vixmatchData <- downloadMatch(11391,9,01)
tidy_vix_match <- tidyMatch(vixmatchData)

tidy_vix_play %>% filter(stat=="netPoints") %>%
  ggplot(aes(y=netPoints, x=period)) +
  geom_line() + geom_point()

tidy_vix_play %>% filter(stat=="netPoints") %>% filter(squadName=="Melbourne Vixens") %>%
    ggplot(aes(y=value, x=period, color=shortDisplayName)) +
    geom_line() + geom_point()

tidy_vix_play %>% filter(stat=="netPoints") %>% filter(squadName=="Melbourne Vixens") %>% 
    ggplot(aes(x=period, y=reorder(value, value), group=shortDisplayName, color=shortDisplayName)) +
    geom_line() + geom_point() +
    dark_theme_gray() 