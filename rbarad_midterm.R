
library(sf)
library(tidyverse)
library(kableExtra)
library(tidycensus)

house_data <- st_read("https://raw.githubusercontent.com/mafichman/musa_5080_2023/main/Midterm/data/2023/studentData.geojson") %>%
  filter(sale_price != 0)

planning_districts <- st_read("https://opendata.arcgis.com/datasets/0960ea0f38f44146bb562f2b212075aa_0.geojson")
sanitation_areas <- st_read("https://opendata.arcgis.com/datasets/472c504f650242f4be612d8320b89c86_0.geojson")
redevelopment_areas <- st_read("https://data-phl.opendata.arcgis.com/datasets/80f2c71305f5493c8e0aab9137354844_0.geojson") %>%
  dplyr::filter(TYPE == 'Redevelopment Area Plan and Blight Certification' & STATUS == 'Active' & NAME != "POINT BREEZE AND GRAYS FERRY")

ggplot()+
  geom_sf(data=house_data,aes(colour = q5(sale_price)),size=0.5)+
  geom_sf(data=planning_districts,fill='transparent',color='black')

ggplot()+
  geom_sf(data=house_data,aes(colour = q5(sale_price)),size=0.5)+
  geom_sf(data=sanitation_areas,fill='transparent',color='black')

ggplot()+
  geom_sf(data=house_data,aes(colour = q5(sale_price)),size=0.5)+
  geom_sf(data=planning_districts,fill='transparent',color='red',linewidth=1)+
  geom_sf(data=redevelopment_areas,fill='transparent',color='black')


