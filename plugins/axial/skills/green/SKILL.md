---
name: green
description: The green axis of the Axial Method — make the failing tests pass, one at a time, without changing any test.  Use this skill whenever there is a failing test to satisfy, whenever the user says to make the test pass, go green, or implement against the red test, and whenever the red axis has just handed forward failing tests in the axial issue-through-PR sequence.
---

# The Green Axis

## Contract

**Requires**
- the failing test or batch, staged, with its failure output (from red)
- the issue being worked
- notes handed forward from red

**Invariants**
- every test — target tests are satisfied, never edited, and no other
  test may fail.  A test that now looks wrong-shaped goes back to red
  for revision; it is not adjusted here
- the scope of the requirement — implement what the tests demand, not
  features you can foresee

**Produces**
- production code making the target tests pass
- evidence of green: a full suite run with nothing failing
  (→ datum for refactor)
- commits recording the red-green work — one per test where the
  changes separate cleanly, one for the batch otherwise
- notes for refactor (the ugliness tolerated to get here)

## Goal

Make the failing tests handed forward from red pass, one at a time,
without any other test failing.

## Instructions

Announce entry: name the axis, the test(s) being satisfied, and the
invariants.

Work one test at a time.  Before implementing against a test, run it
and confirm it still fails for the right reason; earlier work in the
batch may have changed the ground under it.  If it now looks
wrong-shaped, return it to red for revision — with a batch this is
occasionally expected, not exceptional.

The working rule is _change the error or make it pass_: each run of
the target test should either go green or fail with a different, more
advanced error than the last.  A failure to compile is just another
kind of red; keep changing the error until the test passes.

Write the simplest implementation that honestly satisfies the test.
Defer generality the tests don't yet demand, but don't game the
assertion (e.g. a hard-coded return value) unless it's a deliberate
stepping stone the next red step will dislodge.

Ugly is acceptable; separating "make it work" from "make it good" is
why green and refactor are distinct axes.  Note the ugliness you leave
behind and hand it forward.

If the new code makes another test fail, that test is equally binding:
adjust the implementation until nothing fails.

Commit as each test passes when the changes separate cleanly; commit
the batch as a whole when they don't.  Either way, write messages in
the repository's style describing the behavior added, and land the
tests red staged together with the code that satisfies them.

## Exit

Verify invariants: the only test changes in this loop's commits are
the ones red staged, and the unstaged diff, throughout, held
production code only.  Run the full suite; confirm nothing fails.
Announce the handoff — the green suite is the datum for the refactor
axis — and invoke `axial:refactor`.
