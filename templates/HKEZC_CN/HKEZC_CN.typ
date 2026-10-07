#import "lib.typ": *
#import "sections/front-cover/front-cover.typ": front-cover
#import "sections/introduction/introduction.typ": introduction
#import "sections/integrated-analysis/integrated-analysis.typ": integrated-analysis
#import "sections/core-bacteria/core-bacteria.typ": core-bacteria
#import "sections/harmful-bacteria/harmful-bacteria.typ": harmful-bacteria
#import "sections/probiotics/probiotics.typ": probiotics
#import "sections/parasites/parasites.typ": parasites
#import "sections/references/references.typ": references
#import "sections/disclaimer/disclaimer.typ": disclaimer

#set document(
  title: [微生態全面測試--濕疹及過敏項目],
)

#let production = sys.inputs.at("production", default: false)
#let report = if production { json(sys.inputs.at("input_json")) } else {
  json("reference/NEUAE2313_hkezc_report_new.json")
}
#{
  report.client.date_of_birth = to-date(report.client.date_of_birth)
  report.sample.collected_date = to-date(report.sample.collected_date)
  report.report_date = to-date(report.report_date)

  let replace-species-name-to-match-report-template(bacteria) = {
    let replacement-table = (
      ("Liver flukes", "Liver Fluke"),
      ("Clostridioides difficile", "Clostridium difficile"),
      ("Faecalibacterium", "Clostridium cluster IV"),
      ("Lactobacillus reuteri", "Lactobacillus acidophilus"),
      ("Lactobacillus fermentum", "Lactobacillus bulgaricus"),
    ).to-dict()

    if replacement-table.keys().contains(bacteria.name.en_HK) {
      replacement-table.at(bacteria.name.en_HK)
    } else {
      bacteria.name.en_HK
    }
  }

  for (i, bacteria) in report.core_bacteria.enumerate() {
    report.core_bacteria.at(i).name.insert("en_HK", replace-species-name-to-match-report-template(bacteria))
  }
  for (i, bacteria) in report.harmful_bacteria.enumerate() {
    report.harmful_bacteria.at(i).name.insert("en_HK", replace-species-name-to-match-report-template(bacteria))
  }
  for (i, bacteria) in report.probiotics.enumerate() {
    report.probiotics.at(i).name.insert("en_HK", replace-species-name-to-match-report-template(bacteria))
  }
  for (i, parasite) in report.parasites.enumerate() {
    report.parasites.at(i).name.insert("en_HK", replace-species-name-to-match-report-template(parasite))
  }
}

#show: style
#show: page-style(report)

#front-cover(report)

#counter(page).update(2)

#let sections = (
  introduction,
  integrated-analysis,
  core-bacteria,
  harmful-bacteria,
  probiotics,
  parasites,
  references,
  disclaimer,
)

#for (i, section) in sections.enumerate() {
  section(report)
}
