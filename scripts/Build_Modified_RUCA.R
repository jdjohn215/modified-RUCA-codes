library(tidyverse)

# crosswalk from here: http://mcdc.missouri.edu/applications/geocorr2014.html
zips.to.place <- read_csv("source-data/ZCTA_Principal_City_Place_Crosswalk.csv",
                          skip = 1) %>%
  janitor::clean_names()

# RUCA from here https://www.ers.usda.gov/data-products/rural-urban-commuting-area-codes/
ruca2010 <- readxl::read_excel("source-data/RUCA2010zipcode.xlsx", sheet = 2) %>%
  janitor::clean_names() %>%
  # remove 0 pop zips
  filter(ruca1 != 99)
ruca2010

primary.ruca.codes <- readxl::read_excel("source-data/RUCA2010zipcode.xlsx", 
                                 sheet = 3, n_max = 10) %>%
  separate(col = 1, into = c("code", "label"), sep = 3, convert = T) %>%
  mutate_if(is.character, str_squish)
primary.ruca.codes

# principal city zip codes are ZCTAs where a majority of the population
# lives in the principal city of a Metropolitan Statistical Area AND
# the zip code is given RUCA code #1 for metropolitan area core

principal.city.zips <- zips.to.place %>%
  filter(zcta5_to_placefp_allocation_factor > 0.5) %>%
  group_by(zip_code = zip_census_tabulation_area) %>%
  summarise() %>%
  # filter for zips coded to  RUCA 1
  filter(zip_code %in% ruca2010$zip_code[ruca2010$ruca1 == 1])

new.ruca <- ruca2010 %>%
  select(zip_code, state, ruca_original = ruca1) %>%
  # add labels
  inner_join(primary.ruca.codes, by = c("ruca_original" = "code")) %>%
  rename(label_original = label) %>%
  # add new RUCA code, 0 = principal city
  mutate(ruca_new = ruca_original,
         ruca_new = replace(ruca_new, zip_code %in% principal.city.zips$zip_code,
                            0),
         label_new = label_original,
         label_new = replace(label_new, ruca_new == 0, "Principal city"),
         label_new = replace(label_new, ruca_new == 1, "Suburban core")) %>%
  # add summary categories
  mutate(
    ruca6 = case_when(
      ruca_new == 0 ~ "Principal city",
      ruca_new == 1 ~ "Suburban core",
      ruca_new %in% 2:3 ~ "Exurbs",
      ruca_new %in% 4:6 ~ "Large towns (10-50k)",
      ruca_new %in% 7:9 ~ "Small towns (2.5-10k)",
    ruca_new == 10 ~ "Isolated rural"
    ),
    ruca5 = ruca6,
    ruca5 = replace(ruca5, ruca5 %in% c("Small towns (2.5-10k)",
                                        "Isolated rural"),
                    "Rural (less than 10k")
    )

new.ruca %>%
  group_by(label_new, ruca_new) %>%
  summarise(zips = n()) %>%
  arrange(ruca_new)

new.ruca %>%
  group_by(label_original, label_new, ruca6, ruca5) %>%
  summarise(zips = n())

saveRDS(new.ruca, "Modified_RUCA_Zip_Codes_2010.rds")
write_csv(new.ruca, "Modified_RUCA_Zip_Codes_2010.csv")
