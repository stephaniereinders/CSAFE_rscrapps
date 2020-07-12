#' Scrape Google Play Store search results
#'
#' @param search_term getDataForApps will search the Google Play Store for apps using this search term
#' @param num_apps number of apps to return data for
#' @import rvest
#' @import xml2
#' @import dplyr
#' @importFrom purrr map_dfr
#'
#' @export
#' @return data
#'
#' @examples
#' data <- getDataForApps("steganography")
#' data <- getDataForApps("hidden", num_apps = 1)
getDataForApps <- function(search_term, num_apps = 2) {

  # # Checks
  # assert_that(
  #   # search_term needs to be a character
  #   is.character(search_term),
  #
  #   # search_term needs to be non-empty
  #   (search_term != ""),
  #
  #   # num_apps needs to be a positive integer or "all"
  #   if (is.numeric(num_apps)) {
  #     num_apps %% 1 == 0 & num_apps > 0
  #   } else {
  #     tolower(num_apps) == "all"
  #   }
  # )

  # replace any spaces in search_term with %20 to match GPS's formatting
  search_term <- gsub(" ", "%20", search_term)

  # get url for search_term
  search_url <- paste0("https://play.google.com/store/search?q=", search_term, "&c=apps")

  # get html of search_url page
  html <- read_html(search_url)

  # get links of all apps listed on search_url
  links <- html %>%
    rvest::html_nodes("body") %>%
    xml2::xml_find_all("//a[contains(@class, 'poRVub')]") %>%
    html_attr("href")

  # convert to list
  links <- as.list(links)

  # select first num_apps from the list
  if (is.numeric(num_apps) & (num_apps < length(links))) {
    links <- links[1:num_apps]
  }

  # add "https://play.google.com" to begining of each link
  links <- lapply(links, function(x) (paste0("https://play.google.com", x)))

  # get the data for each app on the search_url page
  data <- map_dfr(links, function(x) (getDataForSingleApp(x)))

  return(data)
}
