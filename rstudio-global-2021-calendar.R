## ---- warning=FALSE-------------------------------------------------------
# loading libraries --
library(tidyverse)
library(rvest)
library(robotstxt)
library(calendar)
library(lubridate)
library(here)


## -------------------------------------------------------------------------
get_robotstxt("https://global.rstudio.com/student/all_events")


## -------------------------------------------------------------------------
html_1 <- read_html("https://global.rstudio.com/student/all_events?page=1")


## -------------------------------------------------------------------------
# event title --
title_1 <- html_1 %>%
  html_nodes(".session__name") %>%
  html_text() # specifies what format we want

# double check if the information you want was saved --
title_1

# dates --
datetime_1 <- html_1 %>%
  html_nodes(".session__dates.session__dates--index") %>%
  html_text()

datetime_1


## -------------------------------------------------------------------------
# scraping event titles --
get_titles <- name <- function(page_number) {
  Sys.sleep(2)
  
  link <- paste0("https://global.rstudio.com/student/all_events?page=", page_number)
  
  read_html(link) %>%
  html_nodes(".session__name") %>%
  html_text()  
}

# scraping event dates and times --
get_dates <- name <- function(page_number) {
  Sys.sleep(2)
  
  link <- paste0("https://global.rstudio.com/student/all_events?page=", page_number)
  
  read_html(link) %>%
  html_nodes(".session__dates.session__dates--index") %>%
  html_text()  
}


## -------------------------------------------------------------------------
get_titles(3)


## -------------------------------------------------------------------------
map(2:4, get_titles)

# then check with the website to see if it matches


## -------------------------------------------------------------------------
# titles --
titles_all <- map(1:7, get_titles) %>%
  unlist()

# dates --
dates_all <- map(1:7, get_dates) %>%
  unlist()


## -------------------------------------------------------------------------
# creating tibble from scrapes --
schedule <- 
  tibble(event_name = titles_all,
         date_time = dates_all)

schedule


## -------------------------------------------------------------------------
# defining string patterns --
str_at <- "\\s+at\\s+"
str_to <- "\\s+to\\s+"
str_EST <- " EST"
str_day <- "\\w+\\,\\s+"

# wrangling the date-time strings --
schedule_new_times <-
schedule %>%
  mutate(date = str_replace_all(date_time, pattern = str_to, "-"),
         date = str_replace_all(date, str_EST, "")) %>%
  tidyr::separate(date, sep = str_at, c("day_date", "time")) %>%
  mutate(date = str_replace(day_date, pattern = str_day, ""),
         date = lubridate::mdy(date, tz = "US/Eastern")) %>%
  mutate(date_time_new = str_c(date, time, sep = " ")) %>%
  tidyr::separate(time, sep = "-", c("start_time", "end_time"))


## -------------------------------------------------------------------------
# wrangling the dates and times --
schedule_new <-
schedule_new_times %>%
  mutate(start_datetime = str_c(date, start_time, sep = " "),
         end_datetime = str_c(date, end_time, sep = " ")) %>%
  mutate(across(c(start_datetime, end_datetime), 
                ~lubridate::ymd_hm(.x, tz = "US/Eastern"))) %>%
  select(-c(date_time, day_date, date_time_new))

# writing to CSV and RDS files --
write_csv(schedule_new, 
          here("schedule-files", "schedule_new_EST.csv"))
saveRDS(schedule_new, 
        here("schedule-files", "schedule_new_EST.Rds"))


## -------------------------------------------------------------------------
timezone <- Sys.timezone()

schedule_new_timezone <- schedule_new %>%
  mutate(start_datetime = lubridate::with_tz(start_datetime, tzone = timezone),
         end_datetime = lubridate::with_tz(end_datetime, tzone = timezone))

# writing to CSV and RDS files --
write_csv(schedule_new_timezone, 
          here("schedule-files", "schedule_new_localtz.csv"))
saveRDS(schedule_new_timezone, 
        here("schedule-files", "schedule_new_localtz.Rds"))
  


## -------------------------------------------------------------------------
# creating a function --
make_calendar <- function(event) {
  event_subset <- schedule_new_timezone[event, ]
  
  calendar_event <-
  calendar::ic_event(start_time = event_subset$start_datetime,
                     end_time = event_subset$end_datetime,
                     summary = event_subset$event_name)
  
  return(calendar_event)
}

number_events <- length(schedule_new_timezone$event_name)

# creating ics objects for all events --
events_all <- map(1:number_events, make_calendar) %>% 
  bind_rows()

# writing to .ics file --
calendar::ic_write(events_all,
                   here("calendar-files-ics", "all_events_localtime.ics"))


## ---- warning=FALSE-------------------------------------------------------
knitr::purl("rstudio-global-2021-calendar.Rmd")

