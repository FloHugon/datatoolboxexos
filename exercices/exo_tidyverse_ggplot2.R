## exercice 2 TidyVerse, utiliser ggplot2, 04.11.2020


devtools::load_all()
library(tidyverse) #autorise l'utilisation des pipes (%>%)

pantheria <- readr::read_delim("data/pantheria-traits/PanTHERIA_1-0_WR05_Aug2008.txt", delim = "\t")
pantheria


#transformer colonne MSW05_Order et MSW05_Family en facteur
class(pantheria$MSW05_Order) #character
as.factor(pantheria$MSW05_Order)
class(pantheria$MSW05_Family) #character

#ou avec mutate en mode "propre"
dat <- pantheria %>%
  mutate(order = as_factor(MSW05_Order), family  = as_factor(MSW05_Family)) %>% #ajoute ces deux colonnes
  janitor::clean_names() #permet de nettoyer les noms

dat <- pantheria %>%
  mutate(order = as_factor(MSW05_Order), family  = as_factor(MSW05_Family)) %>% #ajoute ces deux colonnes
  rename(adult_bodymass = "5-1_AdultBodyMass_g",
         dispersal_age  = "7-1_DispersalAge_d",
         gestation      = "9-1_GestationLen_d",
         homerange      = "22-2_HomeRange_Indiv_km2",
         litter_size    = "16-1_LittersPerYear",
         longevity      = "17-1_MaxLongevity_m")

#selection de colonne
dat <- dat %>%
  select(order, family, longevity, homerange, adult_bodymass, litter_size, dispersal_age, gestation) %>%
  na_if(-999) #met un NA si valeur = -999

dat


#cb d'obs dans la famille, dans l'ordre?
dat %>% group_by(family) %>% count()  #ou correction : dat %>% count(family)
dat %>% group_by(order) %>% count()   #ou correction : dat %>% count(order)


#quel est le home range moyen par famille, la standard deviation, la taille d'echantillon?
dat %>% group_by(family) %>%
  summarise(moyHR=mean(homerange, na.rm=T), sdHR=sd(homerange, na.rm=T), nHR=n_distinct(homerange, na.rm=T))

#ou correction :
dat %>%
  filter(!is.na(homerange)) %>% #permet d'enlever toutes les lignes avec NA sur les homerange, c'est mieux
  group_by(family) %>%
  summarise(moy=mean(homerange), sd=sd(homerange), n=n()) #n donne le nbr d'obs dans le groupe homerange(+ efficace)
