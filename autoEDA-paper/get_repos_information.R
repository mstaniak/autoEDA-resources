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
  "summarytools", "exploreR", "RtutoR",
  "explore", "inspectdf", "ExPanDaR"
)
users <- list(
  "sicarul", "eheinzen", "ekstroem",
  "boxuancui", "choonghyunryu", "XanderHorn",
  "pablo14", "ropensci", "cran",
  "dcomtois", "cran", "anup50695",
  "rolkra", "alastairrushworth", "joachim-gassen"
)
## Download data from GitHub ----
### Number of stars
stars <- lapply(
  1:length(pkgs),
  function(x)
    unlist(lapply(1:4, function(y) content(GET(
      url = paste0("https://api.github.com/repos/", users[[x]], "/", pkgs[[x]],
                   "/stargazers?access_token=556513e02c4e3fec008bc889a7a0ebf956d9c8e1&client_id=mstaniak&per_page=100&page=", y))
    )),
           recursive = FALSE)

)
# asave(stars, ".")
# "145b6f387784dc85df6d9c1d0cfaa59e"
# stars <- aread("145b6f387784dc85df6d9c1d0cfaa59e")
### Number of forks
forks <- lapply(
    1:length(pkgs),
    function(x) content(GET(
      url = paste0("https://api.github.com/repos/", users[[x]], "/", pkgs[[x]],
                   "/forks?access_token=556513e02c4e3fec008bc889a7a0ebf956d9c8e1&per_page=100&page=1&client_id=mstaniak"))
    )
  )
# asave(forks, ".")
# "c4857f5011309f328e29e81dad30df0f"
# forks <- aread("c4857f5011309f328e29e81dad30df0f")
### Number of commits
commits <- lapply(
  1:length(pkgs),
  function(x)
      unlist(lapply(1:10, function(y) content(GET(
        url = paste0("https://api.github.com/repos/", users[[x]], "/", pkgs[[x]],
                     "/commits?per_page=100&page=", y,
                     "&access_token=556513e02c4e3fec008bc889a7a0ebf956d9c8e1&client_id=mstaniak"))
      )),
      recursive = FALSE)
)
# asave(commits, ".")
# "2ca1e75e7957ebaeb70c59a51d24ab8b"
# commits <- aread("2ca1e75e7957ebaeb70c59a51d24ab8b")
### Number of contributors
contributors <- lapply(
  1:length(pkgs),
  function(x) content(GET(
    url = paste0("https://api.github.com/repos/", users[[x]], "/", pkgs[[x]],
                 "/contributors?access_token=556513e02c4e3fec008bc889a7a0ebf956d9c8e1&client_id=mstaniak"))
  )
)
# asave(contributors, ".")
# "23d58aa3764c3efbe32eea4b04ad219c"
# contributors <- aread("23d58aa3764c3efbe32eea4b04ad219c")
### Number of issues
issues <- lapply(
  1:length(pkgs),
  function(x)
    unlist(lapply(1:2, function(y) content(GET(
      url = paste0("https://api.github.com/repos/", users[[x]], "/", pkgs[[x]],
                   "/issues?state=all&access_token=556513e02c4e3fec008bc889a7a0ebf956d9c8e1&client_id=mstaniak&per_page=100&page=", y))
    )),
    recursive = FALSE)
)
# asave(issues, ".")
# "aec41603cd4d15aa3004d55c2eb2ac13"
# issues <- aread("aec41603cd4d15aa3004d55c2eb2ac13")
## Download data from CRAN ----
### Number of CRAN downloads
cran_downloads_pkgs <- cran_downloads(
  packages = unlist(pkgs),
  from = "2010-10-10",
  to = "2019-07-12"
)
# asave(cran_downloads_pkgs, ".")
# ""aec96610995784bdd2cb4aaba5a45618"
# cran_downloads_pkgs <- aread("aec96610995784bdd2cb4aaba5a45618")
ggplot(filter(cran_downloads_pkgs, count > 0),
       aes(x = date, y = count, color = package)) +
  theme_bw() +
  geom_smooth(se = F, size = 1.2) +
  ylab("number of CRAN downloads") +
  DALEX::theme_drwhy()
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
# "50a749c73445c034ec7c9530da8e0a61"
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
stats <- cran_downloads_pkgs
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

package_age <- stats %>%
  filter(count > 0 | package == "autoEDA") %>%
  group_by(package) %>%
  summarise(num_downloads = sum(count),
            first_day_cran = min(date),
            today = today() - days(1)) %>%
  arrange(-num_downloads) %>%
  mutate(difference = interval(first_day_cran, today)) %>%
  mutate(years = difference %/% years(1),
         months = difference %/% months(1) - 12*(years)) %>%
  select(-difference, -first_day_cran, -today) %>%
  arrange(package) %>%
  mutate(age = paste(paste0(years, "y"), paste0(months, "m")))

pkgs_table_2 <- pkgs_table %>%
  rename(`CRAN downloads` = all_downloads,
         `CRAN release` = release_date) %>%
  arrange(package)
pkgs_table_2$age <- package_age$age

pkgs_table_2 <- mutate(pkgs_table_2, age = ifelse(package == "autoEDA", "-", age))
select(pkgs_table_2, package, `CRAN downloads`, `CRAN release`, age, stars, commits,
       contributors, issues, forks) %>%
  xtable::xtable()
