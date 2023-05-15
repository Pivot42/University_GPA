library(tidyverse)
library(rstatix)

GPA_data = read.delim('UTEP_GPA.txt')

GPA_data$Classification = factor(GPA_data$Classification)
summary(GPA_data)

# get group means
select(GPA_data, Classification, GPA) %>% 
  group_by(Classification) %>% 
  summarize_all(mean)

# get standard deviation for each group
select(GPA_data, Classification, GPA) %>% 
  group_by(Classification) %>% 
  summarize_all(sd)

results = aov(GPA ~ Classification, data = GPA_data)
summary(results)
