### Exercise 2 ###

# As you noticed, it often takes multiple queries to retrieve the desired information.
# This is a perfect situation in which writing a function will allow you to better structure your
# code, and give a name to a repeated task.
library(jsonlite)

base <- "https://api.spotify.com/v1/search?"
search <- paste0("q=", "Nelly")
type <- "&type=artist"
query_url <- paste0(base, search, type)
data <- fromJSON(query_url)
id <- data$artists$items$id[1]
id_query <- paste0("https://api.spotify.com/v1/artists/", id, "/top-tracks?country=US")
artist_data <- fromJSON(id_query)
track_data <- artist_data$tracks$name

# Write a function that allows you to specify an artist, and returns the top 10 tracks of that artist
get_top_10 <- function(artist) {
  base <- "https://api.spotify.com/v1/search?"
  search <- paste0("q=", artist)
  type <- "&type=artist"
  query_url <- paste0(base, search, type)
  data <- fromJSON(query_url)
  id <- data$artists$items$id[1]
  id_query <- paste0("https://api.spotify.com/v1/artists/", id, "/top-tracks?country=US")
  artist_data <- fromJSON(id_query)
  track_data <- artist_data$tracks$name
  return(track_data)
}

# What are the top 10 tracks by Nelly?
Nelly_top_10 <- get_top_10("Nelly")

### Bonus ### 
# Write a function that allows you to specify a search type (artist, album, etc.), and a string, 
# that returns the album/artist/etc. page of interest


# Search albums with the word "Sermon"

