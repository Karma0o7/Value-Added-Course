# IMPORTING LIBRARIES
library(rvest)
library(dplyr)
library(robotstxt)

#Checking whether website can be scrapped
path = paths_allowed("https://www.imdb.com/search/title/?groups=top_250&sort=user_rating")

# SCRAPPING WEBSITE
link <- 
  "https://www.imdb.com/search/title/?groups=top_250&sort=user_rating"

# HTML ELEMENTS FROM WEBSITE
web <- read_html(link)

# SEGREGATING NAMES
name <- web %>% 
  html_nodes(".lister-item-header a")%>% html_text()

# VIEWING NAME LIST
View(name)


# SEGREGATING RATINGS
rating <- web %>% 
  html_nodes(".ratings-imdb-rating strong") %>% html_text()

# VIEW RATINGS LIST
View(rating)


# CREATING DATAFRAME
meta.ratings <- data.frame(name, rating)

# VIEW DATAFRAME
View(meta.ratings)

# SAVING DATA
write.csv (meta.ratings, "My_movie data.csv")

