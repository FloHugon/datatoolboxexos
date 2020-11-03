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

#deplacer readme dans dossier data
#en creer un autre pour le projet
rrtools::use_readme_rmd()
#efface conduct and contributing (pas besoin ici)

#pour installer tous les packages present dans le fichier description (champ Imports)
#si deja les packages, R va les mettre a jour
devtools::install_deps()

#generer la documentation des fonctions, cree le dossier man
devtools::document()

#construire les elements du package
#onglet Build entre Connections et Git (pas entre Session et Debug)
#charge automatiquement notre package
library(Exos)
?Exos::data_ecoregions() #cree un package avec nos fonctions

#verifier notre package
devtools::check()
#verifie qu'on a pas des = mais des <-
#on ignore les warnings et les notes, ne sont pas des erreurs, on les comprends

#permet de charger les donnees
devtools::load_all()
