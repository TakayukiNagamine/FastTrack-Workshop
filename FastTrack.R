# Converting Fast Track output to R-friendly format
# Takayuki Nagamine 11 JAN 2022

# Data Preparation --------------------------------------------------------

# Load packages
library(tidyverse)
library(emuR)

# Import dataset, rename a variable and combine all
df.aggr <- read.csv("/Volumes/Samsung_T5/Asian Engliehse Listening/ALLSTAR/female/processed_data/aggregated_data.csv")
## "Aggregated_data" contains information about formant frequency values and duration, f0 etc. but lacks in other information.

df.segment.info <- read.csv("/Volumes/Samsung_T5/Asian Engliehse Listening/ALLSTAR/female/segmentation_information.csv")
## "Segmentation infomation" supplent the "Aggregated_data.csv" with information about the context of the extracted sounds, vowel durations, stress, comments, etc.

df.segment.info <- df.segment.info %>% rename(file = outputfile) 
## Rename the "outputfile" column to "file" so that it is compatible with the "Aggregated_data.csv".

df <- merge(df.aggr, df.segment.info, by = "file", all = T)
## Merging the two csv files

df <- na.omit(df) # omitting NA

write.csv(df, "/Users/TakayukiNagamine/OneDrive - Lancaster University/ProjectsOther/JACET2021/OSCARR/NWSAnalysis/data.csv", row.names = TRUE) 
# Exporting csv for back-up


# Data Tydying-ups -------------------------------------

# Create long data, add and extract variables
df.long <- df %>%
  pivot_longer(contains(c("f1", "f2", "f3")), 
               names_to = c("formant", "timepoint"), 
               names_pattern = "(f\\d)(\\d+)",
               values_to = "hz")


df.long <- df.long %>% 
  tidyr::spread(key = formant, value = hz) %>% 
  mutate(
    timepoint = as.numeric(timepoint),
    percent = (timepoint - 1) * 10, 
    Barkf1 = bark(f1, F),
    Barkf2 = bark(f2, F),
    Barkf3 = bark(f3, F),
    f2minusf1 = f2 - f1,
    f3minusf2 = f3 - f2,
    Barkf2minusf1 = bark(f2minusf1, F),
    Barkf3minusf2 = bark(f3minusf2, F),
    gender = 
      str_sub(file, start = 5, end = 5), # This will vary depending on your own naming conventions.
    language =
      str_sub(file, start = 7, end = 9), # This will vary  depending on your own naming conventions.
    vowel = label,
    passage = "nws"
  )

# Selecting only relevant columns for analysis
df.long %>% 
  select()

# Export csv for back-up
write.csv(nws, "/Users/TakayukiNagamine/OneDrive - Lancaster University/ProjectsOther/AsianEnglishes/longdata.csv", row.names = TRUE) # export csv for back-up

# Read csv
nws <- read_csv("/Users/TakayukiNagamine/OneDrive - Lancaster University/ProjectsOther/AsianEnglishes/longdata.csv")