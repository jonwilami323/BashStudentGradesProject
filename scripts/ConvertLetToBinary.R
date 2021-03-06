#This script accepts external commands (Result.csv and Key.csv) which were created
#in your bash script file. It calls the SecondConvert.R script which converts the answers
#to 0's and 1's, then it saves the result to an R file.

#!/usr/bin/env Rscript
library(reshape2)    

args <- commandArgs(TRUE)                 #passes external arguments to R when using a command line
result <- read.csv(args[1], header=FALSE, stringsAsFactors = FALSE)  #make vector from your student's answers file.
key <- read.csv(args[2], header=FALSE, stringsAsFactors =FALSE)      #make vector from answer key file.
source("CheckStudentAnswers.R")                #calls previously created R script to compare answers and convert them to 0's and 1's. 
mat <-  read(result,key)                 #runs the function created in SecondConvert.R
#write.table(mat, file = args[3], append = FALSE, sep = " ", row.names=FALSE, col.names = FALSE)    #writes QS to a table. This can be done in a different way as shown in the line below. This allows you to see the table. It is a way to debug.
save(mat, file=args[3])       #save mat as an R object. You name the R object as an external argument.  This saves space while saving files.
q()                           #quits R and returns to the bash script
