#import "../../lib.typ": *

#let cover-page(report) = page(background: align(bottom, image("images/cover-page-background.png")), margin: (
  x: 0.6in,
))[
  #v(5em)
  #image(if show-gleneagles-logo {"images/gleneagles-logo-full.jpg"} else {"images/gutolution-logo-banner.png"}, width: 400pt)
  #v(6em)
  #title()
  #v(4em)
    #subtitle[
      #table(
        columns:(auto, 1fr),
        inset: (y: 0.5em),
        stroke: none,
        [User Name: ], [#report.report_information.user_full_name],
        [Report ID:], [#report.report_information.report_id],
        [Report Date:], [#report.report_information.date_of_report.display(date-format)]
      )
    ]
]
