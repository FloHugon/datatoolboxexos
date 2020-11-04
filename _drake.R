# load all functions and packages of the research compendium
devtools::load_all()

# Configure drake plan before execution
# drake_config collects and sanitizes all the parameters and settings
#config <- drake::drake_config(
#  plan = write_plan(),             #on indique le plan qu'on utilise
#  envir = getNamespace("Exos"))    #on indique l'environnement


config <- drake::drake_config(
  plan = write_plan_final(),             #on indique le plan qu'on utilise
  envir = getNamespace("Exos"))    #on indique l'environnement
