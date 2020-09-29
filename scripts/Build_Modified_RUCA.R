library(tidyverse)

# crosswalk from here: http://mcdc.missouri.edu/applications/geocorr2014.html
zips.to.place <- read_csv("source-data/AllZips2010_to_AllPlaces2014_crosswalk.csv",
                          skip = 1) %>%
  janitor::clean_names() %>%
  mutate(zip_census_tabulation_area = str_pad(zip_census_tabulation_area, width = 5, side = "left", pad = "0")) %>%
  # create properly formatted place FIPS code with state code
  mutate(place_fip = paste0(str_pad(state_code, width = 2, side = "left", pad = "0"),
                            str_pad(placefp14, width = 5, side = "left", pad = "0")))

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
# principal cities from here: https://www2.census.gov/programs-surveys/metro-micro/geographies/reference-files/2020/delineation-files/list2_2020.xls
principal.city.fips <- readxl::read_excel("source-data/ListOfCBSA_PrincipalCitiesMarch2020.xls",
                                          skip = 2) %>%
  janitor::clean_names() %>%
  # just keep METROpolitan statistical areas
  filter(metropolitan_micropolitan_statistical_area == "Metropolitan Statistical Area") %>%
  # create place FIPS code with state code
  mutate(principal_city_fip = paste0(fips_state_code, fips_place_code))

principal.city.zips <- zips.to.place %>%
  # just keep the place FIPS which are in the list of principal city place FIPS
  filter(place_fip %in% principal.city.fips$principal_city_fip) %>%
  # just keep if more than half the population lives in the principal city
  filter(zcta5_to_placefp14_allocation_factor > 0.5) %>%
  group_by(zip_code = zip_census_tabulation_area) %>%
  summarise()

# Are all the 2020 principal city places in the 2014 places list?
# all the missing ones are from Puerto Rico, which I remove from the data below
principal.city.fips$cbsa_title[! principal.city.fips$principal_city_fip %in% zips.to.place$place_fip]

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
    ) %>%
  # remove Puerto Rico
  filter(state != "PR")

new.ruca %>%
  group_by(label_new, ruca_new) %>%
  summarise(zips = n()) %>%
  arrange(ruca_new)

new.ruca %>%
  group_by(label_original, label_new, ruca6, ruca5) %>%
  summarise(zips = n())

saveRDS(new.ruca, "Modified_RUCA_Zip_Codes_2010.rds")
write_csv(new.ruca, "Modified_RUCA_Zip_Codes_2010.csv")
