# Design Direction — Decided

Chosen: **Direction D (hybrid) with Type 3 (Michroma)** — locked as an
invariant for the build axis.  Reference mockup:
`mockups/direction-d-typo3-michroma.html`.

## Tokens

### Color
- `--vellum: #FBFAF5` — page ground (drafting table)
- `--sheet: rgba(251, 250, 245, 0.84)` — translucent sheet column behind text
- `--ink: #22262B` — text
- `--pencil-blue: #2D5FA8` — annotations, rules, grid majors
- `--pencil-blue-faint: rgba(45, 95, 168, 0.35)` — sheet edges, hairlines
- `--datum-red: #C2452D` — datum flags / invariant callouts only
- grid lines: `rgba(45, 95, 168, 0.07)` minor / `0.13` major

### Type
- Display (`h1`, `h2`, blockquote lead): **Michroma**, uppercase,
  letter-spacing 0.02–0.03em, modest sizes (hero ~76px max, h2 ~34px max)
- Body: **Public Sans** 300, ~17.5px, line-height 1.7
- Annotations/eyebrows/title block: **IBM Plex Mono**, 10–11px, uppercase,
  letter-spaced
- Tagline: Public Sans italic

### Signature elements
- Background: two-scale blue grid (96px major, 12px minor) on vellum
- Translucent sheet column (max-width 900px) with faint blue edges keeps
  the grid out from under the text
- Hero: THE / AXIAL / METHOD with "AXIAL" in outline stroke (1px)
- Tagline "Hold something still." with red DATUM A — DO NOT MOVE flag
  pinned to "still"
- Drawing-sheet apparatus: DWG NO. eyebrow, "DETAIL n / NAME" section
  eyebrows, boxed NOTE blockquotes, title block grid at page foot
- Datum-red reserved exclusively for invariant callouts

### Principles
- The page reads as a technical drawing *of the method itself*
- Illustrations are line-art on the same vellum (pencil-blue + ink +
  datum-red hatching for invariant surfaces)
- Motion, if any: subtle draw-in of dimension lines; respect
  prefers-reduced-motion
