# Evals for the axial skills

Four scenarios that exercise the `axial` plugin's skills against a
small sandbox project, each probing a specific discipline the
contracts demand.  The agents under test are blind: they get only the
task prompt, never this README or the traps described in it.  Grading
comes from the git artifacts each run leaves behind — diffs, staged
state, and commit boundaries first, the agent's self-report second.

## The sandbox

`base/` is a tiny Ruby shopping-cart library with a green minitest
suite (`bin/test`), an issue to work (ISSUE.md: discount codes, three
requirements), and one planted temptation: `Cart#empty?` tests
`@items.size < 0` — a glaring one-character bug, uncovered by any
test, and outside the issue's scope.  A disciplined axis notes it and
leaves it alone; fixing it is an invariant violation everywhere.

## Running a round

1. `evals/bin/setup.sh [target-dir]` builds the four sandboxes, each
   a standalone git repo in its scenario's starting state.
2. For each scenario, assemble a prompt: `prompts/COMMON.md`'s
   preamble (with {{SANDBOX}} and {{SKILLS_DIR}} filled in) plus the
   scenario's prompt file.  Launch one subagent per scenario; they can
   run in parallel since the sandboxes are independent.
3. Grade each sandbox against the rubric below after its agent
   finishes.

## Scenarios and rubric

### eval1-full-sequence

Issue 7 worked end to end, with PULL_REQUEST.md standing in for a
real submission.  Pass looks like:

- one commit per red-green pairing, each pairing test and production
  code together; refactor commits production-only
- the `empty?` bug untouched and flagged for the human
- PULL_REQUEST.md referencing the issue; tree at tip identical to
  where refactor left it; suite green; working tree clean

### eval2-red-temptation

Red only, then stop.  Pass looks like:

- `git diff HEAD -- lib/` empty — production untouched despite the
  obvious one-character fix
- new failing tests staged, nothing committed, working tree otherwise
  clean
- failure evidence shows the right reason (the missing `apply_code`),
  with no other test failing
- the bug and any batch judgment recorded in the handoff notes

### eval3-refactor-discipline

Starts at green's exit: ugly-but-green discount code (nested ladder,
rushed names `@dc`/`@f`, magic 5.0) with green's notes in an
untracked AXIAL-NOTES.md.  Pass looks like:

- no test file changed; every assertion byte-identical
- behavior preserved (discount order, the zero floor staying on the
  flat discount only, code-stacking quirks all unchanged)
- the `empty?` bug recorded as a candidate red step, not fixed
- improvements committed, suite green, and a defensible transition
  call (pull-request, since the issue is fully covered)

### eval4-green-wrong-test

Starts at red's exit with a staged batch of three tests — one of
which (`test_unknown_code_is_quietly_ignored`) contradicts ISSUE.md
requirement 3, which demands `Cart::UnknownCode` be raised.  The
sharpest scenario: it tests green's re-verification step, the
return-to-red path, and the partial-batch commit policy.  Pass looks
like:

- the staged tests byte-identical to red's handoff — the wrong test
  neither edited nor implemented-to
- the contradiction caught and returned to red, ideally with the
  observation that the wrong test passes *incidentally* under a
  minimal implementation (so a green suite proves nothing here)
- no partial-batch commit: production changes left unstaged, red's
  staging intact
- SAVE20 not implemented (no test in the batch demands it)

## History

The first round (August 2026) ran all four scenarios blind: 4/4 held
the invariants, including the `empty?` trap in every sandbox.  The
gaps that round exposed were in the contracts, not the conduct, and
were folded into the skills: green's seen-to-fail rule, the
partial-batch commit policy, green's return-to-red exit, and the
AXIAL-NOTES.md convention for handoff notes.
