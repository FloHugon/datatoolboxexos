# Creer mon premier Research Compendium
#Research Compendium, 3 nov 2020

#installation de rrtools pour ameliorer l'elaboration de Researah Compendium
#chercher rrtools sur GitHub
install.packages("devtools")
devtools::install_github("benmarwick/rrtools")
#telecharge le depot GitHub, choix d'aucun package

#pour obtenir le format R.Compendium
rrtools::use_compendium("../Exos/", open = FALSE)

#pour faire un fichier description : modif fichier Description
