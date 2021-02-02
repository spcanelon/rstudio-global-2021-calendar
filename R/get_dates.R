#' Title
#'
#' @param page_number
#'
#' @return
#' @export
#'
#' @examples
get_dates <- function(page_number) {
  Sys.sleep(2)

  link <- paste0("https://global.rstudio.com/student/all_events?page=", page_number)

  rvest::read_html(link) %>%
    rvest::html_nodes(".session__dates.session__dates--index") %>%
    rvest::html_text()
}
