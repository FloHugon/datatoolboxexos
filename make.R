# Make a R document pour automatiser



# ----- clean workspace : permet de nettoyer l'environnement
rm(list = ls())

# ----- install/update packages : installer ou mettre a jour les dependances
devtools::install_deps()

# ----- install compendium package : installer le package, mettre a disposition toutes les fcts du dossier R
devtools::install(build = FALSE)

# ----- Knit exo dplyr : compile les exercices
rmarkdown::render(here::here("exercices","exo_dplyr.Rmd"))
