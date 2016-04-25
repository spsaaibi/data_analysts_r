# Setup R, Rstudio and main packages

## Install R. Visit: https://cran.r-project.org/ and select the binaries that work for your os/distribution
## Install Rstudio. Visit: https://www.rstudio.com/products/rstudio/download/ and select the binaries that work for your os/distribution
## Install Common Data Science Packages

install.packages("devtools") # install packages from github
install.packages(c("Rcpp","RcppParallel")) # install faster c++ binaries
install.packages(c("ggplot2")) # visualization library
install.packages(c("httr","readr","lubridate")) # reading urls, reading data into R, nice dates in R
install.packages(c("dplyr","tidyr")) # transform data, tidy data
install.packages(c("rmarkdown","knitr")) # nice report outputs
install.packages(c("googlesheets")) # connect to google spreasheet data