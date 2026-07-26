#----------------------------------------------------------#
#
#
#           Biostatistics – Glossary (slovnik)
#
#                format_field_as_markdown
#
#                    Ondřej Mottl
#                        2026
#
#----------------------------------------------------------#

#' Format a named glossary field as Markdown
#'
#' Returns a Markdown bold-label line for a given field
#' value. Returns \code{NULL} invisibly when the value is
#' \code{NULL} or blank.
#'
#' @param label Character. The bold label to render (e.g.
#'   \code{"Použití v kurzu"}).
#' @param value Character. The field content. \code{NULL} or
#'   whitespace-only values are treated as absent.
#'
#' @return A character string with a bold label followed by
#'   inline prose or a Markdown list, or \code{NULL}
#'   invisibly when value is missing or blank.
format_field_as_markdown <- function(label, value) {
  if (
    is.null(value) ||
      nchar(trimws(value)) == 0L
  ) {
    return(invisible(NULL))
  }
  value_trimmed <- trimws(value)
  if (stringr::str_starts(value_trimmed, "- ")) {
    res <- paste0(
      "\n**",
      label,
      ":**\n\n",
      value_trimmed,
      "\n"
    )
  } else {
    res <- paste0(
      "\n**",
      label,
      ":** ",
      value_trimmed,
      "\n"
    )
  }
  return(res)
}
