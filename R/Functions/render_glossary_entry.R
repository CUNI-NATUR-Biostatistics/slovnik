#----------------------------------------------------------#
#
#
#           Biostatistics – Glossary (slovnik)
#
#                 render_glossary_entry
#
#                    Ondřej Mottl
#                        2026
#
#----------------------------------------------------------#

#' Render a single glossary entry as Markdown
#'
#' Assembles the complete Markdown block for one glossary
#' entry, including heading, English equivalent, full
#' definition, usage notes, synonyms, and cross-references.
#'
#' @param entry Named list. A single glossary entry with
#'   fields: \code{cz}, \code{id}, and optionally \code{en},
#'   \code{def_full}, \code{usage}, \code{synonyms},
#'   \code{see_also}.
#' @param all_entries List of all glossary entry lists.
#'   Passed to \code{format_see_also()} for link resolution.
#'
#' @return A single character string: the complete Markdown
#'   block for the entry, ending with a horizontal rule.
render_glossary_entry <- function(entry, all_entries) {
  lines <- character(0L)

  # Section heading with HTML anchor
  lines <- c(
    lines,
    paste0("\n### ", entry[["cz"]], " {#", entry[["id"]], "}\n")
  )

  # English equivalent
  if (!is.null(entry[["en"]])) {
    lines <- c(
      lines,
      paste0("**EN:** *", trimws(entry[["en"]]), "*\n")
    )
  }

  # Full definition
  if (!is.null(entry[["def_full"]])) {
    lines <- c(
      lines,
      paste0("\n**Definice:** ", trimws(entry[["def_full"]]), "\n")
    )
  }

  # Usage in the course
  if (!is.null(entry[["usage"]])) {
    lines <- c(lines, format_field_as_markdown("Použití v kurzu", entry[["usage"]]))
  }

  # Synonyms and common confusions
  if (!is.null(entry[["synonyms"]])) {
    lines <- c(
      lines,
      format_field_as_markdown("Synonyma a záměny", entry[["synonyms"]])
    )
  }

  # Cross-references
  if (!is.null(entry[["see_also"]])) {
    lines <- c(
      lines,
      format_see_also(entry[["see_also"]], all_entries)
    )
  }

  lines <- c(lines, "\n---\n")

  res <- paste(lines, collapse = "")
  return(res)
}
