# Creer mon premier Research Compendium
#Research Compendium, 3 nov 2020

#installation de rrtools pour ameliorer l'elaboration de Researah Compendium
#chercher rrtools sur GitHub
install.packages("devtools")
devtools::install_github("benmarwick/rrtools")
#telecharge le depot GitHub, choix d'aucun package

#pour obtenir le format R.Compendium
rrtools::use_compendium("../Exos/", open = FALSE) #repondre yes aux deux questions

#pour faire un fichier description : modif fichier Description

#premiere fonction pour lire les donnees dont on aura besoin dans les differents exercices
usethis::use_r("data_wildfinder") #cree fichier R pour fct

#ajout des packages dont on a besoin
usethis::use_package("here")
usethis::use_package("readr")
