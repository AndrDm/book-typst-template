#import "haobook/lib.typ": *
#import "@preview/zebraw:0.5.0": *
#import "@preview/in-dexter:0.7.2": *
#show: zebraw.with(..zebraw-themes.zebra)

#let (
  body-styles,
  normal-page,
  img-heading,
  side-figure,
) = template(book: false)

#cover(
  title: [
    Example and Documentation \
    of the HaoBook Template
  ],
  author: "ParaN3xus",
  date: datetime(year: 2025, month: 4, day: 6),
)

#epigraph[
  By `epigraph`, you can add a quote or a saying at the beginning of the book.
]

#preface[
  #let l-marginalia = link("https://github.com/nleanba/typst-marginalia")[marginalia]
  #let l-yexiang1992 = link("https://github.com/yexiang1992")[\@yexiang1992]

  This is a preface. You can add some information about the book here by calling `preface`.

  The template is heavily inspired by the LaTeX book template #link("https://github.com/fmarotta/kaobook")[kaobook], and was sponsored by #l-yexiang1992. Without the developers of kaobook and the support of #l-yexiang1992, this template would not have been possible.

  During the development of this template, I have also referenced the implementations of #link("https://github.com/samuelireson/project-iii-typst")[project-iii-typst] and #link("https://github.com/nogula/tufte-memo")[tufte-memo]. They are all excellent templates that you might want to explore if interested. The key feature of this template—sidenotes—is implemented using #l-marginalia by #link("https://github.com/nleanba")[\@nleanba]. I must emphasize that #l-marginalia's implementation is truly outstanding. If you simply want to add sidenotes to your document, I recommend using #l-marginalia directly, as it offers more power and customization options than this template.

  This document serves both as a test document and a tutorial for the template. You can find the source code in the `example.typ` file. The template is designed to be user-friendly and customizable, allowing you to adapt it to your specific requirements.
  #align(right)[_ParaN3xus_]
]

#contents

#show: body-styles

#part[Specifications]


#include "chapters/chapter01.typ"
#include "chapters/chapter02.typ"
#include "chapters/chapter03.typ"

#part[Appendix]

#show: appendix-style

#bib(read("bib.bib"))

= Notes
I hate writing notes.

= Index
Keywords:

#columns(2)[
  #make-index(title: none)
]
