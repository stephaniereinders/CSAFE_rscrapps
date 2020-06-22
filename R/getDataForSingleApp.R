getDataForSingleApp <- function(app_url){

  # get developer and category
  temp <- getDataForTag(app_url, "a", "class", "hrTbp R8zArc")
  developer <- temp[1]
  category <- temp[2]

  # get audience
  audience <- getDataForTag(app_url, "div", "class", "KmO8jd")

  # get description
  description <- getDataForTag(app_url, "div", "jsname", "sngebd")

  # get rating
  rating <- as.numeric(getDataForTag(app_url, "div", "class", "BHMmbe"))
  # Not all apps have ratings. In this case, set the rating to NaN
  if (length(rating)==0){
    rating <- NaN
  }

  # get number of ratings
  num_rating <- getDataForTag(app_url, "span", "class", "EymY4b")
  # If the app doesn't have any ratings, set the number of ratings to 0. If the
  # app has ratings remove " total" from after the number of ratings. E.g. the
  # value returned from the GPS might be "120 total" so we change it to "120"
  if (length(num_rating)==0){
    num_rating <- as.numeric(0)
  } else {
    num_rating <- as.numeric(gsub(" total","",num_rating))
  }

  # Get data from additional information section of page
  temp <- getDataForTag(app_url, "span", "class", "htlgb")
  updated <- temp[1]
  size <- temp[3]
  installs <- temp[5]
  current_version <- temp[7]
  requires_Android <- temp[9]
  content_rating <- gsub("Learn More","",temp[11])
  offered_by <- temp[17]
  developer_contact <- temp[19]

  # Put in dataframe
  data <- data.frame(developer, category, audience, description, rating, num_rating, updated, size, installs, current_version, requires_Android, content_rating, offered_by, developer_contact, stringsAsFactors=FALSE)

  return(data)

}
