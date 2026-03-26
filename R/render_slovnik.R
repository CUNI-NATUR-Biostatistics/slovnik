#--------------------------------------------------------------------#
#
#
#               Biostatistics – Glossary (slovnik)
#
#                       render_slovnik
#          1. Generate pojmy.yaml from glossary_data.yaml
#          2. Render slovnik_pojmu.qmd to docs/
#
#                        Ondřej Mottl
#                            2026
#
#--------------------------------------------------------------------#

#----# Setup ----#

library(here)

here::i_am("R/render_slovnik.R")

#----# Generate pojmy.yaml ----#

message("Generating pojmy.yaml from glossary_data.yaml...\n")

path_data <-
  here::here("glossary_data.yaml")
path_output <-
  here::here("pojmy.yaml")

entries <-
  yaml::yaml.load(
    readr::read_file(path_data)
  )

# Named list: each key is the slug ID (e.g. "linearni-model"), value is
#   list(def = <short def>).
# Slug IDs match the "id" field in glossary_data.yaml.
# Usage in qmd files: glossary::glossary("linearni-model", display = "lineární model")
pojmy_list <-
  purrr::set_names(
    purrr::map(
      .x = entries,
      .f = ~ list(def = .x[["def_short"]])
    ),
    purrr::map_chr(entries, "id")
  )

yaml::write_yaml(pojmy_list, path_output)

message("Done: ", path_output, "\n")

#----# Render ----#

message("Rendering slovnik_pojmu.qmd...\n")

quarto::quarto_render(
  input = here::here("slovnik_pojmu.qmd"),
  quiet = FALSE
)

message("Render complete. Output is in docs/")
