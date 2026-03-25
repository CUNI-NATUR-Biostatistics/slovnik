#----------------------------------------------------------#
#
#
#           Biostatistics – Glossary (slovnik)
#
#                     get_sort_key
#
#                    Ondřej Mottl
#                        2026
#
#----------------------------------------------------------#

#' Compute a sort key for a glossary entry
#'
#' Strips diacritics from the Czech term and converts it to
#' lower-case ASCII, producing a string suitable for
#' alphabetical ordering.
#'
#' @param entry Named list. A single glossary entry; must
#'   contain element \code{cz} (character).
#'
#' @return A single character string: \code{cz} with
#'   diacritics removed and converted to lower case.
get_sort_key <- function(entry) {
  res <-
    entry[["cz"]] |>
    stringi::stri_trans_general(id = "Latin-ASCII") |>
    stringr::str_to_lower()
  return(res)
}
