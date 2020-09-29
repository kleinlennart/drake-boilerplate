### All library() calls in the project go here ###
# Sourced from '_drake.R'

library(drake)

## Basic packages (as recommended by the {dflow} boilerplate)
library(conflicted) # better conflict errors
# library(dotenv) # loads the variables defined in the .env file

## Data Wrangling
# suppressPackageStartupMessages(library(tidyverse))
library(tidyverse)
library(lubridate)

## Reporting
library(knitr)
library(rmarkdown)
library(kableExtra)

## Others
# library(visNetwork)

## Notes
# - library() vs. require() 
