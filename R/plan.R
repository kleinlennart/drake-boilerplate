# needs to be outside of the drake plan for `rmd_files = !!pages_paths` to work
pages_paths <- dir("reports", pattern = "*.Rmd", full.names = TRUE)
# TODO: exclude _file.Rmd with regex in dir

plan <- drake_plan(
  render_pages = target(
    # TODO: Add a trigger dependency on _site.yml
    command = rmarkdown::render(
      knitr_in(rmd_files),
      # output_yaml = "reports/_site.yml",
      # output_options = NULL,
      output_dir = file_out("docs_pages/"),
      quiet = TRUE
    ),
    transform = map(rmd_files = !!pages_paths)
    # “bang-bang” operator !! from tidy evaluation (very important!)
  ),
  
  render_site = target(
    command = rmarkdown::render_site(
      input = file_in("reports"),
      quiet = TRUE
    )
  )
)


# not quite sure about the site_libs dir of render_site()...