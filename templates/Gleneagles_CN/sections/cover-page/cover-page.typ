#import "../../lib.typ": *

#let cover-page(report) = page(background: align(bottom, image("images/cover-page-background.png")), margin: (
  x: 0.6in,
))[
  #v(5em)
  #image(if show-gleneagles-logo {"images/gleneagles-logo-full.jpg"} else {"images/gutolution-logo-banner.png"}, width: 400pt)
  #v(6em)
  #title()
  #v(4em)
  #block(width: 55%)[
    #subtitle[
      #table(
        columns:(25%, 50%),
        align: left + top,
        inset: (y: 0.5em),
        stroke: white,
        [用戶姓名: ], [#report.report_information.user_full_name],
        [報告編號: ], [#report.report_information.report_id],
        [報告日期: ], [#report.report_information.date_of_report.display(date-format)]
      )
    ]
  ]
]
