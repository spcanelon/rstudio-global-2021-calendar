# Scrape-Your-Own rstudio::global(2021) calendar
Materials to create a calendar file by scraping the [rstudio::global(2021) schedule](https://global.rstudio.com/student/all_events) online

**Please feel free to improve and reshare!**

Big thanks to...
- [Kelsey Gonzalez](https://twitter.com/KelseyEGonzalez) for noticing [issue #1](https://github.com/spcanelon/rstudio-global-2021-calendar/issues/1),
- [Natalia Morandeira](https://twitter.com/Nat_Mora_) for fixing it [(PR #2)](https://github.com/spcanelon/rstudio-global-2021-calendar/pull/2),
- [Pao Corrales](https://twitter.com/PaobCorrales) for providing an additional approach [(PR #3)](https://github.com/spcanelon/rstudio-global-2021-calendar/pull/3), and
- [Jonathan Carroll](https://twitter.com/carroll_jono) for catching important typos in this README [(PR #5)](https://github.com/spcanelon/rstudio-global-2021-calendar/pull/5)!

![RStudio Global Logo](rstudio-global-2021.jpg)

## Calendar files available for all events: 
### EST: [all_events_EST.ics](calendar-files-ics/all_events_EST.ics)
### GMT-3: [all_events_GMT-3.ics](calendar-files-ics/all_events_GMT-3.ics)

---

## R script: [rstudio-global-2021-schedule.R](rstudio-global-2021-schedule.R)

If you encounter an error like the one below, see [this fix in lubridate issue #928](https://github.com/tidyverse/lubridate/issues/928#issuecomment-720058799)
```
Error: Problem with `mutate()` input `start_datetime`.
x CCTZ: Unrecognized timezone: "America/New_York"
ℹ Input `start_datetime` is `lubridate::force_tzs(start_datetime, "EST", tzone_out = timezone)`.
Run `rlang::last_error()` to see where the error occurred.
```

## R Markdown file: [rstudio-global-2021-calendar.Rmd](rstudio-global-2021-schedule.Rmd)

## R Notebook: [rstudio-global-2021-calendar.nb.html](https://spcanelon.github.io/rstudio-global-2021-calendar/rstudio-global-2021-calendar.nb.html)

### Packages used

```
install.packages("tidyverse")
install.packages("lubridate")
install.packages("rvest")
install.packages("robotstxt")
install.packages("calendar")
install.packages("here")
```

Code utilized in these materials was informed by an [R-Ladies Tunis workshop on web scraping](https://twitter.com/spcanelon/status/1351346112024752129?s=20) led by Riva Quiroga and Mohamed El Fodil Ihaddaden

---

### If you don't want to scrape the data, you can:

1. Build a calendar using a [CSV shared by RStudio](https://twitter.com/hadleywickham/status/1351298997483425792?s=20): [data/schedule-from-organizers.csv](data/schedule-from-organizers.csv)

2. Use Garrick Aden-Buie's Shiny app: https://garrick-rstudio.shinyapps.io/rstudio-global-2021/
<br>Source code for the app provided here: [gadenbuie/rstudio-global-2021-calendar](https://github.com/gadenbuie/rstudio-global-2021-calendar)
