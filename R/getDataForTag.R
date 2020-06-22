getDataForTag <- function(webpage, html_tag, html_attribute, html_attribute_value) {

  search_text <- paste0("//", html_tag, "[contains(@", html_attribute, ",'", html_attribute_value, "')]")

  data <- webpage %>%
    rvest::html_nodes('body') %>%
    xml2::xml_find_all(search_text) %>%
    rvest::html_text()

  return(data)

}
