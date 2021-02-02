get_titles <- function(page_number) {
  Sys.sleep(2)

  link <- paste0("https://global.rstudio.com/student/all_events?page=", page_number)

  rvest::read_html(link) %>%
    rvest::html_nodes(".session__name") %>%
    rvest::html_text()
}
