#### R code best practices
#### Author: Che Elkin
#### Date 26 October 2023

# The aim of this discussion is to help with:
  # Version control (Github)
  # Library management
  # Folder organization 
  # Data management
  # Data structure
  # Writting and using functions

##### Version control
#####
#### Github:  https://github.com/
# Need: Github account, github project in rstudio


##### Libraries
#####
# Load the libraries that you need
# Libraries are not static, it is sometimes worth your effort to record the version that you are using (will need to be reported in publications)

# install.packages(c("dplR", "ggplot2", "tidyverse", "tidymodels", "ranger", "randomForest", "purrr", "glue", "vip", "stringi")
library(dplR)
library(ggplot2)
library(tidyverse)
library(tidymodels)
library(ranger)
library(randomForest)
#####


##### Folder organization
#####
# Think about whether you want to use absolute or relative pathways.
# Folders can be used to organize your data, but also to structure you analysis workflow.
projectpath <- "C:\\Users\\cheel\\ONEDRI~1\\WORKSP~1\\rtest\\rs-test\\"
datpath <-  paste0(projectpath,"1_data\\")
outpath <-  paste0(projectpath,"2_output\\")
plotpath <- paste0(projectpath,"3_figures\\")

# Check if a directory already exists, if it doesn't create it
if (!dir.exists(outpath)){
  dir.create(outpath)
} else {
  print("Directory already exists")
}

# Alternative for check and creation of directory
if (!dir.exists(plotpath)){dir.create(plotpath)}
#####

##### Data management
#####
# Always maintain a static data set (documented and cleaned) and a working data set.
# no touch data set in 0_repository
# working data set in 1_data
dat1name <- "faib_tree_detail.csv"
dat1 <- read.csv(paste0(datpath,dat1name))
dim(dat1)


#####

##### Data structure
#####
# In this section you can do the modifications to the data that allow 

# Test of BA calculation using PHF
dat1 <- mutate(dat1, BA_TREE_HA = BA_TREE*PHF_TREE) # Create column of each tree's BA/HA
# Calculate BA/HA at plot level
plot_BA_HA <- dat1 %>%
  group_by (CLSTR_ID, LV_D, s_f, PLOT) %>%
  summarize(BA_HA = sum(BA_TREE_HA))

#####



# Test of BA calculation using PHF
dat <- mutate(dat, BA_TREE_HA = BA_TREE*PHF_TREE) # Create column of each tree's BA/HA
# Calculate BA/HA at plot level
plot_BA_HA <- dat %>%
  group_by (CLSTR_ID, LV_D, s_f, PLOT) %>%
  summarize(BA_HA = sum(BA_TREE_HA))