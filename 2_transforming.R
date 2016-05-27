# There are six dplyr functions that you will use to do the vast majority of 
# data manipulations:
# 1) reorder the rows (arrange()),
# 2) pick observations by their values (filter()),
# 3) pick variables by their names (select()),
# 4 & 5) create new variables with functions of existing variables (mutate()),
# or collapse many values down to a single summary (summarise()).
# 6) These can all be used in conjunction with group_by() which changes 
# the scope of each function from operating on the entire dataset to 
# operating on it group-by-group. These six functions provide the 
# verbs for a language of data manipulation.

# install.packages("nycflights13") << need " for installing packages

# load packages
library(dplyr)
library(readr)
library(tidyr)
library(nycflights13)

# data(flights) enabled data to show in the enviroment on the top right
View(flights)
str(flights)
glimpse(flights) #similar to str.. interchangable with it for my purposes
dim(flights) #shortcut to find # of observations of x variables
names(flights) #gives you the column names
head(flights) #shows you first 6 rows
tail(flights) #shows you bottom six

# Select every flight that took place the first of January

flights_jan <- flights %>% filter(month == 1) # All of January
flights_1jan <- flights %>% filter(month == 1, day == 1) #Just January 1st.. The comma acts as "And"
flights_1jan_2 <- flights %>% filter(month == 1 & day == 1) #Equivalent to the one above

identical(flights_1jan,flights_2jan)

# Select every flight that took place in January or March

flights_jan_or_mar <- flights %>% filter(month == 1 | month == 3) # January or March

# in R, one equal sign (=) is assignment (and equivalent to "<-"),
# two equal signs (==) is comparison

# '%>%' -> pipe operator: turns R into a more sql-like language (Functional Programming)

# Select every flight that departed from JFK

flights_jfk <- flights %>% filter(origin == "JFK")

# Sort "Select every flight that departed from JFK" By Day -- automatically in Ascending order

flights_jfk <- flights %>% filter(origin == "JFK") %>% arrange(day)
View(flights_jfk)

# Sort "Select every flight that departed from JFK" By Day in Descending order

flights_jfk <- flights %>% filter(origin == "JFK") %>% arrange(desc(day))
View(flights_jfk)

## Select origin, year, dest, distance
select_flights <- flights %>% select (origin, year, dest, distance)

## Remove the dep_delay column
less_flights <- flights %>% select(-dep_delay)
View(less_flights)

## Select variables that end in "time":
flights_time <- flights %>% select(ends_with("time"))

## mutate is to add a new column that computes the proportion between arr_time and dep_time

prop_flights <- flights %>% mutate(proportion = round(arr_time / dep_time,2)) #rounding to 2 decimal points
View(prop_flights)

prop_flights_only <- flights %>% transmute(proportion = arr_time / dep_time) #only new column
View(prop_flights_only)

## Exercises

## #1: Flights that were delayed by at least an hour, but made up over 30 minutes in flight
sigdelay <- flights %>% filter(dep_delay >30)


## #2: Flights that Departed between 1am and 5am
## #3: How many flights have missing values in 'dep_time'
## #4: Remove origin, year, dest, distance from flights table