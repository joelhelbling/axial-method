---
name: red
description: The red axis of the Axial Method — write a failing test, or a small batch of them, capturing the next requirement of the issue being worked, without touching production code.  Use this skill whenever starting test-driven work on an issue or requirement, whenever the user says to write a failing test, start the red phase, or begin the axial issue-through-PR sequence, whenever the green axis has returned a test for revision, and whenever the previous refactor axis has handed back an issue with requirements still uncovered.
---

# The Red Axis

## Contract

**Requires**
- the issue being worked (chosen before the sequence began)
- the codebase and its test suite
- any plan or spec artifacts handed into the sequence
- notes handed forward from a prior loop, if any
- a test returned by green for revision, if that's what triggered this
  entry

**Invariants**
- production code — no changes, however small or obvious the fix
- existing passing tests — they record requirements already covered.
  Tightening one into the new failing test is red's work; weakening
  one is not.  A test that seems to record a wrong requirement is
  flagged for the human and revised only with their confirmation
- the issue — flag problems with it for the human; don't reinterpret it

**Produces**
- a new failing test — or a small batch of them — capturing the next
  uncovered requirement(s) (→ invariant and target for green)
- evidence of failure: a suite run showing each new test failing for
  the right reason, with no other tests failing
- the new and changed tests staged with `git add`, uncommitted
  (→ how green tells red's work apart from its own)
- notes for later axes (e.g. the fix you glimpsed but didn't write)

## Goal

Produce a failing test — or a small, coherent batch of them — each
capturing an uncovered requirement of the issue, each failing for the
right reason.

## Instructions

Announce entry: name the axis, the requirement(s) the tests will
capture, and the invariants.

One test at a time is the default while the interface is still
emerging; each implementation tends to change the shape of the tests
that follow.  Batch only within a settled interface — say, the
behaviors of a single unit whose signature is already decided — and
keep the batch small enough that its scope fits in one sentence.
Don't write all the tests for the issue up front.

Sometimes the next requirement is best captured by tightening an
existing test with a more exacting specification.  That's red's work;
the tightened test becomes a failing target like any new one.

Run each new test and read the failure.  It must fail because the
behavior doesn't exist — an assertion failure, a missing method, or in
a compiled language an error naming the symbol the implementation will
add — not because of a typo or a broken fixture.

Name each test after its behavior, in the issue's vocabulary, so its
failure message tells a human which requirement is unmet.

You will likely see the fix while writing the test.  Do not implement
it; note it and hand it forward.

## Exit

Verify invariants: `git diff` shows test code only.  Stage the new
and changed tests; the sequence presumes red and green share a working
tree, and the staged tests are red's handoff, committed later by green
alongside the code that satisfies them.  Confirm each Produces entry
exists.  Announce the handoff — the failing tests are the datum for
the green axis — and invoke `axial:green`.
