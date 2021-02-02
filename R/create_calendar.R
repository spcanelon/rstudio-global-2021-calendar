create_calendar <- function(event) {
  event_subset <- schedule_new_timezone[event, ]

  calendar_event <-
    calendar::ic_event(start_time = event_subset$start_datetime,
                       end_time = event_subset$end_datetime,
                       summary = event_subset$event_name)

  return(calendar_event)
}
