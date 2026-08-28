#import "../../lib.typ": *

#let cover-page(report) = page(background: align(bottom, image("images/cover-page-background.png")), margin: (
  x: 0.6in,
))[
  #v(5em)
  #image(if show-gleneagles-logo {"images/gleneagles-logo-full.jpg"} else {"images/gutolution-logo-banner.png"}, width: 400pt)
  #v(6em)
  #title()
  #v(4em)
  #block(width: 100%)[
    #subtitle[
      // #table(
      //   columns:(20%, 50%),
      //   rows: 
      //   align: left + horizon,
      //   [User Name: ], [#report.report_information.user_full_name],
      //   [Report ID:]
      // )
      #columns(2, gutter: -15em)[
        #set par(spacing: 1.5em)
        User Name:
        #colbreak()
        #report.report_information.user_full_name
      ]
      #columns(2, gutter: -15em)[
        #set par(spacing: 1.5em)
        Report ID:
        #colbreak()
        #report.report_information.report_id
      ]
      #columns(2, gutter: -15em)[
        #set par(spacing: 1.5em)
        Report Date:
        #colbreak()
        #report.report_information.date_of_report.display(date-format)
      ]
    ]
  ]
]
