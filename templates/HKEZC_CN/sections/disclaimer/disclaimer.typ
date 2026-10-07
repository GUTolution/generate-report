#import "../../lib.typ": *

#let disclaimer(report) = page[
  #table(
    stroke: none,
    inset: 0pt,
    gutter: 1em,
    rows: (auto, 1fr),
    [= Risks and Limitations 風險與限制],
    pad(x: 0.75pt, bottom: 1em, box(
      stroke: primary + 1.5pt,
      inset: (y: 10pt, left: 10pt, right: 25pt),
      height: 100%,
      text(9.5pt)[
        #set heading(numbering: (..nums) => {
          if nums.pos().len() < 3 { return none }
          box(pad(right: 0.8em, nums.pos().slice(2).map(str).join(".") + "."))
        })
        #set par(leading: 0.8em)
        #[
          #set par(first-line-indent: (amount: 1em, all: true), hanging-indent: 1em)
          #show heading.where(level: 3): it => pad(left: 1em, bottom: 0.7em, it)
          == 風險
          === 實驗室誤差的風險
          GUTolution Limited 具有處理樣本的標準技術和有效程序。但是，實驗室誤差有可能會發生，導致不正確的結果。例子包括但不限於樣本或DNA的污染或標記錯誤，未能獲得可解釋的報告、以及任何其他操作性的實驗室誤差。Gutolution Limited的實驗室可會向您要求第二個樣本來完成您的測試。

          === 實驗室技術問題的風險
          GUTolution Limited 的實驗室制定了標準有效的程序，以防止出現技術和操作問題。然而，這些問題仍可能發生，例子包括但不限於無法獲得特定菌種的可解釋結果。有時由於Gutolution Limited控制之外的情況，不可能獲得特定菌種的測試結果，這意味著Gutolution Limited可能無法報告您的特定健康特徵或狀況或其他表現型的結果。Gutolution Limited可能會重新測試您的樣本以獲得這些結果，但是在重新測試後仍可能無法獲得結果。與所有醫學實驗室測試一樣，報告有可能出現假陽性或假陰性結果。假陽性結果意味著當菌種實際上不存在時，但在報告上存在。假陰性結果意味著當菌種實際上存在時，但在報告上不存在。經過測試的個人可能希望進一步測試以驗證任何結果。]

        #v(0.7cm)
        == 限制
        #pad(left: 1em)[
          + 此測試的目的是提供有關測試者腸道菌群如何影響其新陳代謝、體重、運動、能量使用、進食的行為、飲食和營養選擇的資訊。測試者不應只根據微生物測試結果，而在未諮詢其醫護提供者或專業人員的情況下，改變他們的飲食，身體活動或他們目前任何醫學治療方案。

          + 測試者可能會發現他們的經歷與Gutolution Limited選擇的相關科學研究結果所顯示的改進不一致。有關腸道菌群的科學仍在發展，而許多個人健康因素皆影響飲食和健康。在本報告中引用的科學研究當中，研究對象可能有不同於測試者的個人健康和其他因素。因此這些研究可能無法代表測試者所經歷的結果。此外，一些建議可能會或可能不會實現，取決於被測個體的身體能力或其他個人健康因素。

          + 腸道菌群與Gutolution Limited微生物測試報告中的信息之間的關聯是一個被積極研究領域。未來的科學研究可能會改變我們對這些信息如何與您的飲食，營養和鍛煉相關的理解。
          \
          \
          注意事項： 報告結果之數據，只反映測試者採樣當日身體的狀況。所有檢查數據非作為醫學診斷或治療用途。報告內容並不能代表醫生的正式診治或專業意見。客戶如有任何健康問題，請諮詢你的醫護提供者或專業人員。
        ]

      ],
    )),
  )

]
