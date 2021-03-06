## Load your R files
lapply(list.files("./R", full.names = TRUE), source)


## Minimal Config
drake_config(plan)


## Full Config
# drake_config(
#   plan,
#   targets = NULL,             # specify targets
#   verbose = 1L,               # show progress bar (1L seems most useful)
#   jobs = 1L,                  # allow n parallel jobs
#   jobs_preprocess = 1L,
#   retries = 0,                # optionally allow n retries
#   log_progress = FALSE,       # log progress of target building in /.drake
#   trigger = drake::trigger(), # optionally edit triggers in trigger function
#   skip_targets = FALSE,       # optionally just load files
#   skip_imports = FALSE,       # optionally just test plan
#   keep_going = FALSE,         # stop make if one target fails
#   garbage_collection = FALSE,
#   memory_strategy = "speed",  # set to "autoclean" and set garbage-colelction to TRUE to safe working memory
#   history = TRUE,             # set to true for saving make() builds in /.drake
#                               ## use with `drake_history(analyze = TRUE)`
#   log_build_times = FALSE,    # Mac users may notice a 20% speedup in make() with build_times = FALSE
#   format = NULL,
#   lock_cache = TRUE,          # However, if you interrupt make() before it can clean itself up, then the cache will stay locked, and you will need to manually unlock it with drake::drake_cache("xyz")$unlock()
# )