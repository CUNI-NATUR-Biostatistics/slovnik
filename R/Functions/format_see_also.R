#----------------------------------------------------------#
#
#
#           Biostatistics – Glossary (slovnik)
#
#                   format_see_also
#
#                    Ondřej Mottl
#                        2026
#
#----------------------------------------------------------#

#' Format the "See also" section of a glossary entry
#'
#' Builds a Markdown bold-label line containing hyperlinks
#' to related entries. The Czech term for each id is looked
#' up in \code{all_entries}; falls back to the raw id string
#' when no match is found.
#'
#' @param ids Character vector. Glossary entry ids to link.
#' @param all_entries List of glossary entry lists; each must
#'   have fields \code{id} and \code{cz} (character).
#'
#' @return A character string with the formatted
#'   \emph{Viz také} Markdown line, or \code{NULL}
#'   invisibly when \code{ids} is \code{NULL} or empty.
format_see_also <- function(ids, all_entries) {
  if (
    is.null(ids) ||
    length(ids) == 0L
  ) {
    return(invisible(NULL))
  }

  links <-
    purrr::map_chr(
      .x = ids,
      .f = ~ {
        id_to_find <- .x
        matched <-
          purrr::detect(
            .x = all_entries,
            .f = ~ .x[["id"]] == id_to_find
          )
        if (is.null(matched)) {
          return(paste0("[", id_to_find, "](#", id_to_find, ")"))
        }
        return(paste0("[", matched[["cz"]], "](#", id_to_find, ")"))
      }
    )

  res <- paste0(
    "\n**Viz také:** ",
    paste(links, collapse = ", "),
    "\n"
  )
  return(res)
}
