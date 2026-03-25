#----------------------------------------------------------#
#
#
#           Biostatistics – Glossary (slovnik)
#
#                   get_first_letter
#
#                    Ondřej Mottl
#                        2026
#
#----------------------------------------------------------#

#' Extract the first letter of a glossary entry's Czech term
#'
#' Removes diacritics from the Czech term, takes the first
#' character, and converts it to upper case. Used to group
#' entries into alphabetical sections.
#'
#' @param entry Named list. A single glossary entry; must
#'   contain element \code{cz} (character).
#'
#' @return A single upper-case ASCII character.
get_first_letter <- function(entry) {
  res <-
    entry[["cz"]] |>
    stringi::stri_trans_general(id = "Latin-ASCII") |>
    stringr::str_sub(start = 1L, end = 1L) |>
    stringr::str_to_upper()
  return(res)
}
