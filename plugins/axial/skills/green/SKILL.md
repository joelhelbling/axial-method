---
name: green
description: The green axis of the Axial Method — make the failing test pass without changing any test.  Use this skill whenever there is a failing test to satisfy, whenever the user says to make the test pass, go green, or implement against the red test, and whenever the red axis has just handed forward a failing test in the axial issue-through-PR sequence.
---

# The Green Axis

## Contract

**Requires**
- the failing test and its failure output (from red)
- the issue being worked
- notes handed forward from red

**Invariants**
- all tests — the new failing one and the existing suite alike; a test
  that now looks wrong is reported and corrected via a fresh red step,
  never edited here
- the scope of the requirement — implement what the test demands, not
  features you can foresee

**Produces**
- production code making the target test pass
- evidence of green: a full suite run with everything passing
  (→ datum for refactor)
- a commit recording the red-green pair
- notes for refactor (the ugliness tolerated to get here)

## Goal

Make the failing test handed forward from red pass, while keeping
every other test passing.

## Instructions

Announce entry: name the axis, the test being satisfied, and the
invariants.

Write the simplest implementation that honestly satisfies the test.
Defer generality the tests don't yet demand, but don't game the
assertion (e.g. a hard-coded return value) unless it's a deliberate
stepping stone the next red step will dislodge.

Ugly is acceptable; separating "make it work" from "make it good" is
why green and refactor are distinct axes.  Note the ugliness you leave
behind and hand it forward.

If the new code breaks an existing test, that test is equally
invariant: adjust the implementation until the whole suite is green.

## Exit

Verify invariants: no test files changed.  Run the full suite; confirm
all green.  Commit in the repository's style, describing the behavior
added.  Announce the handoff — the green suite is the datum for the
refactor axis — and invoke `axial:refactor`.
