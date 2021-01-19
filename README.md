# rstudio-global-2021-calendar
Materials to create a calendar file by scraping the [rstudio::global(2021) schedule](https://global.rstudio.com/student/all_events) online

**Please feel free to improve and reshare!**

Big thanks to...
- [Kelsey Gonzalez](https://twitter.com/KelseyEGonzalez) for noticing [issue #1](https://github.com/spcanelon/rstudio-global-2021-calendar/issues/1),
- [Natalia Morandeira](https://twitter.com/Nat_Mora_) for fixing it [(PR #2)](https://github.com/spcanelon/rstudio-global-2021-calendar/pull/2), and
- [Pao Corrales](https://twitter.com/PaobCorrales) for making additional corrections [(PR #3)](https://github.com/spcanelon/rstudio-global-2021-calendar/pull/3)!

![RStudio Global Logo](rstudio-global-2021.jpg)

## Calendar files available for all events: 
### EST: [all_events_EST.ics](all_events_EST.ics)
### GMT-3: [all_events_GMT-3.ics](all_events_GMT-3.ics)

## R script: [rstudio-global-2021-schedule.R](rstudio-global-2021-schedule.R)

If you encounter an error like the one below, see [this fix in lubridate issue #928](https://github.com/tidyverse/lubridate/issues/928#issuecomment-720058799)
```
Error: Problem with `mutate()` input `start_datetime`.
x CCTZ: Unrecognized timezone: "America/New_York"
ℹ Input `start_datetime` is `lubridate::force_tzs(start_datetime, "EST", tzone_out = timezone)`.
Run `rlang::last_error()` to see where the error occurred.
```

## R Markdown file: [rstudio-global-2021-schedule.Rmd](rstudio-global-2021-schedule.Rmd)

## R Notebook: [rstudio-global-2021-schedule.nb.html](https://spcanelon.github.io/rstudio-global-2021-calendar/rstudio-global-2021-schedule.nb.html)

### Packages used

```
install.package("tidyverse")
install.package("lubridate")
install.package("rvest")
install.package("robotstxt")
install.package("calendar")
```

### If you don't want to scrape the data, you can build a calendar using a (corrected) [CSV shared by Hadley](https://twitter.com/hadleywickham/status/1351298997483425792?s=20): [schedule-from-organizers-fixed.csv](schedule-from-organizers-fixed.csv)
- Corrected/fixed means it corrects 2020 in the dates to 2021
