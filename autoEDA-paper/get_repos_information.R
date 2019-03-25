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
  "funModeling", "visdat", "SmartEDA"
)
users <- list(
  "sicarul", "eheinzen", "ekstroem",
  "boxuancui", "choonghyunryu", "XanderHorn",
  "pablo14", "ropensci", "cran"
)
## Download data from GitHub ----
### Number of stars
stars <- lapply(
  1:length(pkgs),
  function(x)
    unlist(lapply(1:3, function(y) content(GET(
      url = paste0("https://api.github.com/repos/", users[[x]], "/", pkgs[[x]],
                   "/stargazers?per_page=100&page=", y))
    )),
           recursive = FALSE)

)
# asave(stars, ".")
# "5dd43cd9340508c7771345b52d98ca59"
### Number of forks
forks <- lapply(
    1:length(pkgs),
    function(x) content(GET(
      url = paste0("https://api.github.com/repos/", users[[x]], "/", pkgs[[x]],
                   "/forks?per_page=100&page=1&client_id=mstaniak"))
    )
  )
# asave(forks, ".")
# "e33a399d437aaf2c3e161ee8a1fd9271"
### Number of commits
commits <- lapply(
  1:length(pkgs),
  function(x)
      unlist(lapply(1:6, function(y) content(GET(
        url = paste0("https://api.github.com/repos/", users[[x]], "/", pkgs[[x]],
                     "/commits?per_page=100&page=", y, "&client_id=mstaniak"))
      )),
      recursive = FALSE)
)
# asave(commits, ".")
# "06600bb7834fa1e20139f915974923c6"
### Number of contributors
contributors <- lapply(
  1:length(pkgs),
  function(x) content(GET(
    url = paste0("https://api.github.com/repos/", users[[x]], "/", pkgs[[x]],
                 "/contributors"))
  )
)
# asave(contributors, ".")
# "df423237257e9b2b6d589e3fd9914bc6"
### Number of issues
issues <- lapply(
  1:length(pkgs),
  function(x)
    unlist(lapply(1:2, function(y) content(GET(
      url = paste0("https://api.github.com/repos/", users[[x]], "/", pkgs[[x]],
                   "/issues?state=all&client_id=mstaniak&per_page=100&page=", y))
    )),
    recursive = FALSE)
)
# asave(issues, ".")
# "48657efba4a09fb16cb4aca84005c6d5"
## Download data from CRAN ----
### Number of CRAN downloads
cran_downloads_pkgs <- cran_downloads(
  packages = unlist(pkgs),
  from = "2010-10-10",
  to = "2019-03-24"
)
# asave(cran_downloads_pkgs, ".")
# "e471d70a93d1aa208d18b7155d551f5b"
ggplot(filter(cran_downloads_pkgs, count > 0),
       aes(x = date, y = count, color = package)) +
  theme_bw() +
  geom_smooth(se = F) +
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
  filter(count > 0) %>%
  summarise(all_downloads = sum(count),
            release_date = min(date)) %>%
  arrange(desc(all_downloads)) %>%
  left_join(stars_df) %>%
  left_join(commits_df) %>%
  left_join(contributors_df) %>%
  left_join(issues_df) %>%
  left_join(forks_df) %>%
  mutate(release_date = as.character(release_date))
# asave(pkgs_table, ".")
# "56e9ff705385c2247a2962cc85e4473f"
pkgs_table %>%
  rename(`CRAN downloads` = all_downloads,
         `CRAN release` = release_date) %>%
  xtable()
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
