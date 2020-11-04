# Make a R document pour automatiser
# Permet de decrire l'ordre d'execution de l'analyse

usethis::use_pipe() #pour gerer les pipes

# ----- clean workspace : permet de nettoyer l'environnement
rm(list = ls())

# ----- install/update packages : installer ou mettre a jour les dependances de packages,
#lit dans le fichier description les packages necessaires et les charge
devtools::install_deps()

# ----- install compendium package : installer le package, mettre a disposition toutes les fcts du dossier R
#devtools::install(build = FALSE) #met les fct dispo dans tout l'ordinateur,
#utile pour utilisateur qui veulent refaire notre compendium
devtools::load_all() #fct dispo dans notre projet de recherche

# ----- Knit exo dplyr : compile les exercices
#rmarkdown::render(here::here("exercices","exo_dplyr.Rmd"))

# ----- Knit exo ggplot2 : execute tout le script exo_ggplot2
#rmarkdown::render(here::here("exercices","exo_ggplot2.Rmd"))


# ----- Drake, reouvre une autre session
## Execute plan
drake::r_make() #ca a cree les targets, ce qui est demande dans le plan (_drake.r a deja loadall)

## Visualize the plan, sortie graphique dans Viewer (a droite de Help)
drake::r_vis_drake_graph(targets_only = TRUE)
drake::r_vis_drake_graph() #affiche toutes les fonctions
