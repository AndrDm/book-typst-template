#import "../setup.typ": *

// = Usage of the Template
#img-heading(
  [Usage of the Template],
  read("../assets/banner.png", encoding: none),
  label: <chapter-usage>,
)
The template is designed to be easy to use. You can use it to create a book or a report with a beautiful layout.

In this chapter, I will show you how to initialize the template and use a variety of utility functions provided.

== Importing the Template
To use the template, you need to import the `lib.typ` file and call the `template` function.

```typ
#import "haobook/lib.typ": *

// Pass book: true parameter to use book mode
#let (body-styles, normal-page, img-heading, side-figure) = template(book: true)
```

When calling the `template` function, you can pass a parameter `book` to specify whether you are creating a book with alternating margin notes position or a report with consistent margin position. The default value is `false`.

In addition to the four functions returned by `template`, functions independent of book mode are also imported. All of these functions are:
- Styles:
  - `front-matter-style(body)`: Style for front matter pages.
  - `appendix-style(body)`: Style for appendix pages.
  - `body-styles(body)`: Style for body pages.
- Pages#side-note[Some of them like `contents` and `normal-page` are not necessarily limited to one page.]:
  - `cover(title: "The Title", author: "The Author", date: datetime.today())`: Add a cover page to the document.
  - `epigraph(body)`: Add an epigraph to the document.
  - `preface(body)`: Add a preface to the document.
  - `contents`: Add a table of contents to the document.
  - `bib(body)`: Add a bibliography to the document.
  - `part(body)`: Add a part page to the document.
  - `normal-page(body)`: Add normal pages without side notes to the document.
- Tools:
  - `side-note(body, dy: 0em)`: Add a side note#side-note[`side-note` has numbering.] to the document.
  - `margin-note(body, dy: 0em)`: Add a margin note#margin-note[`margin-note` doesn't have numbering.] to the document.
  - `side-figure(figure, label: none, dy: 0em)`: Add a side figure to the document.
  - `wideblock(body)`: Add a wide block to the document.
  - `img-heading(body, img, label: none)`: Add a heading of level 1 with a banner image to the document.

== Suggested Document Structure
Overall, your document should be structured like this:

```typ
#import "haobook/lib.typ": *
#let (body-styles, normal-page, img-heading, side-figure) = template(book: true)

// frontmatter
#cover(
  // title: "The Title",
  // author: "The Author",
  // date: datetime.today(),
)
#epigraph[
  // Add an epigraph to the document.
]
#preface[
  // Add a preface to the document.
]
#contents

// body
#show: body-styles

...

// appendix
#part[Appendix]
#show: appendix-style

...
```

For the body of the document, the template provides you with at least three hierarchical levels of structure:
- `part`#side-note[A part is optional. You can create a level 1 heading without any part just like @chapter-usage.]: The `part` will create a single page with a title. You can use it to create a new chapter or a new part in your document.
- `= Heading` or `img-heading`: The level 1 heading will create a chapter starting from a new page#side-note[With a chapter outline just like the one at the beginning of this chapter]. Specifically, the `img-heading` will create a heading with an image banner.
- `== Section`: The level 2 heading will create a section.
- `...`: You can use more `=` to create deeper levels of headings. The template won't style them for you.

For the appendix, it's almost the same as the body. But their heading numbering is `"A.1"`.

== Usage of Some Functions
In this chapter, I will show you how to use some functions, mainly tool functions, as well as some page functions.
=== Side Note
Two types of notes are provided in the template:
- `side-note`: The `side-note` will create a side note with numbering#side-note[Like this]. Its numbering will be reset for each page.
- `margin-note`: The `margin-note` will create a margin note without numbering#margin-note[Like this]. And thus, there won't be any mark in the main text.

For both types of notes, you can use the `dy` parameter to specify the vertical position of the note. The default value is `0em`, which means the note will be placed at the same vertical position as the main text. You can use a negative value to move the note up, or a positive value to move it down.

=== Side Figure
The `side-figure` will create a side figure with a caption. You can use it to create a figure with a caption on the side of the page. The caption will be numbered according to the chapter.

Here is an example of how to use the `side-figure`:
```typ
#side-figure(
  figure(
    rect(),
    caption: "A rectangle",
  ),
  label: <fig-rect>,
)
```
#side-figure(
  figure(
    rect(),
    caption: "A rectangle",
  ),
  label: <fig-rect>,
)

As you can see, the `side-figure` will create a figure with a caption on the side of the page, just like @fig-rect.

You can also use the `dy` parameter to specify the vertical position of the figure.

=== Wide Block
Sometimes, you may want to create a wide block of content that spans the whole page. You can use the `wideblock` function to do this:
```typ
#wideblock(
  figure(
    rect(
      width: 100%,
      height: 1cm,
      fill: gradient.linear(..color.map.rainbow),
    ),
    caption: [Another wide rainbow],
  ),
)
```
#wideblock(
  figure(
    rect(
      width: 100%,
      height: 1cm,
      fill: gradient.linear(..color.map.rainbow),
    ),
    caption: [Another wide rainbow],
  ),
)

=== Image Heading
The `img-heading` function will create a level 1 heading with an image banner.

Actually, it's more like an example of alternative styles for level 1 headings. If you don't like it, you can modify it to your own style.


```typ
#img-heading(
  [Usage of the Template],
  read("../assets/banner.png", encoding: none),
  label: <chapter-usage>,
)
```
The effect is shown in @chapter-usage.

Note that you should use the `label` parameter to specify the label of the heading, and you have to use the `read` function to read the image file, otherwise the root of the path will be inside the template folder#side-note[Which is not what we want].


=== Bibliography
```typ
#bib(read("bib.bib"))
```
The `bib` function will create a bibliography page with the references in the `bib.bib` file.

Note that you should use the `read` function to read the `bib.bib` file, for the same reason as explained for `img-heading`.

=== Normal Page
The `normal-page` function#side-note[It's just a wrapper of `set page(...)`] will create a normal page without any side notes. You can use it to create a page with only the main text.

Actually it creates normal "pages" since if you pass too much content to it, it will create multiple pages.

