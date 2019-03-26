# Get information about developments and usage of autoEDA packages.
## Load libraries ----
library(dplyr)
library(httr)
library(cranlogs)
library(archivist)
library(lubridate)
library(ggplot2)
### Setup archivist
setLocalRepo(".")
## List packages and maintainers ----
pkgs <- list(
  "xray", "arsenal", "dataMaid",
  "DataExplorer", "dlookr", "autoEDA",
  "funModeling", "visdat", "SmartEDA",
  "summarytools", "exploreR", "RtutoR"
)
users <- list(
  "sicarul", "eheinzen", "ekstroem",
  "boxuancui", "choonghyunryu", "XanderHorn",
  "pablo14", "ropensci", "cran",
  "dcomtois", "cran", "anup50695"
)
## Download data from GitHub ----
### Number of stars
stars <- lapply(
  1:length(pkgs),
  function(x)
    unlist(lapply(1:3, function(y) content(GET(
      url = paste0("https://api.github.com/repos/", users[[x]], "/", pkgs[[x]],
                   "/stargazers?access_token=ba1355603134b281bf18295bcb39ac4d7211fcc8&per_page=100&page=", y))
    )),
           recursive = FALSE)

)
# asave(stars, ".")
# "2dbb878d8b8ed530395c72e16f250060"
# stars <- aread("2dbb878d8b8ed530395c72e16f250060")
### Number of forks
forks <- lapply(
    1:length(pkgs),
    function(x) content(GET(
      url = paste0("https://api.github.com/repos/", users[[x]], "/", pkgs[[x]],
                   "/forks?access_token=ba1355603134b281bf18295bcb39ac4d7211fcc8&per_page=100&page=1&client_id=mstaniak"))
    )
  )
# asave(forks, ".")
# "f9c5c973db0435f9cc33c771ce0eeb72"
# forks <- aread("f9c5c973db0435f9cc33c771ce0eeb72")
### Number of commits
commits <- lapply(
  1:length(pkgs),
  function(x)
      unlist(lapply(1:9, function(y) content(GET(
        url = paste0("https://api.github.com/repos/", users[[x]], "/", pkgs[[x]],
                     "/commits?per_page=100&page=", y,
                     "&access_token=ba1355603134b281bf18295bcb39ac4d7211fcc8"))
      )),
      recursive = FALSE)
)
# asave(commits, ".")
# "fc607fdc773ff48287bcea8ba5d574bf"
# commits <- aread("fc607fdc773ff48287bcea8ba5d574bf")
### Number of contributors
contributors <- lapply(
  1:length(pkgs),
  function(x) content(GET(
    url = paste0("https://api.github.com/repos/", users[[x]], "/", pkgs[[x]],
                 "/contributors?access_token=ba1355603134b281bf18295bcb39ac4d7211fcc8"))
  )
)
# asave(contributors, ".")
# "4b5d35082facfa8ea6157040cbc980e6"
# contributors <- aread("4b5d35082facfa8ea6157040cbc980e6")
### Number of issues
issues <- lapply(
  1:length(pkgs),
  function(x)
    unlist(lapply(1:2, function(y) content(GET(
      url = paste0("https://api.github.com/repos/", users[[x]], "/", pkgs[[x]],
                   "/issues?state=all&access_token=ba1355603134b281bf18295bcb39ac4d7211fcc8&per_page=100&page=", y))
    )),
    recursive = FALSE)
)
# asave(issues, ".")
# "fc51661342be71242018b3f10687df06"
# issues <- aread("fc51661342be71242018b3f10687df06")
## Download data from CRAN ----
### Number of CRAN downloads
cran_downloads_pkgs <- cran_downloads(
  packages = unlist(pkgs),
  from = "2010-10-10",
  to = "2019-03-26"
)
# asave(cran_downloads_pkgs, ".")
# "52ec582b95f35297596d1bc1138b1f79"
# cran_downloads_pkgs <- aread("52ec582b95f35297596d1bc1138b1f79")
ggplot(filter(cran_downloads_pkgs, count > 0),
       aes(x = date, y = count, color = package)) +
  theme_bw() +
  geom_smooth(se = F, size = 1.2) +
  ylab("number of CRAN downloads")
make_df <- function(x) {
  counts <- x %>%
    lapply(length) %>%
    unlist()
  names(counts) <- pkgs
  counts %>%
    tibble::enframe() %>%
    rename(package = name)
}
issues_df <- make_df(issues) %>%
  rename(issues = value)
forks_df <- make_df(forks) %>%
  rename(forks = value)
contributors_df <- make_df(contributors) %>%
  rename(contributors = value)
commits_df <- make_df(commits) %>%
  rename(commits = value)
stars_df <- make_df(stars) %>%
  rename(stars = value)
pkgs_table <- cran_downloads_pkgs %>%
  group_by(package) %>%
  filter(count > 0 | package == "autoEDA") %>%
  summarise(all_downloads = sum(count),
            release_date = min(date)) %>%
  arrange(desc(all_downloads)) %>%
  left_join(stars_df) %>%
  left_join(commits_df) %>%
  left_join(contributors_df) %>%
  left_join(issues_df) %>%
  left_join(forks_df) %>%
  mutate(release_date = as.character(release_date)) %>%
  mutate(release_date = ifelse(package == "autoEDA", "-", release_date))
# asave(pkgs_table, ".")
# "bdc8544ff612c86a092eee86cb1ed111"
pkgs_table %>%
  rename(`CRAN downloads` = all_downloads,
         `CRAN release` = release_date) %>%
  xtable::xtable()
## First commit
commit_dates <- lapply(commits,
       function(x)
         unlist(lapply(x, function(y) y$commit$author$date))
  )
commit_dates_df <- 1:length(commit_dates) %>%
  lapply(function(x) tibble(package = pkgs[[x]],
                            commit_date = commit_dates[[x]])) %>%
  bind_rows()
commits_time <- commit_dates_df %>%
  mutate(commit_date = ymd_hms(commit_date)) %>%
  mutate(commit_day = floor_date(commit_date, "day")) %>%
  group_by(package, commit_day) %>%
  summarise(daily_commits = n())
# ggplot(commits_time, aes(x = commit_day, y = daily_commits,
#                          color = package)) +
#   theme_bw() +
#   geom_smooth(se = F)
# Cumulative plot by Przemek
archivist::aread("mstaniak/autoEDA-resources/autoEDA-paper/52ec") -> stats

library(scales)
library(ggplot2)
library(dplyr)
stats %>%
  filter(date > "2014-01-01" ) %>%
  arrange(date) %>%
  group_by(package) %>%
  mutate(cums = cumsum(count),
         packages = paste0(package, " (",max(cums),")"))  -> stat

stat$packages <- reorder(stat$packages, stat$cums, function(x)-max(x))

ggplot(stat, aes(date, cums, color = packages)) +
  geom_step() +
  scale_x_date(name="",breaks = as.Date(c("2014-01-01","2015-01-01","2016-01-01","2017-01-01","2018-01-01","2019-01-01")),
               labels = c(2014:2019))+
  scale_y_continuous(name = "", labels = comma) + DALEX::theme_drwhy()+
  theme(legend.position = "right", legend.direction = "vertical")+
  scale_color_discrete(name="") +
  ggtitle("Total number of downloads", "Based on CRAN statistics")

stats %>%
  filter(count > 0) %>%
  group_by(package) %>%
  summarise(num_downloads = sum(count),
            first_day_cran = min(date),
            today = today() - days(1)) %>%
  arrange(-num_downloads) %>%
  mutate(difference = interval(first_day_cran, today)) %>%
  mutate(years = difference %/% years(1),
         months = difference %/% months(1) - 12*(years)) %>%
  select(-difference, -first_day_cran, -today)
