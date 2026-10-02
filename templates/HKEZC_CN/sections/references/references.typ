#import "../../lib.typ": *

#let references-page(references-text) = page[
  #table(
    stroke: none,
    inset: 0pt,
    gutter: 1em,
    rows: (auto, 1fr),
    [= References 文獻資料],
    pad(bottom: 1em, x: 0.75pt, box(stroke: primary + 1.5pt, inset: 8pt, height: 100%, text(size: 10pt)[
      #set par(spacing: 4em)
      #references-text
    ])),
  )
]

#let references(report) = {
  references-page[
    Rossi M, Amaretti A, Raimondi S. Folate production by probiotic bacteria. Nutrients. 2011 Jan;3(1):118-34. doi: 10.3390/nu3010118. Epub 2011 Jan 18. PMID: 22254078; PMCID: PMC3257725.
    https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9227236/


    Hossain KS, Amarasena S, Mayengbam S. B Vitamins and Their Roles in Gut Health. Microorganisms. 2022 Jun 7;10(6):1168. doi: 10.3390/microorganisms10061168. PMID: 35744686; PMCID: PMC9227236.
    https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3257725/


    K.-P. Su et al., "Association of Use of Omega-3 Polyunsaturated Fatty Acids With Changes in Severity of Anxiety Symptoms," JAMA Netw Open, vol. 1, no. 5, p. e182327, Sep. 2018, doi: 10.1001/jamanetworkopen.2018.2327.


    L. Galland, "The Gut Microbiome and the Brain," Journal of Medicinal Food, vol. 17, no. 12,
    pp. 1261--1272, Dec. 2014, doi: 10.1089/jmf.2014.7000.


    Maes M, Leunis JC. Normalization of leaky gut in chronic fatigue syndrome (CFS) is accompanied by a clinical improvement: effects of age, duration of illness and the translocation of LPS from gram-negative bacteria.
    Neuro Endocrinol Lett. 2008 Dec;29(6):902-10. PMID: 19112401.


    L. Noah, L. Dye, B. Bois De Fer, A. Mazur, G. Pickering, and E. Pouteau, "Effect of magnesium and vitamin B6 supplementation on mental health and quality of life in stressed healthy adults: Post-hoc analysis of a randomized controlled trial," Stress and Health, vol. 37, no. 5, pp. 1000--1009, May 2021, doi: 10.1002/smi.3051.


    A. F. Cicero and A. Minervino, "Combined action of SAMe, Folate, and Vitamin B12 in the treatment of mood disorders: a review," European Review for Medical and Pharmacological Sciences, vol. 26, no. 7, pp. , Apr. 2022, doi: 10.26355/eurrev_202204_28479.


    N. G. Norwitz and U. Naidoo, "Nutrition as Metabolic Treatment for Anxiety," Front. Psychiatry, vol. 12, Feb. 2021, doi: 10.3389/fpsyt.2021.598119.

  ]
  references-page[
    Fang, Ferric C., Elaine R. Frawley, Timothy Tapscott, and Andrés Vazquez- Torres. Bacterial Stress Responses during Host Infection. Cell Host and Microbe 20, no. 2 (August 10, 2016): 13343.
    https://doi.org/10.1016/j.chom.2016.07.009.


    Ridlon, Jason M., Patricia G. Wolf, and H. Rex Gaskins."Taurocholic Acid Metabolism by Gut Microbes and Colon Cancer." Gut Microbes 7, no. 3 (May 3, 2016): 201-15.


    Guilloteau, P., L. Martin, V. Eeckhaut, R. Ducatelle, R. Zabielski, and F. Van Immerseel."From the Gut to the Peripheral Tissues: The Multiple Effects of Butyrate." Nutrition Research Reviews 23, no. 2 (December 2010): 366-84.


    Sevrin, Gwladys, Sébastien Massier, Benoit Chassaing, Allison Agus, Julien Delmas, Jérémy Denizot, Elisabeth Billard, and Nicolas Barnich."Adaptation of Adherent-Invasive E. Coli to Gut Environment: Impact on Flagellum Expression and Bacterial Colonization Ability." Gut Microbes, March 2018, 1-17.
    https://doi.org/10.1080/19490976.2017.1421886.


    Morris, A. (2017). Gut microbiota: Fibre restores healthy gut microbiota. Nature Reviews Endocrinology,
    14(2), 63-63. https://doi.org/10.1038/nrendo.2017.182


    "Regulation of Autoimmunity by the Microbiome." DNA and Cell Biology 35, no. 9 (September 2016): 455-58.


    Y. Lu, J. Chong, S. Shen, J.-B. Chammas, L. Chalifour, and J. Xia, "TrpNet: Understanding Tryptophan Metabolism across Gut Microbiome," Metabolites, vol. 12, no. 1, p. 10, Dec. 2021, doi:
    10.3390/metabo12010010.


    M. W. Bourassa, I. Alim, S. J. Bultman, and R. R. Ratan, "Butyrate, neuroepigenetics and the gut microbiome: Can a high fiber diet improve brain health?," Neuroscience Letters, vol. 625, pp. 56--63, Jun. 2016, doi: 10.1016/j.neulet.2016.02.009.
  ]
  references-page[
    E. C. Deehan et al., "Precision Microbiome Modulation with Discrete Dietary Fiber Structures Directs Short- Chain Fatty Acid Production," Cell Host andamp; Microbe, vol. 27, no. 3, pp. 389-404.e6, Mar. 2020, doi: 10.1016/j.chom.2020.01.006.


    Heiman, Mark L., and Frank L. Greenway."A Healthy Gastrointestinal Microbiome Is Dependent on Dietary Diversity." Molecular Metabolism 5, no. 5 (May 2016): 317-20. https://doi.org/10.1016/j.molmet.2016.02.005.
  ]
}
