#' getDataForSingleApp
#'
#' Scrape an app page in the Google Play Store for information associated with a number of html tags.
#'
#' @param app_url The url for an app page in the Google Play Store
#'
#' @return data
#' @export
#'
#' @importFrom assertthat assert_that
#'
#' @examples
#' app_url <- "https://play.google.com/store/apps/details?id=com.dinaga.photosecret"
#' getDataForSingleApp(app_url)

getDataForSingleApp <- function(app_url){

  # Checks
  assert_that(
    # app_url needs to be a character
    is.character(app_url),

    # app_url must start with the string "https://play.google.com/store/apps/details?id="
    startsWith(app_url, "https://play.google.com/store/apps/details?id=")
    )

  # get app name
  name <- getDataForTag(app_url,"h1","class","AHFaub")

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
    num_rating <- gsub(" total", "", num_rating)
    num_rating <- as.numeric(gsub(",", "", num_rating))
  }

  # Get data from additional information section of page
  temp <- getDataForTag(app_url, "span", "class", "htlgb")
  if (length(temp)==22){
  updated <- temp[1]
  size <- temp[3]
  installs <- temp[5]
  current_version <- temp[7]
  requires_Android <- temp[9]
  content_rating <- gsub("Learn More","",temp[11])
  in_app_products <- temp[13]
  permissions <- temp[15]
  report <- temp[17]
  offered_by <- temp[19]
  developer_contact <- temp[21]
  } else {
    updated <- temp[1]
    size <- temp[3]
    installs <- temp[5]
    current_version <- temp[7]
    requires_Android <- temp[9]
    content_rating <- gsub("Learn More","",temp[11])
    in_app_products <- "NA"
    permissions <- temp[13]
    report <- temp[15]
    offered_by <- temp[17]
    developer_contact <- temp[19]
  }

  # Put in dataframe
  data <- data.frame(name, developer, category, audience, description, rating, num_rating, updated, size, installs, current_version, requires_Android, content_rating, in_app_products, offered_by, developer_contact, stringsAsFactors=FALSE)

  return(data)

}
