# Make a R document pour automatiser
# Permet de decrire l'ordre d'execution de l'analyse

usethis::use_pipe() #pour gerer les pipes

# ----- clean workspace : permet de nettoyer l'environnement
rm(list = ls())

# ----- install/update packages : installer ou mettre a jour les dependances de packages,
#lit dans le fichier description les packages necessaires et les charge
devtools::install_deps()

# ----- install compendium package : installer le package, mettre a disposition toutes les fcts du dossier R
#devtools::install(build = FALSE) #fct dispo dans tout l'ordinateur
devtools::load_all() #fct dispo dans notre projet de recherche

# ----- Knit exo dplyr : compile les exercices
rmarkdown::render(here::here("exercices","exo_dplyr.Rmd"))
