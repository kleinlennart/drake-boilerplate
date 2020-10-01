# cant be a target, needs `rmd_files = !!pages_paths` to work
# Excludes files with underscore at the beginning (e.g. _template.Rmd)
pages_paths <- dir("reports", pattern = "^[[:alnum:]]+\\w*.Rmd", full.names = TRUE)

plan <- drake_plan(
  render_pages = target(
    command = rmarkdown::render(
      knitr_in(rmd_files),
      # output_yaml = "reports/_site.yml",
      # output_options = NULL,
      output_dir = file_out("docs/"),
      quiet = TRUE
    ),
    # “bang-bang” operator !! from tidy evaluation (very important!)
    transform = map(rmd_files = !!pages_paths),
    trigger = trigger(
      change = file.mtime("reports/_site.yml")
    ),

    # render_site = target(
    #   command = rmarkdown::render_site(
    #     input = file_in("reports"),
    #     quiet = TRUE
    #   )
    # )
  )
)


# not quite sure about the site_libs dir of render_site()...
