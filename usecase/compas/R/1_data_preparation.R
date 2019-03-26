library(lubridate)
library(dplyr)
library(stringr)

cox_violent_parsed <- readr::read_csv("usecase/compas/data/cox-violent-parsed.csv")

recid <- filter(cox_violent_parsed, is_recid != -1) %>%
  mutate(race = as.factor(race)) %>%
  mutate(is_recid = as.factor(as.character(is_recid))) %>%
  filter(days_b_screening_arrest <= 30) %>%
  filter(days_b_screening_arrest >= -30) %>%
  filter(c_charge_degree != "O") %>%
  filter(score_text != 'N/A') %>%
  select(-decile_score, -(vr_charge_degree:event), -violent_recid,
         -(id:compas_screening_date), -c_case_number,
         -(r_case_number:event), -c_days_from_compas, -c_days_from_compas,
         -age_cat, -days_b_screening_arrest) %>%
  mutate(jail_days = days(as_date(c_jail_out) - as_date(c_jail_in))) %>%
  select(-c_jail_in, -c_jail_out) %>%
  mutate(jail_days = as.numeric(jail_days)/(60*60*24)) %>%
  mutate(jail_days = ifelse(jail_days < 0, NA, jail_days)) %>%
  unique() %>%
  mutate(dob = as.Date(dob, format = "%d/%m/%Y"),
         c_offense_date = as.Date(c_offense_date, format = "%d/%m/%Y")) %>%
  mutate(age_at_offense = as.numeric(days(c_offense_date - dob))/(60*60*24*365)) %>%
  select(-dob) %>%
  filter(jail_days >= 0 & !is.na(jail_days)) %>%
  mutate(c_charge_desc = str_trim(c_charge_desc)) %>%
  mutate(c_charge_desc = str_to_lower(c_charge_desc)) %>%
  unique()

save(recid, file = "usecase/data/recid.rda")
