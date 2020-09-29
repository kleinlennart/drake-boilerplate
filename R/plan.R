# also exclude files with underscore

# https://rdrr.io/github/webbedfeet/coursedown/src/inst/templates/_drake.R


# pages_paths <- fs::dir_ls("reports/", glob = "*.Rmd")

pages_paths <- dir("reports", pattern = "*.Rmd", full.names = TRUE)

# pages_paths <- c("reports/analysis.Rmd", "reports/dataset.Rmd",
#                 "reports/dependencies.Rmd", "reports/descriptives.Rmd",
#                 "reports/index.Rmd")
plan <- drake_plan(

  # TODO: Trigger dependency on _site.yml
  # TODO: exclude _file.Rmd with regex in dir
  render_pages = target(
    command = rmarkdown::render(
      knitr_in(rmd_files),
      output_dir = file_out("docs/"),
      quiet = TRUE
    ),
    transform = map(rmd_files = !!pages_paths) # the `!!` does it all but I don't know how and why
  )
)

# plot(plan)
# vis_drake_graph(plan)
