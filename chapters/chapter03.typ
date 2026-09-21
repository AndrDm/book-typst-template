#import "../setup.typ": *

= Compatibility
== Margin Notes Packages
The template is based on the `marginalia` package, so it should be compatible with the `marginalia` package.

Regarding `marge`, `drafting`, or other margin-related packages, I'm not certain about their compatibility. However, it's generally not recommended to use them together with the `marginalia` package.

== i-figured
Don't use i-figured with this template. It will cause conflicts with the numbering styles.

If you want to customize the numbering styles, you can examine `chapter-fig-eq-no` and its usage inside `body-styles` in `haobook/styles.typ`.

== Theorems
=== theorion
After a simple test#side-note[A simple "define and reference" test.], I believe the #link("https://github.com/OrangeX4/typst-theorion")[theorion] package is compatible with this template.

It's an excellent package for creating theorems and proofs. You can use it to create theorems, lemmas, corollaries, propositions, definitions, examples, remarks, and proofs.

It's recommended to use `#set-inherited-levels(1)` to make its numbering consistent with the template.

=== ctheorems
After a simple test, I believe the #link("https://github.com/sahasatvik/typst-theorems")[ctheorems] package is compatible with this template.

It's recommended to set `base_level: 1` when defining thmboxes to make its numbering consistent with the template. Also, to ensure the style of `ref`#side-note[The default style of ctheorems `ref` is affected by the show rule of `link`, so it will be blue and underlined without action.] to theorems is consistent with the template, you are recommended to use the following `show` rule, and how to change font here:

#show raw: set text(font: "PT Mono")
```typ
#show raw: set text(font: "PT Mono")
#show ref: it => {
  if it.element == none or it.element.func() != figure or it.element.kind != "thmenv" {
    return it
  }

  show link: set text(black)
  show underline: x => x.body
  it
}
```

=== thmbox
After a simple test, I believe the #link("https://github.com/s15n/typst-thmbox")[thmbox] package is compatible with this template.

It's recommended to set fonts for thmboxes to make them consistent with the template:

```typ
#import "@preview/thmbox:0.2.0": *

#let (thmbox, proof, theorem, proposition, lemma, corollary, definition, example, remark, note, exercise, algorithm, claim, axiom) = (thmbox, proof, theorem, proposition, lemma, corollary, definition, example, remark, note, exercise, algorithm, claim, axiom).map(x => x.with(
  title-fonts: "Libertinus Serif",
  sans-fonts: "Libertinus Serif",
))
#show: thmbox-init()
```

=== lemmify
It works fine, but due to its own bug#side-note[I'm not entirely sure, but once I've set some heading numbering, the `max-reset-level` parameter stopped working.], the numbering is not consistent with the template.

=== frame-it
It's completely#side-note[The theorem body simply disappears.] incompatible with this template. It causes conflicts with the figure caption styles.

=== great-theorems
It's completely incompatible with this template. It causes conflicts with the heading numbering#side-note[Actually the conflicting part is inside `rich-counters`, so that may be another incompatible package.] styles.


=== chapter-indexed
// possible indexed values:
#kw("Margin Notes")[margin notes]
#kw("Theorems")[theorion]
#term("Term")
#index("Programming Languages", "Typst")

Typst is a programming language for typesetting.
