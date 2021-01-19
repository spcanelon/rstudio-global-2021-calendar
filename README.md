# rstudio-global-2021-calendar
Materials to create a calendar file by scraping the [rstudio::global(2021) schedule](https://global.rstudio.com/student/all_events) online

**Please feel free to improve and reshare!**
- Thank you [Kelsey Gonzalez](https://twitter.com/KelseyEGonzalez) for noticing [issue #1](https://github.com/spcanelon/rstudio-global-2021-calendar/issues/1) and [Natalia Morandeira](https://twitter.com/Nat_Mora_) for [fixing it](https://github.com/spcanelon/rstudio-global-2021-calendar/pull/2)!

![RStudio Global Logo](rstudio-global-2021.jpg)

## Calendar files available for all events: 
### EST: [all_events_EST.ics](all_events_EST.ics)
### GMT-3: [all_events_GMT-3.ics](all_events_GMT-3.ics)

## R script: [rstudio-global-2021-schedule.R](rstudio-global-2021-schedule.R)

## R Markdown file: [rstudio-global-2021-schedule.Rmd](rstudio-global-2021-schedule.Rmd)

## R Notebook: [rstudio-global-2021-schedule.nb.html](https://spcanelon.github.io/rstudio-global-2021-calendar/rstudio-global-2021-schedule.nb.html)

### Packages used

```
install.package("tidyverse")
install.package("rvest")
install.package("robotstxt")
install.package("calendar")
install.package("lubridate")
```

### If you don't want to scrape the data, you can build a calendar using a (corrected) [CSV shared by Hadley](https://twitter.com/hadleywickham/status/1351298997483425792?s=20): [schedule-from-organizers-fixed.csv](schedule-from-organizers-fixed.csv)
- Fixed means it corrects 2020 in the dates to 2021
