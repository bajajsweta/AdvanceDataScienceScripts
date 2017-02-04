
library(data.table)

getwd()
setwd("H:/Advance Data Science/Exercise 1")

#fread is better than read.csv
ClassData <- fread("ClassData http-%2F%2Fbit.ly%2F2kyfv1G - Sheet1.csv", sep=",")

#Convert as a data frame
ClassData <- as.data.frame(ClassData)

##Analyse Data
summary(ClassData)

hist(ClassData$GPA)

hist(ClassData$`Latest salary (per year)`)

## Find the Mode of the Salary
# Create the function.
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

mode <- getmode(ClassData$`Latest salary (per year)`)

mode

#Check the values in that column
unique(ClassData$`Coops/Internships (YN)`)

table(ClassData$`Coops/Internships (YN)`)

#Replace the small letter y to Big Letter Y
install.packages("car",repos="http://cran.rstudio.com/")
library(car)


#Find and Replace in R
ClassData$`Coops/Internships (YN)` <- recode(ClassData$`Coops/Internships (YN)`, '"y" = "Y"')

ClassData$`Coops/Internships (YN)` <- recode(ClassData$`Coops/Internships (YN)`, '"" = "Missing"')

#Check the values in that column
unique(ClassData$`Coops/Internships (YN)`)

table(ClassData$`Coops/Internships (YN)`)


calculate <- matrix(table(ClassData$`Coops/Internships (YN)`), ncol=1)

percentage <- prop.table(calculate, margin=2)*100

#Percentage of Coops/Internships
percentage

ClassData$`Number of contacts on Linkedin` <- recode(ClassData$`Number of contacts on Linkedin`, '"" = 0')

ClassData[ClassData$`Number of contacts on Linkedin`>500,]


