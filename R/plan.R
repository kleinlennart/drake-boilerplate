plan <- drake_plan(
  imported_data = get_data(),

  tidy_data = FUN(imported_data),

  transformed_data = FUN(tidy_data),

  model_data = FUN(transformed_data),


  make_visuals = FUN(model_data, ), # use dynamic subtarget for all plots


  report = rmarkdown::render(
    knitr_in("reports/Test.Rmd"),
    output_file = file_out("../docs/Test.html"),
    quiet = TRUE
  ),

  render_site = rmarkdown::render_site(
    input = file_in("reports/"),
    quiet = FALSE
      
      ),


  final_data = FUN,

  export_data = saveRDS(final_data, file_out("data/output/final_data.rds"))
)
