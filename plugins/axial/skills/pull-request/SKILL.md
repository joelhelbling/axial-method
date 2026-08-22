---
name: pull-request
description: The pull-request axis of the Axial Method — with the code now invariant, shape the commits and write a clear PR that tells the story of the change and references its issue.  Use this skill whenever the user asks to open, submit, or write up a pull request, and whenever the refactor axis has concluded an axial issue-through-PR sequence with the issue fully satisfied.
---

# The Pull-Request Axis

## Contract

**Requires**
- the issue being worked
- the branch's commit history and its diff against the base branch
  (the accumulated product of the red-green-refactor loops)
- the repository's PR conventions and templates
- notes handed forward from earlier axes

**Invariants**
- the code, tests included — no edits of any kind; the temptation here
  is the little fix spotted while writing the description, and it
  belongs in another loop.  (Reshaping _commits_ — rebase, squash,
  reword — is allowed, since the resulting tree stays identical.)
- the issue — the PR describes what was done; it doesn't redefine what
  was asked

**Produces**
- a submitted pull request referencing the issue, with a clear and
  concise description of the changes (→ the artifact the sequence
  exists to produce; reference and invariant for any review axis)

## Goal

Submit a pull request that lets a reviewer understand the change
quickly: what it does, why, and how it was verified.

## Instructions

Announce entry: name the axis and the invariants.

Read the full diff against the base branch before writing; describe
what the diff shows, not what you remember doing.  If the commit
history would confuse a reviewer (fixups, dead ends, "wip"), reshape
it into a reviewable sequence and verify the tree is unchanged
afterward.

Follow the repository's conventions: use the PR template if one
exists, and match the title style of recent merged PRs.  Reference the
issue so the tracker link is live.  Cover what changed and why, note
anything a reviewer might find surprising, and state how the change
was verified — for an axial branch, the red-green-refactor evidence.

If you notice a defect or worthwhile improvement while writing, record
it in the PR description or as a new issue.  The code stays still.

## Exit

Verify invariants: the tree at the branch tip is identical to where
refactor left it.  Submit the PR and confirm the issue reference
resolved.  Announce completion of the sequence with a link to the PR.
