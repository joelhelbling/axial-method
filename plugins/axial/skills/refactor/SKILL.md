---
name: refactor
description: The refactor axis of the Axial Method — improve the structure and design of code while behavior holds still and the tests stay green.  Use this skill whenever the user asks to refactor, clean up, or restructure code that has test coverage, and whenever the green axis has just handed forward a passing suite in the axial issue-through-PR sequence.
---

# The Refactor Axis

## Contract

**Requires**
- the passing suite (from green) — the datum proving behavior is
  preserved
- the surrounding codebase's conventions and idioms
- notes handed forward from green

**Invariants**
- behavior — no new features, no bug fixes, no functionality no test
  demanded; a bug discovered here is a finding for a fresh red step
- the tests' assertions — a refactoring may oblige mechanical edits to
  tests (a renamed method or changed signature ripples into the tests
  that reference it), but only references and names move.  If an
  assertion has to change, behavior changed, and the work has left
  this axis

**Produces**
- behavior-preserving structural improvements, committed — or an
  explicit note that none were warranted this loop
- a full suite run confirming everything still passes
- notes for later axes (discoveries, candidate red steps)

## Goal

Improve the structure, clarity and design of the code touched by the
current loop, with no change in behavior.

## Instructions

Announce entry: name the axis and the invariants.

This axis is the housekeeping beat of the loop: tidying what the
current red-green work just touched — naming, duplication, structure —
while it's fresh.  A campaign of technical-debt recovery (hunting for
seams, writing characterization tests, restructuring subsystems) is a
different axis with a different contract; if the notes point toward
one, record it for the human rather than beginning it here.

Start from the notes green handed forward: tolerated duplication,
rushed naming, deferred structure.  Work in small steps, running the
suite between them, so any failure points at the step that caused it.

Refactoring is not obligatory.  If the code already sits well in its
surroundings, say so and move on; manufacturing churn is its own kind
of axis-muddling.

If a test fails, the refactoring caused it.  Revert or repair the
refactoring step; never weaken the test to accommodate it.

## Exit

Verify invariants: any test edits are references and names only, with
every assertion as green left it; full suite green.  Commit any
improvements.  Announce the handoff: loop back to `axial:red` if the
issue has uncovered requirements, or proceed to `axial:pull-request`
if the issue is fully satisfied.
