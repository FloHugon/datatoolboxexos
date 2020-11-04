## Fonction pour realiser l'exercice dplyr, dont on a besoin dans l'exo Drake
## Mettre absolument les noms des packages devant les fonctions


#construite a partir du code exo_dplyr
extract_ursidae <- function (data) {
  data %>%
    dplyr::filter(stringr::str_detect(family, 'Ursidae')) %>%     #Selection des Ursides
    dplyr::filter(sci_name != "Ursus malayanus") %>%     #Suppression des lignes d' "Ursus malayanus"
    dplyr::select(species_id, family, common, sci_name)  #Selection des colonnes
}


#construite a partir du code exo_dplyr
join_data <- function(ursus_data, speco_data, eco_data){
  dplyr::inner_join(ursus_data, speco_data) %>% #les lignes ursus doivent etre attribuees aux ecoregions
    dplyr::inner_join(eco_data)
}


#construite a partir du code exo_dplyr
get_Necoregions <- function(data){
  data %>%
    dplyr::group_by(sci_name) %>%  #mieux de faire avec sci_name car on garde l'info sur l'sp
    dplyr::summarise(n_ecoregions = dplyr::n_distinct(ecoregion)) %>%
    dplyr::arrange(dplyr::desc(n_ecoregions))
}


#construite a partir du code exo_ggplot2
tidy_pantheria <- function(data){
  data %>%
    dplyr::mutate(order = forcats::as_factor(MSW05_Order),
                  family  = forcats::as_factor(MSW05_Family)) %>% #ajoute ces deux colonnes en facteur

    dplyr::rename(adult_bodymass = "5-1_AdultBodyMass_g",
                  dispersal_age  = "7-1_DispersalAge_d",
                  gestation      = "9-1_GestationLen_d",
                  homerange      = "22-2_HomeRange_Indiv_km2",
                  litter_size    = "16-1_LittersPerYear",
                  longevity      = "17-1_MaxLongevity_m") %>%
    dplyr::select(order, family, longevity, homerange, adult_bodymass, litter_size, dispersal_age, gestation) %>% #selec colonne
    dplyr::na_if(-999) #met un NA si valeur = -999
}



