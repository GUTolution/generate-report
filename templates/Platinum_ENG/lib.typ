#import "@preview/hydra:0.6.3": anchor, hydra

#let date-format = "[day]/[month]/[year]"
#let to-date(s) = toml(bytes("date = " + s)).date

#let style(body) = {
  show title: set text(size: 28pt, weight: "medium", tracking: 1.2pt)
  set text(size: 11pt, font: "Inter", weight: "regular", features: ("salt",))
  body
}

#let standard-page-background(section-header: none) = {
  image("images/background-pattern.png")
  place(top, context {
    let header = image("images/header-background.png")
    box(height: measure(header).height, {
      header
      place(horizon, [= #section-header])
    })
  })
}

#let page-style = {
  let f(it) = {
    set page(
      header: anchor(),
      margin: (top: 4cm, x: 2.3cm, bottom: 1cm),
    )
    it
  }

  f
}
