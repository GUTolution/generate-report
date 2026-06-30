#import "../lib.typ": *

#let header = context {
  align(bottom)[
    #place(top + start, pad(top: 0em, left:0em, text(size: 22pt, font: "Helvetica", weight: "black", fill:rgb(22,74,100))[#h(1cm) At a glance..]))
    #place(top + start, pad(top: -1.5em, left: 30em, image("images/gutolution-logo-tagline.png", width: 6em)))
    ]
}

#let at-a-glance(report) = page(background: standard-page-background(section-header: [#header]))[

]
