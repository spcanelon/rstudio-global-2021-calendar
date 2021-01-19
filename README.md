# rstudio-global-2021-calendar
Materials to create a calendar file from the [rstudio::global(2021) schedule](https://global.rstudio.com/student/all_events) online

**Please feel free to improve and reshare!**

**Help wanted in [issue #1](https://github.com/spcanelon/rstudio-global-2021-calendar/issues/1):** Time zones are my nemeses and the script is currently only useful for people on Eastern time. For the time being folks need to change the time zone (`tz`) on [lines 114 and 115](https://github.com/spcanelon/rstudio-global-2021-calendar/blob/b90af4f02982b1d82ce8473d2f0aff5c9b467dde/rstudio-global-2021-schedule.R#L114), from `"EST"` to that of their location.

![RStudio Global Logo](rstudio-global-2021.jpg)

## Calendar file for all events: [all_events.ics](all_events.ics)

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
