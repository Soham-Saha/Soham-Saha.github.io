// Note that you can use #colbreak() to get same functionality as #pagebreak() while inside containers like #ibox

#let div=line(length:100%)

#let divdash=line(length:100%,stroke: (dash:"dashed"))

//Text bold and math bold functions
#let tbold(body) = text(weight: "bold",body)

#let mbold(body) = $bold(body)$

// Intelligent named box
#let ibox(name, spacing:0.5em, body) = context(
  grid(
    columns:(measure(name).width, spacing, 100% - spacing - measure(name).width), 
    name, 
    [], 
    body
  )
)

#let soln(name,spacing:0.5em,body)=[
  #ibox(spacing:spacing)[#name][#body]
  #divdash
]

//https://github.com/typst/typst/discussions/3901#discussioncomment-12623158

#let tag(name, body) = {
  math.equation(block: true, numbering: x => name, body)
}

#let indent(body)=ibox([#h(1em)],body)


#let note(body) = text(fill:green,body)
#let pnote(body) = text(fill:purple, body)

#let try = text(fill:red, "Try again later.")

#let lh = "L'Hopital"

#let lonely = [\ I am a lonely little page in an otherwise lively pdf.]

#let lm =  $lambda$

#let dsum = $plus.o$
#let ldsum = $plus.o.big$

#let inprod(u,v) = $lr(chevron.l #u, #v chevron.r)$

#let cat(body) = mbold(body)

#let isom = math.tilde.equiv

#let notebox(body)=block(width:100%,fill: luma(230),inset: 8pt,radius: 4pt,body)

#let obj = $"obj"$

#let bin(a,b) = math.binom(a,b)

#let normal = math.triangle.small.l

#let ord = "ord"

#let semidirect = math.times.r

#let Hom = "Hom"

#let start(
  title : "",
  author : "",
  show_link : true,
  body,
) = {
  set math.mat(delim: "[")
  show link: underline
  set par(justify: true)

  align(center)[
    #text(size:17pt, title)
    #v(0.9em, weak: true)
    #text(size:14pt, author)
    #v(0.9em, weak: true)
    #if show_link [
      #link("https://soham-saha.github.io")
    ]

    \
  ]

  body
}