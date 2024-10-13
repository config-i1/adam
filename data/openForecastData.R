library(zoo)
library(readr)

visits_2629777_day_2016_10_08 <- read_delim("~/Dropbox/Forecasting-web/openforecast-visits/visits_2629777_day_2016-10-08.csv",
                                            delim = ";", escape_double = FALSE,
                                            col_types = cols(Date = col_date(format = "%Y-%m-%d"),
                                                             ...8 = col_skip(), ...9 = col_skip()),
                                            trim_ws = TRUE, skip = 2)

visits_2629777_day_2018_10_08 <- read_delim("~/Dropbox/Forecasting-web/openforecast-visits/visits_2629777_day_2018-10-08.csv",
                                            delim = ";", escape_double = FALSE,
                                            col_types = cols(Date = col_date(format = "%Y-%m-%d"),
                                                             ...8 = col_skip(), ...9 = col_skip()),
                                            trim_ws = TRUE, skip = 2)

visits_2629777_day_2020_10_08 <- read_delim("~/Dropbox/Forecasting-web/openforecast-visits/visits_2629777_day_2020-10-08.csv",
                                            delim = ";", escape_double = FALSE,
                                            col_types = cols(Date = col_date(format = "%Y-%m-%d"),
                                                             ...8 = col_skip(), ...9 = col_skip()),
                                            trim_ws = TRUE, skip = 2)

visits_2629777_day_2022_10_08 <- read_delim("~/Dropbox/Forecasting-web/openforecast-visits/visits_2629777_day_2022-10-08.csv",
                                            delim = ";", escape_double = FALSE,
                                            col_types = cols(Date = col_date(format = "%Y-%m-%d"),
                                                             ...8 = col_skip(), ...9 = col_skip()),
                                            trim_ws = TRUE, skip = 2)

visits_2629777_day_2024_10_08 <- read_delim("~/Dropbox/Forecasting-web/openforecast-visits/visits_2629777_day_2024-10-08.csv",
                                            delim = ";", escape_double = FALSE,
                                            col_types = cols(Date = col_date(format = "%Y-%m-%d"),
                                                             ...8 = col_skip(), ...9 = col_skip()),
                                            trim_ws = TRUE, skip = 2)

(visits_2629777_day_2016_10_08)
(visits_2629777_day_2018_10_08)
(visits_2629777_day_2020_10_08)
(visits_2629777_day_2022_10_08)
visits_2629777_day_2024_10_08

openForecastVisits <- as.data.frame(rbind(visits_2629777_day_2016_10_08,
                                          visits_2629777_day_2018_10_08[-1,],
                                          visits_2629777_day_2020_10_08,
                                          visits_2629777_day_2022_10_08[-1,],
                                          visits_2629777_day_2024_10_08))
openForecastVisitsDate <- as.Date(openForecastVisits$Date)
openForecastVisits <- zoo(openForecastVisits$Visitors, order.by=openForecastVisitsDate)
# Drop last 4 observations - the server was down
openForecastVisits <- openForecastVisits[1:(length(openForecastVisits)-4)]

plot(openForecastVisits)

save(openForecastVisits, file="data/openForecastVisits.Rdata")
