#import "@preview/hydra:0.6.3": anchor, hydra
#import "@preview/oxifmt:1.0.0": strfmt

#let numfmt(num) = strfmt("{:.2E}", num)
#let within-range(range, num) = {
  if (range.lower != none and num < range.lower) {
    return false
  }
  if (range.upper != none and num > range.upper) {
    return false
  }
  true
}

#let date-format = "[day]/[month]/[year]"
#let to-date(s) = toml(bytes("date = " + s)).date

#let primary = rgb("b4dee8")
#let green = rgb("56bc6c")
#let red = rgb("de4d46")

#let style(body) = {
  show title: set text(size: 28pt, weight: "medium", tracking: 1.2pt)
  set text(size: 11pt, font: "Inter", weight: "regular", features: ("salt",))
  body
}

#let standard-page-background(section-header: none) = {
  image("images/background-pattern.svg")
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
      margin: (top: 3cm, x: 1.2cm, bottom: 1.2cm),
      numbering: "1",
      number-align: end
    )
    it
  }

  f
}
