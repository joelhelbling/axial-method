---
name: method
description: The Axial Method — a way of working, for people and AI agents, built on choosing what won't change.  Use this skill whenever the user mentions working axially, the Axial Method, axes, invariants, or datums; whenever they ask to set up, adopt, extend, or design an axial workflow or a new axis; and whenever a development task is about to move through multiple modes of work (test, implement, refactor, PR) and would benefit from doing so one axis at a time.  Also consult this before invoking any individual axis skill (red, green, refactor, pull-request) so the sequence and handoffs are understood.
---

# The Axial Method

An **axis** is a mode of work defined as much by what it holds still as
by what it changes.  Working one axis at a time keeps the work legible
to humans and verifiable at each step.  (The pattern is old: mise en
place, the machinist's datum surface, red-green-refactor.)

## The axis contract

Axes compound: what one axis produces, another axis consumes — as a
reference, an invariant, or both.  To make those handoffs explicit,
every axis skill opens with a **contract** in this standard form,
stated concisely before any expanded guidance:

- **Requires** — artifacts from other axes (or from outside the
  sequence) that this axis consumes as references.  Referenced, never
  changed.
- **Invariants** — what must not change while this axis is active.
  A real invariant is one you'll be tempted to break; if there's no
  temptation, it's not a real axis, just a to-do item.
- **Produces** — the intended outputs of this axis: the artifacts it
  must hand forward, each one destined to appear in some later axis's
  Requires or Invariants.

The contract is what makes an axis verifiable.  Checking the work
reduces to two bounded questions: were the invariants respected, and
were the produced artifacts delivered?

Below its contract, each axis skill expands as needed: the goal,
working instructions, and exit checks.

## Working protocol

When working axially:

1. **Announce the axis** on entry: name it, state its goal for this
   piece of work, and state its contract's invariants.
2. **Respect the invariants.**  When tempted to break one, don't;
   record the temptation as a note and carry it to the axis where that
   change belongs.
3. **Produce the contract's outputs** and verify them before leaving.
4. **Announce the transition**: name the next axis and the artifacts
   being handed forward.

Notes are artifacts like any other; several contracts require them.
Unless the project directs otherwise, keep them in a single
AXIAL-NOTES.md at the repository root (a name unlikely to collide
with a file the project already has), excluded from version control
(`.git/info/exclude` keeps it out without touching the project's
.gitignore), so they survive axis transitions — and changes of agent —
without landing in the pull request.

## Sequences

A sequence is a set of axes whose contracts interlock: each axis's
Produces feeds a later axis's Requires or Invariants.  This plugin
ships one predefined sequence, from an existing, already-chosen issue
through to a submitted pull request:

| Axis | Skill | Produces |
|---|---|---|
| Red | `axial:red` | a failing test (or a small batch) capturing the next requirement(s) |
| Green | `axial:green` | passing code, committed |
| Refactor | `axial:refactor` | improved code, tests green, committed |
| Pull-request | `axial:pull-request` | a submitted PR referencing the issue |

Red, green and refactor loop once per requirement — or once per small
batch of requirements, when red judges the interface settled enough
to batch.  The loop presumes a single shared working tree: red hands
its tests forward staged, not committed, and green commits each
red-green pairing together.  When the issue is fully covered, proceed
to pull-request.  Read each axis skill when you enter it, not before;
each carries its own contract and guidance.

## Adopting, extending, and writing axes

Users may take a predefined sequence as-is, mix in additional axes
(planning, review, debugging, triage, retrospecting, or a small-fix
axis for mechanical glitches noticed out of axis — a matter of taste
and project constraints), or write their own.

A new axis is a skill that opens with the standard contract (Requires,
Invariants, Produces) followed by whatever expanded guidance the axis
needs.  Design axes to complement their neighbors: minimal overlap,
and every Produces entry consumed somewhere.  When helping a user
design an axis, press on the invariants first: if the axis can't name
what it refuses to change, or the invariant carries no temptation, it
isn't well-formed yet.
