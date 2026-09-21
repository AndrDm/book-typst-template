#import "haobook/lib.typ": *
#import "@preview/in-dexter:0.7.2": *

#let (
  body-styles,
  normal-page,
  img-heading,
  side-figure,
) = template(book: false)

#let kw(term, body) = {
  index(term)
  body
}

#let term(text) = {
  index(text)
  text
}

#set page(margin: (
  top: 3cm,
  bottom: 2cm,
  left: 1.5cm,
  right: 7.5cm))
