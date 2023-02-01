# Libraries needed

library(ggplot2)
library(reshape2)
library(plyr)
library(tidyverse)

# Read datasets
Charactersinfo <- read.csv("heroes_information.csv")
Powersinfo <- read.csv("superheroes_powers.csv")

# Creating dataset with only Marvel and DC characters
colnames(Charactersinfo)[colnames(Charactersinfo) == "name"] <- "Name"
marvelDcInfo <- Charactersinfo[(Charactersinfo$Publisher == "Marvel Comics" | Charactersinfo$Publisher == "DC Comics"), ]

# Removing duplicates and selecting columns
marvelDcInfo <- marvelDcInfo[!duplicated(marvelDcInfo$Name), ]
marvelDcInfo <- marvelDcInfo 
marvelDcInfo[5:8]

#Plotting Marvel characters vs DC characters
ggplot(marvelDcInfo, aes(x = Publisher, fill = Publisher)) + 
  geom_bar(stat = "count", aes(fill = Publisher)) +
  labs(x = "Publisher", y = "No. of Characters", title = "DC and Marvel Characters", subtitle = "No. of Characters each publisher") +
  geom_label(stat = "count", aes(label = ..count..)) +
  guides(fill = FALSE) +
  theme_bw() 

# Gender of DC and Marvel characters
ggplot(marvelDcInfo, aes(x = Gender, fill = Gender)) + 
  geom_bar(stat = "count", aes(fill = Gender)) +
    labs(x = "Gender", y = "No. of characters", title = "DC and Marvel Characters", subtitle = "No. of Characters each gender") +
  geom_label(stat = "count", aes(label = ..count..)) +
  guides(fill = FALSE) +
  theme_bw() 

# Race of DC and Marvel characters
ggplot(marvelDcInfo, aes(x = Race, fill = Race)) + 
  geom_bar(stat = "count", aes(fill = Race)) +
  labs(x = "Race", y = "No. of characters", title = "DC and Marvel Characters", subtitle = "No. of Characters each race") +
  geom_label(stat = "count", aes(label = ..count..)) +
  guides(fill = FALSE) +
  theme_bw() 

#Creating power Dataset with selected columns
MarvelDcPowers <- select(Powersinfo, name, overall_score, intelligence_score, strength_score, speed_score, durability_score, power_score, combat_score)

#Top characters highest intelligence Marvel and DC

TopIntel <- select(MarvelDcPowers, name, intelligence_score)

ggplot(TopIntel[1:30, ], aes(x = name, y = intelligence_score)) + 
  geom_bar(stat = "identity", aes(fill = intelligence_score)) +
  labs(x = "Character", y = "intelligence_score", title = "Top 30 Marvel and DC Characters", subtitle = "With Highest Intelligence") +
  coord_flip() +
  theme_bw() 

#Top characters highest strength Marvel and DC

TopIntel <- select(MarvelDcPowers, name, strength_score)

ggplot(TopIntel[1:30, ], aes(x = name, y = strength_score)) + 
  geom_bar(stat = "identity", aes(fill = strength_score)) +
  labs(x = "Character", y = "strength_score", title = "Top 30 Marvel and DC Characters", subtitle = "With Highest Strength") +
  coord_flip() +
  theme_bw() 



