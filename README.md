# slovnik – Slovník statistických pojmů

Repozitář obsahuje **slovník statistických pojmů** pro kurz Biostatistika (MB120P163) na Přírodovědecké fakultě Univerzity Karlovy.

Slovník je primárně určen vyučujícím jako kanonický zdroj terminologie – zaručuje konzistentní používání českých a anglických termínů napříč přednáškami, skripty a cvičeními.
Studentům je distribuován přes Moodle jako renderovaný HTML soubor.

---

## Struktura repozitáře

```
slovnik/
├── glossary_data.yaml       # JEDINÝ soubor, který se ručně upravuje
├── pojmy.yaml               # Generovaný výstup (pro balíček glossary v R) – neupravovat
├── slovnik_pojmu.qmd        # Quarto dokument renderující HTML slovník
├── _quarto.yml              # Konfigurace Quarto projektu
├── R/
│   ├── generate_glossary_yaml.R   # Přegeneruje pojmy.yaml z glossary_data.yaml
│   ├── render_slovnik.R           # Renderuje slovnik_pojmu.qmd do docs/
│   └── Functions/                 # Pomocné R funkce (řazení, formátování, rendering)
│       ├── format_field_as_markdown.R
│       ├── format_see_also.R
│       ├── get_first_letter.R
│       ├── get_sort_key.R
│       └── render_glossary_entry.R
└── docs/
    └── slovnik_pojmu.html   # Renderovaný HTML slovník (distribuovaný přes Moodle)
```

---

## Jak přidat nebo upravit termín

Veškeré změny se provádějí **výhradně v `glossary_data.yaml`**. Ostatní soubory jsou generované a commitují se až po regeneraci.

### Schéma záznamu

```yaml
- id: "linearni-model"          # ASCII kebab-case; slouží jako HTML kotva (#linearni-model)
  cz: "Lineární model"          # Český termín (zobrazuje se jako nadpis ve slovníku)
  en: "linear model"            # Anglický ekvivalent
  def_short: "1–2 věty pro tooltip v materiálech."
  def_full: |
    Plná definice pro slovník. Markdown je povolen.
  usage: |
    - Poznámky k použití v kurzu (markdown, volitelné).
  synonyms: "Synonyma nebo termíny k záměně (markdown, volitelné)."
  see_also:
    - "anova"                   # id jiných termínů (volitelné)
  avoid: "Termín, kterému se vyhýbáme (volitelné)."
```

### Postup po každé změně

```r
# 1. Regenerovat pojmy.yaml (formát pro R balíček glossary)
source("R/generate_glossary_yaml.R")

# 2. Renderovat HTML slovník do docs/
source("R/render_slovnik.R")

# 3. Commitnout glossary_data.yaml, pojmy.yaml i docs/slovnik_pojmu.html
```

---

## Napojení na ostatní materiály

`pojmy.yaml` je ve formátu vyžadovaném R balíčkem [`glossary`](https://debruine.github.io/glossary/).
Týdenní repozitáře (`L01`–`L12`) vždy odkazují na **raw soubor na GitHubu**, aby automaticky používaly nejnovější verzi termínů:

```r
glossary::glossary_path(
  "https://raw.githubusercontent.com/CUNI-NATUR-Biostatistics/slovnik/main/pojmy.yaml"
)
```

Nikdy neodkazujte na lokální kopii `pojmy.yaml` – vždy používejte výše uvedenou URL, aby byla terminologie konzistentní napříč všemi materiály kurzu.

---

## Kontext kurzu

| Položka | Hodnota |
|---|---|
| Kurz | Biostatistika (MB120P163) |
| Organizace | [`CUNI-NATUR-Biostatistics`](https://github.com/CUNI-NATUR-Biostatistics) |
| Koordinátor | Ondřej Mottl |
| Vizibilita repozitáře | Privátní |
