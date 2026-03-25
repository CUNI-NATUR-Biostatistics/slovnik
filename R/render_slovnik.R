#--------------------------------------------------------------------#
#
#
#               Biostatistics – Glossary (slovnik)
#
#                       render_slovnik
#               Render slovnik_pojmu.qmd to docs/
#
#                        Ondřej Mottl
#                            2026
#
#--------------------------------------------------------------------#

#----# Setup ----#

library(here)

here::i_am("R/render_slovnik.R")

#----# Render ----#

quarto::quarto_render(
  input = here::here("slovnik_pojmu.qmd"),
  quiet = FALSE
)

message("Render complete. Output is in docs/")
