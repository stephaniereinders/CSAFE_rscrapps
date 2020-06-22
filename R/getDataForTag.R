#' getDataForTag
#'
#' Scrape an app page in the Google Play Store for information associated with a specific html tag.
#'
#' @param url The url for an app page in the Google Play Store
#' @param html_tag An html tag. E.g. "div"
#' @param html_attribute An html attribute associated with the html tag. E.g. "class"
#' @param html_attribute_value The value associated with the html attribute. E.g. "KmO8jd"
#'
#' @import rvest
#' @import xml2
#'
#' @return
#' @export
#'
#' @examples
#' getDataForTag("https://play.google.com/store/apps/details?id=com.dinaga.photosecret","div","class","KmO8jd")
#' getDataForTag("https://play.google.com/store/apps/details?id=com.dinaga.photosecret","a","class","hrTbp R8zArc")

getDataForTag <- function(url, html_tag, html_attribute, html_attribute_value) {

  search_text <- paste0("//", html_tag, "[contains(@", html_attribute, ",'", html_attribute_value, "')]")

  data <- url %>%
    rvest::html_nodes('body') %>%
    xml2::xml_find_all(search_text) %>%
    rvest::html_text()

  return(data)

}
