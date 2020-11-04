#' Write basic plan
#'
#' @return A drake plan
#' @export
#'
#' @importFrom drake drake_plan
#' @examples
write_plan <- function() {
  drake::drake_plan(

    #load data
    eco = data_ecoregions(),
    sp_eco = data_mammals_ecoregions(),
    sp = data_mammals(),
    pantheria = data_pantheria(),

    #on reprend le travail de l'exo dplyr
    ursus = extract_ursidae(sp),
    ursus_eco = join_data(ursus, sp_eco, eco),
    ursus_Neco = get_Necoregions(ursus_eco),
    pantheria_tidy = tidy_pantheria(pantheria)
  )
}
#on ecrit une fct pour faire le plan de drake
#4 targets = eco_list, sp_eco, sp_list, pentheria / a droite ce sont les command



#' Write final plan
#'
#' @return A drake plan
#' @export
#'
#' @examples
write_plan_final <- function() {
  drake::drake_plan(

    # load data
    eco = data_ecoregions(),
    sp_eco = data_mammals_ecoregions(),
    sp = data_mammals(),
    pantheria = data_pantheria(),

    #on reprend le travail de l'exo dplyr
    ursus = extract_ursidae(sp),
    ursus_eco = join_data(ursus, sp_eco, eco),
    ursus_Neco = get_Necoregions(ursus_eco),
    pantheria_tidy = tidy_pantheria(pantheria),

    # figures
    fig1 = plot_necoregions(ursus_Neco),
    fig2 = plot_gestation(pantheria_tidy),
    fig3 = get_worldmap(ursus_eco),

    # output
    out_fig1 = save_plot(fig1, "figure1_necoregions"),
    out_fig2 = save_plot(fig2, "figure2_gestation"),
    out_fig3 = save_plot(fig3, "figure3_worldmap"),

    # report
    report = rmarkdown::render(
      drake::knitr_in("output/text/report_Ursidae_drake.Rmd"),
      output_file = drake::file_out("output/text/report_Ursidae_drake.html"),
      quiet = FALSE,
      output_dir = "output/text/"
    )
  )
}
