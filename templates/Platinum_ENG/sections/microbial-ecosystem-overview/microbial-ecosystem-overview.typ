#import "../../lib.typ": *
#import "@preview/cetz:0.5.2"

#let cluster(seg) = {
  let seg_round = seg
  seg_round.push(seg.at(0))
  let legend = (false,) * seg.len()

  for i in range(seg.len()) {
    if seg_round.at(i) < 30deg {
      if i != 0 and legend.at(i - 1) == true {
        legend.at(i) = true
      } else if seg_round.at(i + 1) < 5deg {
        legend.at(i) = true
      }
    }
  }

  if seg.at(0) < 30deg and legend.at(seg.len()) == true {
    legend.at(0) == true
  }

  return legend
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
    abs-angles.push(sum)
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
  align(center, stack(dir: ltr, spacing: 1cm, box(align(left, text(size: 12pt)[*Phylum\ Composition*])), rect(
    fill: rgb("#d0e7ec"),
    width: 70%,
    height: 9cm,
    (
      align(center + horizon, cetz.canvas({
        import cetz.draw: *

        let data = report.microbial_ecosystem.phylum_composition

        group(name: "chart", {
          // let offset = 0deg
          let seg = data.map(phylum => phylum.abundance / 100 * 360deg)
          let legend_idx = cluster(seg).enumerate().filter(pair => pair.at(1)).map(pair => pair.at(0))
          let coalesced = coalesce(seg)
          let offsets = relative-to-abs-angles(seg)

          for (index, offset) in offsets.enumerate() {
            let phylum = data.at(index)
            stroke(white + 1pt)
            fill(pie-palette.at(calc.rem(index, 8)))
            arc(
              (offset, 2.5),
              start: offset,
              delta: seg.at(index),
              mode: "PIE",
              radius: 2.5,
              name: {
                phylum.name
              },
            )
            anchor(phylum.name, (offset + seg.at(index) / 2, 2.5))
            if index not in legend_idx {
              content(
                (offset + seg.at(index) / 2, 4),
                align(center, text(size: 8pt)[#phylum.name\ #strfmt("{:.2}", phylum.abundance)%]),
                name: "label",
              )
              line(
                "label",
                phylum.name,
                stroke: gray,
              )
            }

            offset += seg.at(index)
          }

          for (index, (start, end)) in coalesced.enumerate() {
            anchor("coalesced-" + str(index), ((offsets.at(start) + (offsets.at(end) + seg.at(end))) / 2, 2.5))
            content(
              ((offsets.at(start) + (offsets.at(end) + seg.at(end))) / 2, 4),
              align(center, text(size: 10pt, [\*])),
              name: "label",
            )
            line(
              "label",
              "coalesced-" + str(index),
              stroke: gray,
            )
          }

          if legend_idx.len() > 0 {
            content(
              (4.5, 3.5),
              anchor: "west",
              name: "legend",
              stack(
                spacing: 0.5em,
                text(size: 8pt)[\*Detected in trace amounts:],
                ..for (i, index) in legend_idx.enumerate() {
                  let phylum = data.at(index)
                  (
                    text(
                      size: 8pt,
                    )[#box(width: 1em, height: 1em, fill: pie-palette.at(calc.rem(index, 8))) #phylum.name #strfmt("{:.2}", phylum.abundance)%],
                  )
                },
              ),
            )
          }
        })
      }))
    ),
  )))
}

#let microbial-ecosystem-overview(report) = page(
  background: standard-page-background(
    section-header: [Microbial Ecosystem Overview],
  ),
)[
  #phylum-composition(report)

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




