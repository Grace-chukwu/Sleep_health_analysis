library(dplyr)
library(tidyverse)

#the class and structure of the dataset
class(Sleep_health_and_lifestyle_dataset)
str(Sleep_health_and_lifestyle_dataset)


# Replace Normal weight in the BMI column with Normal
Sleep_health_and_lifestyle_dataset$`BMI Category` <- gsub("Normal weight", "Normal",
                                                          Sleep_health_and_lifestyle_dataset$`BMI Category`, ignore.case = TRUE)

# Replace sales representative with salesperson in the occupation column
Sleep_health_and_lifestyle_dataset$Occupation <- gsub("salesperson", "Salesperson",
                                                      Sleep_health_and_lifestyle_dataset$Occupation)

# To find the total  rows of data
nrow(Sleep_health_and_lifestyle_dataset)

# A new Table comprising of (Gender,occupation and stress level) called Occupation Stress
occupation_stress <- Sleep_health_and_lifestyle_dataset[, c("Gender", "Occupation","Stress Level")]

print(occupation_stress)



# A frequency Table of gender and Occupation

# Frequency Table using table() function
#occupation_by_gender <- table(Sleep_health_and_lifestyle_dataset$Occupation,occupation_stress$Gender)
 #print(occupation_by_gender)

# a frequency distribution table using group_by() and summarize()
Occupation_frequency_table <- Sleep_health_and_lifestyle_dataset %>%
  group_by(Gender, Occupation) %>%
  summarize(count = n()) %>%
  ungroup()





# Which Gender engages in more physical activities and takes more daily steps?

  #1. to calculate the average steps for each gender

      average_steps <-tapply(Sleep_health_and_lifestyle_dataset$`Daily Steps`,Sleep_health_and_lifestyle_dataset$Gender,mean)

  #2.To Count total physical activities for each gender
      
      # Create a bar plot

      
      
        total_phy_activities <- tapply(Sleep_health_and_lifestyle_dataset$`Physical Activity Level`,Sleep_health_and_lifestyle_dataset$Gender,sum)
 
   #3. To Determine which gender has more physical activities and daily steps     
        
        if (average_steps ["Male"] > average_steps["Female"]) {
          steps_winner <- "Male"
        } else {
          steps_winner <- "Female"
        }
        
        if (total_phy_activities["Male"] > total_phy_activities["Female"]) {
          activities_winner <- "Male"
        } else {
          activities_winner <- "Female"
        }
        
        
# print the average_steps and total_phy_activities
        
        cat("Gender with average  daily steps", steps_winner, "\n")
        cat("Gender with more physical Activities", total_phy_activities)

# to DETERMINE if sleep disorder is consistent to any occupation
  # Convert the sleep disorder column to a Boolean

        new_sleep_disorder <- ifelse(Sleep_health_and_lifestyle_dataset$Sleep.Disorder== 
            "Sleep Apnea" | Sleep_health_and_lifestyle_dataset$Sleep.Disorder== "Insomnia",TRUE,FALSE)
                     
      
  average_sleepDisorder_by_Occupation <-  tapply(new_sleep_disorder,
         Sleep_health_and_lifestyle_dataset$Occupation, mean)
  
  barplot(average_sleepDisorder_by_Occupation)
  
# To prevent bias for under represented occupation I used weighted mean instead
   counts_occupation <- table(occupation_stress$Occupation)
   
   total_Occupation_Counts <- sum(counts_occupation)
   weighted.mean(counts_occupation)
   
   occupation_weight <- total_Occupation_Counts/counts_occupation
   
   barplot(occupation_weight)
    
      # To determine if sleep Disorder is consistent with any age  
  average_sleepDisorder_by_age <- tapply(Sleep_health_and_lifestyle_dataset$Age,
                   Sleep_health_and_lifestyle_dataset$Sleep.Disorder, mean)
  
  barplot(average_sleepDisorder_by_age)
 
  
  # creating a stacked column chart
  
  # Sample data
  # Assuming you have a data frame 'sleep' with columns 'gender' and 'occupation'
  
 
  
   # Use a color palette
  
 
 
  
 
  