#import "styles.typ": *
#import "tools.typ": label-part


#set page(width: 18.9cm, height: 22.6cm)
#set page(margin: (y: 1.0cm, left: 1.34cm, right: 1.5cm))
#set page(margin: (
  top: 3cm,
  bottom: 2cm,
  x: 1.0cm,))


#let normal-page(body, book: false) = {
  set page(margin: (y: 1.5cm, outside: 1.5cm, inside: 1.5cm)) if book
  set page(margin: (y: 1.5cm, left: 1.34cm, right: 1.5cm)) if not book
  body
}

#let cover(
  title: "The Title",
  author: "The Author",
  date: datetime.today(),
) = {
  page({
    align(
      center + horizon,
      {
        text(3em, weight: "bold", title)
        v(1em)
        text(1.5em, "by " + author)
        v(1em)
        text(1.5em, date.display())
      },
    )
  })
}

#let epigraph(
  body,
) = {
  page({
    align(
      center + horizon,
      text(1.5em, body),
    )
  })
}

#let preface(body) = {
  show: front-matter-style
  heading(level: 1, [Preface])
  body
  //pagebreak()
}


#let acknowledgements(body) = {
  show: front-matter-style
  heading(level: 1, [Acknowledgements])
  body
  //pagebreak()
}


#let contents = {
  show: front-matter-style
  show: contents-style
  outline(target: selector(heading).or(label-part), depth: 3)
}

#let bib(bib, ..args) = {
  heading(level: 1, [Bibliography])
  bibliography(bytes(bib), title: none, ..args)
  pagebreak(weak: true)
}
