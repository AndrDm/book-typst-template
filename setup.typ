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
