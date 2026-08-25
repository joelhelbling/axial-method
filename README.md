# The Axial Method

A single-page manifesto site presenting the Axial Method: a way of working,
for people and AI agents, built on choosing what _won't_ change.  Hold
something still, and the work becomes simpler.

**Live site:** https://joelhelbling.github.io/axial-method/

## What's here

```
index.html          The whole site: one page, no build step, no framework
assets/             Optimized web images (generated -- do not edit)
images/             Canonical source images, including hand-tuned crops
bin/make-images.sh  Regenerates assets/ from images/ (resize + compress)
docs/               The thinking behind the site
mockups/            Design exploration artifacts
plugins/            The method as working Claude Code skills
.claude-plugin/     Marketplace manifest for the plugins
evals/              Sandbox scenarios for evaluating the skills
```

The site is plain HTML and CSS in a single file.  Fonts (Michroma,
Public Sans, IBM Plex Mono) load from Google Fonts; everything else is
self-contained, including the two inline SVG figures.

## Working on it

Open `index.html` in a browser.  That's it -- there is no build.

Images follow a two-layer scheme:

- `images/` holds the canonical sources.  Crops are deliberate and baked
  into these files; treat them as the reference surface.
- `assets/` holds what the site actually serves.  If a source image
  changes, run `bin/make-images.sh` (requires ImageMagick) to regenerate.
  Never edit `assets/` by hand.

## The docs

- `docs/axial-methodology.md` -- the original treatise the site distills
- `docs/site-copy.md` -- the site's copy, as prose
- `docs/design-direction.md` -- the chosen design system: tokens, type,
  and signature elements
- `docs/voice.md` -- style notes for keeping the copy in Joel's voice

## The plugin

This repo is also a Claude Code plugin marketplace.  The `axial`
plugin in `plugins/axial/` delivers the method as skills: the core
method itself, plus red, green, refactor and pull-request axes
forming an issue-through-PR sequence.  To try it in Claude Code:

```
/plugin marketplace add joelhelbling/axial-method
/plugin install axial@axial-method
```

One default worth knowing about: the axes hand notes forward between
them, and the method skill keeps those notes in an AXIAL-NOTES.md at
the repository root, excluded from version control.  That's a decision
your team might make differently.  Some would rather the notes land
as comments in a kanban tool like Linear or Trello, some want them
committed, and some have their own local scheme.  If so, edit the
notes paragraph in the method skill, or override it with instructions
of your own (CLAUDE.md is a natural place).

## Deploying

GitHub Pages serves the `main` branch root.  Pushing to `main` deploys.

## Image credits

Photography via [Pexels](https://pexels.com) and
[Unsplash](https://unsplash.com), free to use:

- Lathe (hero): Maxim Tolchinskiy (Unsplash)
- Cookie ingredients & dough: Tanner Barrott, Lauren Diaz (Pexels)
- Jointer: cottonbro studio (Pexels)
- Table saw & hand planer: Tima Miroshnichenko (Pexels)
- Portrait: the author's own

Illustrations (vehicle concept 4B, red/green cookies, Vibeville) were
generated for this project.
