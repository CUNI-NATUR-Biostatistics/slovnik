#--------------------------------------------------------------------#
#
#
#               Biostatistics – Glossary (slovnik)
#
#                       generate_theme
#          Downloads brand_theme.scss and fonts-include.html
#          from the canonical _brand repository on GitHub.
#          Falls back to the cached local copies on failure.
#
#                        Ondřej Mottl
#                            2026
#
#--------------------------------------------------------------------#

#----# Setup ----#

library(here)
library(purrr)

here::i_am("R/render_slovnik.R")

#----# Download ----#

brand_base_url <- "https://raw.githubusercontent.com/CUNI-NATUR-Biostatistics/_brand/main/theme"

message("Downloading brand theme files from _brand...\n")

purrr::walk(
  .x = c("brand_theme.scss", "fonts-include.html"),
  .f = ~ {
    url_src <-
      paste0(brand_base_url, "/", .x)
    path_dest <-
      here::here("theme", .x)
    tryCatch(
      expr = {
        tmp <- tempfile(fileext = paste0(".", tools::file_ext(.x)))
        download.file(url_src, tmp, quiet = TRUE, mode = "wb")
        file.copy(tmp, path_dest, overwrite = TRUE)
        file.remove(tmp)
        message("  Downloaded: ", .x, "\n")
      },
      error = function(e) {
        message(
          "  WARNING: Could not download ", .x,
          " \u2014 using cached copy.\n",
          "  (", e$message, ")\n"
        )
      }
    )
  }
)

message("Brand theme download complete.\n")
