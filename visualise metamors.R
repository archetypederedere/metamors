library("tidyverse")
library("readxl")
library("visNetwork")

metamor_database <- read_xlsx("data/metamors.xlsx")
human_database <- read_xlsx("data/humans.xlsx")

colour_scheme <- read_xlsx("data/colourschemes.xlsx")


human_database <- human_database %>%
  mutate(title = id,
         label = id,
         size = age)

metamor_database <- metamor_database%>%
  left_join(colour_scheme) %>%
  mutate(color = colour) %>%
  mutate(width = 5*length.of.relationship)

visNetwork(human_database,
           metamor_database) %>%
  visOptions(highlightNearest = TRUE)

