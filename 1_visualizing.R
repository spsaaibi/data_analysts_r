

# load packages
library(ggplot2) #load ggplot2

# ggplot is the main function of the package ggplot2

ggplot(mtcars) + geom_point(aes(x = mpg, y = drat, color = cyl))


happy <- ggplot(mtcars)
happy <- happy + geom_point(aes(x = mpg, y = drat, color = cyl))
happy


## General Grammar of Graphics
# ggplot(data = <DATA>) +
#   <GEOM_FUNCTION>(
#     mapping = aes(<MAPPINGS>),
#     stat = <STAT>,
#     position = <POSITION>
#   ) +
#   <COORDINATE_FUNCTION> +
#   <FACET_FUNCTION>


# Load the mpg data
# View(): helps viewing data
# it comes in the ggplot package

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

# add colors for the variable `cyl`

# Getting info from data
##?function
##?dataset
##?object_in_R

# View(mpg)
# str(mpg)

#http://docs.ggplot2.org/current/


ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))


ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() +
  geom_smooth()


ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))

# color barplot with cut

# now by clarity

# what about a non-stacked plot?
## use position = "dodge"


diam_fun <- data.frame(
  a = c("nice","car","cats","dogs"),
  b = c(2,3,5,77)
  )

ggplot(data = diam_fun) + 
  geom_bar(mapping = aes(x = a, y = b), stat = "identity")


ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut), width = 1) + coord_polar() +
  facet_wrap(~clarity)

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = factor(1), fill = cut), width = 1) + 
  coord_polar(theta = "y") 


# A simple plot in R
# Load packages
library(ggplot2) #loads ggplot2
# ggplot is the main function of the package ggplot2
ggplot(mtcars) + geom_point(aes(x = mpg,y = drat, color = cyl)) 

happy <- ggplot(mtcars)
happy <- happy + geom_point(aes(x = mpg,y = drat, color = cyl))
happy

#mtcars=sampledataset
#ggplot is a function -- a package is a compilation of function
# Function(all my data) + 
# geom_point is the type of chart with mpg on the x axis, drat on the y axis and in the color cyl

# to make a block of text a comment: Command + Shift + C

## General Grammar of Graphics
# ggplot(data = <DATA>) + 
#   <GEOM_FUNCTION>(
#     mapping = aes(<MAPPINGS>),
#     stat = <STAT>, 
#     position = <POSITION>
#   ) +
#   <COORDINATE_FUNCTION> +
#   <FACET_FUNCTION>

# Load the mpg data
# View(): helps viewing data
# it comes preloaded in the ggplot package

ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy))

# add colors for the variable 'cyl'
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = cyl))

# ?mpg << help function in R.. mpg is dataset.. you can do:
# ?dataset
# ?function
# ?any_object_in_R

# View(mpg)
# str(mpg) << str = structure

# Changing color to 'class' (from 'cyl')
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = class))

# Add 'cty' as the size of points
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class, size = cty))

# http://docs.ggplot2.org/current/ << shows you all the types of ggplot charts and what are the components of those charts

## Changing the geom to smooth
ggplot(data = mpg) + geom_smooth(mapping = aes(x = displ, y = hwy))

## How do you do both?
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

## How do you do both? In a neater way....
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth()

## Bar chart with diamonds....
ggplot(data = diamonds) +
  geom_bar(mapping = aes (x = cut))

## add color as cut
ggplot(data = diamonds) +
  # geom_bar(mapping = aes (x = cut, color = cut)) << Wrong
  geom_bar(mapping = aes (x = cut, fill = cut))

## Now by clarity >> automatically gives you a stacked bar chart
ggplot(data = diamonds) +
  geom_bar(mapping = aes (x = cut, fill = clarity))

## what about a non-stacked plot <- using position = "dodge"
ggplot(data = diamonds) +
  geom_bar(mapping = aes (x = cut, fill = clarity), position = "dodge")

## what about a stacked plot of percentages with total up to 100% <- using position = "fill"
ggplot(data = diamonds) +
  geom_bar(mapping = aes (x = cut, fill = clarity), position = "fill")

# Coxcomb Pie chart -- Any sort of pie chart requires the coord_polar() function
ggplot (data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = cut), width = 1) +
  coord_polar()

# Regular Pie chart
ggplot (data = diamonds) +
  geom_bar(mapping = aes(x = factor(1), fill = cut), width = 1) +
  coord_polar(theta = "y")

# Unique charts for different levels
ggplot (data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = cut), width = 1) +
  coord_polar() +
  facet_wrap(~clarity)

# Adding text labels
## Messy way
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, label = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy, label = hwy)) +
  geom_label(mapping = aes(x = displ, y = hwy, label = hwy))

## Neater way....
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, label = hwy)) +
  geom_point() +
  geom_smooth() +
  geom_label()

# Now that you know how to use aesthetics, take a moment to experiment with the mpg data set.
# 
# Map a discrete variable to color, size, alpha, and shape. Then map a continuous variable to each. Does ggplot2 behave differently for discrete vs. continuous variables?
# The discrete variables in mpg are: manufacturer, model, trans, drv, fl, class
# The continuous variables in mpg are: displ, year, cyl, cty, hwy
# Map the same variable to multiple aesthetics in the same plot. Does it work? How many legends does ggplot2 create?
# Attempt to set an aesthetic to something other than a variable name, like displ < 5. What happens?



