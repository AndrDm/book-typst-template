#import "../setup.typ": *


= Features
In this chapter, I will show you all the features of the template.

== Front Matter
As you can see, the template provides all those front matter pages before this page. You can use them to add a cover page, an epigraph, a preface, and a table of contents to your document.

== Margin-related Features
=== Automatically
==== Margin position
You may want to publish your book in a way that the margin notes are on the left side of the page for odd pages and on the right side for even pages. This template provides you with this feature. You can enable it by using the `book: true` parameter when calling the `template` function.

==== Chapter outline
You may have noticed that the chapter outline is automatically generated.

==== References
When I'm referencing something great@maedje2022typst, a detailed reference will be shown in the margin.

==== Figures <sect-feat-figures>
When I'm adding a figure, the caption will be shown in the margin.

#figure(
  rect(
    width: 100%,
    height: 1cm,
    fill: gradient.linear(..color.map.rainbow),
  ),
  caption: [A rainbow],
)

=== Manually
==== Side Notes
You can use `side-note` and `margin-note`#margin-note[A margin note.] to add notes to the document. Just like what#side-note[A side note.] was shown on the right side.

==== Side Figures
You can use `side-figure` to add a figure like @fig-circle to the document.

You might wonder why you can't simply use `figure` inside `margin-note`. This would cause conflicts with the figure caption styles shown in @sect-feat-figures, so you need to use `side-figure` instead.
#side-figure(
  figure(
    circle(),
    caption: "A circle",
  ),
  label: <fig-circle>,
  dy: -4em,
)

==== Wide Block
You can use `wideblock` to add a block that spans the whole page. This is useful for adding text or figures that need to extend across the entire page width.

#wideblock(
  figure(
    rect(
      width: 100%,
      height: 1cm,
      fill: gradient.linear(..color.map.rainbow),
    ),
    caption: [A wide rainbow],
  ),
)

== General Styles
You've already seen the general styles of the template, including heading styles, page headers, etc.

You may have also noticed that figure numbering#side-note[Actually the counters affected are:
- `figure.where(kind: image)`
- `figure.where(kind: table)`
- `figure.where(kind: raw)`
- `math.equation`.
] follows the format `chapno`-`figno`. This is already implemented in the template, so there's no need to use `i-figured`.

