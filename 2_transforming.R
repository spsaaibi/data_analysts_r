# There are six dplyr functions that you will use to do the vast majority of data manipulations:
# reorder the rows (arrange()),
# pick observations by their values (filter()),
# pick variables by their names (select()),
# create new variables with functions of existing variables (mutate()), or
# collapse many values down to a single summary (summarise()).
# These can all be used in conjunction with group_by() which changes the scope of each function from operating on the entire dataset to operating on it group-by-group. These six functions provide the verbs for a language of data manipulation.

# load packages

library(dplyr)
library(readr)
library(tidyr)
library(nycflights13)

View(flights)
str(flights)  
glimpse(flights)
dim(flights)


# `%>%` -> pipe operator: Turns R into a more sql-like language (Functional Programming)

## Select every flight that took place first of january
data(flights)
flights_jan <- flights %>% filter(month == 1) 
flights_1jan <- flights %>% filter(month == 1, day == 1) 
flights_1jan_2 <- flights %>% filter(month == 1 & day == 1) 

identical(flights_1jan,flights_1jan_2)

## Jan or March Flights

flights_jan_or_march <- flights %>% filter(month == 1 | month == 3)

# in R, one `=` is assignment (and "equivalent" to `<-` ), two `==` is comparison

## Select every flight that departed from JFK

flights_jfk <- flights %>% filter(origin == "JFK")

## Select every flight that departed from JFK, sort them by day

flights_jfk_day <- flights %>%
  filter(origin == "JFK") %>% arrange(desc(day))


## Exercises:

### Flights that were delayed by at least an hour, but made up over 30 minutes in flight.

### Flights that Departed between 1am and 5am

### Have missing values in `dep_time`




### Select origin, year, dest, distance

flights %>% select( origin, year, dest, distance )


### Remove the dep_delay column

flights %>% select(-dep_delay)

## Exercise
### Remove origin, year, dest, distance


### select variables that end in `time`:

flights_time <- flights %>% select(ends_with("time"))



## mutate is to add a new column



