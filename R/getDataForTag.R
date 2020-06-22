#' getDataForTag
#'
#' Scrape an app page in the Google Play Store for information associated with a specific html tag.
#'
#' @param webpage The html for an app page in the Google Play Store
#' @param html_tag An html tag. E.g. "div"
#' @param html_attribute An html attribute associated with the html tag. E.g. "class"
#' @param html_attribute_value The value associated with the html attribute. E.g. "KmO8jd"
#'
#' @return
#' @export
#'
#' @examples
#' webpage <- read_html("https://play.google.com/store/apps/details?id=com.dinaga.photosecret")
#' getDataForTag(webpage,"div","class","KmO8jd")
#' getDataForTag(webpage,"a","class","hrTbp R8zArc")

getDataForTag <- function(webpage, html_tag, html_attribute, html_attribute_value) {

  search_text <- paste0("//", html_tag, "[contains(@", html_attribute, ",'", html_attribute_value, "')]")

  data <- webpage %>%
    rvest::html_nodes('body') %>%
    xml2::xml_find_all(search_text) %>%
    rvest::html_text()

  return(data)

}
