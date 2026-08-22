---
name: red
description: The red axis of the Axial Method — write a failing test that captures the next requirement of the issue being worked, without touching production code.  Use this skill whenever starting test-driven work on an issue or requirement, whenever the user says to write a failing test, start the red phase, or begin the axial issue-through-PR sequence, and whenever the previous refactor axis has handed back an issue with requirements still uncovered.
---

# The Red Axis

## Contract

**Requires**
- the issue being worked (chosen before the sequence began)
- the codebase and its test suite
- any plan or spec artifacts handed into the sequence
- notes handed forward from a prior refactor loop, if any

**Invariants**
- production code — no changes, however small or obvious the fix
- existing passing tests — they record requirements already covered
- the issue — flag problems with it for the human; don't reinterpret it

**Produces**
- a new failing test capturing the next uncovered requirement
  (→ invariant and target for green)
- evidence of the failure: a suite run showing the new test failing
  and all previously passing tests still passing
- notes for later axes (e.g. the fix you glimpsed but didn't write)

## Goal

Produce one failing test that captures the next uncovered requirement
of the issue, failing for the right reason.

## Instructions

Announce entry: name the axis, the requirement the test will capture,
and the invariants.

Pick the _next_ requirement, singular — one behavior, small enough for
green to satisfy without a long excursion.  Don't write all the tests
for the issue up front; later requirements often change shape once
earlier ones are implemented.

Run the new test and read the failure.  It must fail because the
behavior doesn't exist (an assertion failure, or a missing method the
implementation will add), not because of a typo, missing import, or
broken fixture.

Name the test after the behavior, in the issue's vocabulary, so its
failure message tells a human which requirement is unmet.

You will likely see the fix while writing the test.  Do not implement
it; note it and hand it forward.

## Exit

Verify invariants: `git diff` shows test code only.  Confirm each
Produces entry exists.  Announce the handoff — the failing test is the
datum for the green axis — and invoke `axial:green`.
