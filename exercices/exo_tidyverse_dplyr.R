## exercice 1 TidyVerse, utiliser dplyr, 03.11.2020

devtools::load_all()

#import des trois fichiers
sp_eco <- Exos::data_mammals_ecoregions()
eco <- data_ecoregions()
sp <- data_mammals()


#selection des sp d'ursides
table(sp$family) #Ursidae
sp %>% filter(str_detect(family, 'Ursidae'))
ursus <- sp %>%
  filter(str_detect(family, 'Ursidae')) %>%   #Selection des Ursides
  filter(sci_name != "Ursus malayanus") %>%   #Suppression des lignes d' "Ursus malayanus"
  select(species_id, family, common, sci_name)


#joindre les tables ursus et ecoregions_sp, puis ecoregion
ursus
which(sp_eco$species_id=="14932") #6 ecoregions ont l'sp 14932, Giant Panda
which(sp_eco$species_id=="14934") #39 ecoregions ont l'sp 14934, Sun Bear

inner_join(ursus, sp_eco) #les lignes ursus doivent etre attribuees aux ecoregions
ursus_eco <- inner_join(ursus, sp_eco) %>%
  inner_join(eco)


#cb de royaume, biome, d'ecoregion uniques a t'on pour chaque sp
ursus_eco %>%
  group_by(as.factor(species_id)) %>%
  summarise(ecoregion, realm, biome) #false version

ursus_n <- ursus_eco %>%
  group_by(sci_name) %>%  #mieux de faire avec sci_name car on garde l'info sur l'sp
  summarise(n_realm = n_distinct(realm), n_biome = n_distinct(biome), n_eco = n_distinct(ecoregion))


#combinons tout
ursus_all <- inner_join(ursus_n, ursus) %>%
  select(sci_name, species_id, family, common, n_realm, n_biome, n_eco) %>% #permet d'organiser l'ordre des colonnes
  arrange(desc(n_eco)) #classe le tableau par ordre decroissant des ecoregions

