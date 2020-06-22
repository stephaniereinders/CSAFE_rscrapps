#' getDataForTag
#'
#' Scrape an app page in the Google Play Store for information associated with a specific html tag.
#'
#' @param app_url The url for an app page in the Google Play Store
#' @param html_tag An html tag. E.g. "div"
#' @param html_attribute An html attribute associated with the html tag. E.g. "class"
#' @param html_attribute_value The value associated with the html attribute. E.g. "KmO8jd"
#'
#' @return data
#' @export
#'
#' @import rvest
#' @import xml2
#' @import magrittr
#'
#' @examples
#' app_url <- "https://play.google.com/store/apps/details?id=com.dinaga.photosecret"
#' getDataForTag(app_url,"div","class","KmO8jd")
#' getDataForTag(app_url, "a","class","hrTbp R8zArc")

getDataForTag <- function(app_url, html_tag, html_attribute, html_attribute_value) {

  search_text <- paste0("//", html_tag, "[contains(@", html_attribute, ",'", html_attribute_value, "')]")

  data <- app_url %>%
    read_html() %>%
    html_nodes('body') %>%
    xml2::xml_find_all(search_text) %>%
    html_text()

  return(data)

}
