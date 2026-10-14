#import "../../lib.typ": *
#import "@preview/cetz:0.5.2"

#let cluster(seg) = {
  let seg_round = seg
  seg_round.push(seg.at(0))
  let is-in-cluster = (false,) * seg.len()

  for i in range(seg.len()) {
    if seg_round.at(i) < 90deg {
      if i != 0 and is-in-cluster.at(i - 1) == true {
        is-in-cluster.at(i) = true
      } else if seg_round.at(i + 1) < 5deg {
        is-in-cluster.at(i) = true
      }
    }
  }

  return is-in-cluster
}

#let coalesce(seg) = {
  let is-in-cluster-list = cluster(seg)
  let coalesced = ()
  for (i, is-in-cluster) in is-in-cluster-list.enumerate() {
    if not is-in-cluster {
      coalesced.push(none)
    } else if coalesced.last(default: none) == none {
      coalesced.push((i, i))
    } else {
      coalesced.last().at(1) = i
    }
  }
  coalesced.filter(range => range != none)
}

#let relative-to-abs-angles(relative-angles) = {
  let sum = 0deg
  let abs-angles = ()
  for relative-angle in relative-angles {
    abs-angles.push((sum, sum + relative-angle))
    sum += relative-angle
  }
  abs-angles
}

#let phyla-table-row(name, data) = (
  emph(name),
  numfmt(data.abundance, e-notation: false),
  rangefmt(data.logic_operator, e-notation: false),
  display-phyla-rating(data.rating),
)
#let endotoxin-table-row(name, data) = (
  emph(name),
  numfmt(data.abundance, e-notation: false),
  rangefmt(data.logic_operator, e-notation: false),
  display-endotoxin-rating(data.rating),
)

#let phylum-composition(report) = {
  pad(x: 1cm, align(left, stack(
    dir: ltr,
    spacing: 0.5cm,
    box(align(left, text(size: 12pt)[*Phylum\ Composition*])),
    rect(
      fill: rgb("#d0e7ec"),
      width: 70%,
      height: 7.5cm,
      (
        align(center + horizon, cetz.canvas({
          import cetz.draw: *

          let data = report.microbial_ecosystem.phylum_composition

          group(name: "chart", {
            let seg = data.map(phylum => phylum.abundance / 100 * 360deg)
            let legend_idx = cluster(seg).enumerate().filter(pair => pair.at(1)).map(pair => pair.at(0))
            let coalesced = coalesce(seg)
            let offsets = relative-to-abs-angles(seg)

            let label-offsets = offsets.map(((start, end)) => (start + end) / 2)
            for (start-index, end-index) in coalesced {
              let ((start-index, end-index), ..) = coalesced
              let (start-index-start-angle, end-index-end-angle) = (
                offsets.at(start-index).at(0),
                offsets.at(end-index).at(1),
              )
              let expanded-label-angle = (end-index - start-index + 1) * 10deg
              let mid-angle = offsets.at(calc.ceil((start-index + end-index) / 2)).at(1)
              for i in range(start-index, end-index, inclusive: true) {
                label-offsets.at(i) = mid-angle + (i - (start-index + end-index) / 2) * 15deg - 5deg
              }
            }

            for (index, (start, end)) in offsets.enumerate() {
              let phylum = data.at(index)
              stroke(white + 1pt)
              fill(pie-palette.at(calc.rem(index, pie-palette.len())))
              arc(
                (start, 2.3),
                start: start,
                stop: end,
                mode: "PIE",
                radius: 2.3,
                name: str(index),
              )
              anchor(str(index), ((start + end) / 2, 2.3))
            }

            for (index, offset) in label-offsets.enumerate() {
              let phylum = data.at(index)
              content(
                (offset, 4),
                align(center, text(size: 6.5pt)[#phylum.name\ #strfmt("{:.2}", phylum.abundance)%]),
                name: "label",
              )
              line(
                "label",
                str(index),
                stroke: gray,
              )
            }
          })
        }))
      ),
    ),
  )))
}

#let microbial-ecosystem-overview(report) = page(
  background: standard-page-background(
    section-header: [Microbial Ecosystem Overview],
  ),
)[
  #phylum-composition(report)

  #set par(spacing: 0.8cm)
  #align(center)[
    #platinum-table(
      columns: (30%, 20%, 20%, 20%),
      left-align-cols: (0,),
      tnum-cols: (1, 2),
      table.header(
        align(left)[Bacterial Phyla],
        [Relative Abundance (%)],
        [Reference Range (%)],
        [Rating],
      ),
      ..(
        ([Bacteroidetes], report.microbial_ecosystem.bacteroidetes),
        ([Firmicutes], report.microbial_ecosystem.firmicutes),
        ([Firmicutes:Bacteroidetes Ratio\*], report.microbial_ecosystem.firm_bact_ratio),
      )
        .map(((name, data)) => phyla-table-row(name, data))
        .flatten(),
    )
    #platinum-table(
      columns: (30%, 20%, 20%, 20%),
      left-align-cols: (0,),
      tnum-cols: (1, 2),
      table.header(
        align(left)[Endotoxin (LPS) Burden Indicator],
        [Relative Abundance (%)],
        [Reference Range (%)],
        [Rating],
      ),
      ..endotoxin-table-row([Proteobacteria], report.microbial_ecosystem.proteobacteria),
    )
  ]

  #pad(x: 1cm)[*Note:*\
    Proteobacteria are a major source of endotoxin (LPS), which can activate inflammatory pathways including IL-6 and TNF-α.

    Borderline elevation suggests a potential increase in endotoxin burden, which may contribute to low-grade systemic inflammation, increased intestinal permeability, and metabolic or hepatic stress.

    This metric serves as a practical proxy for total endotoxin (LPS) burden within the gut microbiome.

    \*The Firmicutes: Bacteroidetes ratio reflects the proportional relationship between both phyla and may differ from individual phylum reference ranges.]
]




