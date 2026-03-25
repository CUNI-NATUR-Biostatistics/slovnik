#--------------------------------------------------------------------#
#
#
#               Biostatistics – Glossary (slovnik)
#
#                    generate_glossary_yaml
#          Read glossary_data.yaml and write pojmy.yaml
#          in the format required by the glossary R package.
#
#                        Ondřej Mottl
#                            2026
#
#--------------------------------------------------------------------#

#----# Setup ----#

library(here)

here::i_am("R/generate_glossary_yaml.R")

path_data <- here::here("glossary_data.yaml")
path_output <- here::here("pojmy.yaml")

#----# Load data ----#

entries <-
  yaml::yaml.load(
    readr::read_file(path_data)
  )

#----# Transform to glossary package format ----#

# Named list: each key is the Czech term, value is list(def = <short def>).
pojmy_list <-
  purrr::set_names(
    purrr::map(
      .x = entries,
      .f = ~ list(def = .x[["def_short"]])
    ),
    purrr::map_chr(entries, "cz")
  )

#----# Write output ----#

yaml::write_yaml(pojmy_list, path_output)

message("Done: ", path_output)
