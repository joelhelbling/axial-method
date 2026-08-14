# Site Copy — Draft 1

> Working draft of the full page narrative, top to bottom. Illustration
> placeholders are marked with `[FIG]`. Section labels in brackets are
> structural notes, not headings that necessarily appear on the page.

---

## [Hero]

# Hold something still.

Every difficult problem gets simpler when you stop trying to change
everything at once. **The Axial Method** is a way of working — for
people, and now for AI agents — built on one old idea: choose what
*won't* change, and the rest becomes workable.

---

## [The concept — steering wheel]

## One axis at a time

A car could change direction any number of ways. It could bend in the
middle. It could slither like a snake. Instead, we build a rigid body
and let exactly one thing move: the angle of the front wheels. That
single constraint — everything stays fixed except this — is what makes
a car steerable, buildable, and understandable.

That's an **axis**: a mode of work defined by its **invariants** — the
things deliberately held still — which free you to move precisely along
the one dimension that's open.

The surprising part is that an axis is defined less by what you're
doing than by what you're *refusing* to do. And you can feel the
difference between a real invariant and a trivial one:

> **A real invariant is one you'll be tempted to break.**
> Holding it still anyway is the discipline. If there's no temptation,
> there's no axis — just a to-do list.

You already know this pattern. You've used it your whole life. Let me
show you where.

---

## [Example 1 — The kitchen: the problem, and the first axis]

## 1. The kitchen

It's Saturday. You're baking cookies. The kitchen is a mess from last
night, so you're loading the dishwasher between steps. Halfway into the
dough you discover you're out of brown sugar, so now you're at the
store with butter softening on a cluttered counter. Back home, the
recipe says "add the dry ingredients" and you're measuring flour with
one hand while the mixer runs.

Nothing here is hard. And yet somehow it's chaos. The failure isn't in
any single task — it's that every axis is moving at once.

Cooks solved this centuries ago and gave the solution a name:
**mise en place**. Everything in its place *before* heat is applied.
Read the whole recipe. Check every ingredient. Measure, chop, arrange.
Only then, cook.

The invariant: **while you're prepping, the heat stays off.** You do
not fire up the skillet and melt the butter while the onion is still
unchopped — even though you'll be tempted to, because starting early
feels faster, and that temptation is exactly the point. The discipline
of the axis is refusing the tempting move.

The kitchen is full of axes — prep, cook, plate, clean — and mise en
place is the discipline for just one of them. How the axes fit
*together* is its own craft. For that, we go to the workshop.

---

## [Example 2 — The workshop: axes in sequence]

## 2. The workshop

`[FIG: 4-step CAD-style diagram sequence — rough board → datum face
hatched → edge squared against face → board at final thickness. Each
step labels the invariant surfaces as datums (A, B…) and shows one
arrow of permitted motion.]`

A woodworker starts with a rough, twisted board and needs it flat,
square, and true. No single operation can do that. Instead, tradition
prescribes a strict sequence:

**Flatten one face.** Just one. Ignore everything else about the board.

**Square one edge** — by pressing that flat face against the fence.
The face is now a *reference surface*: you work against it, and you
don't touch it again.

**Bring the board to thickness** — riding the flat face across the
planer bed. Face and edge: both frozen now.

**Rip to width** — guided by the squared edge.

Notice what happened. **The output of each axis became an invariant of
the next.** The flat face isn't just a finished task — it's the fixed
reference that makes the next operation possible at all. Engineers have
notation for this: on a technical drawing, the held-still surface is
marked as a *datum*, and every measurement is taken from it.

The woodworker's tools enforce the same idea physically. A clamp exists
to make something invariant. A drill press exists to permit motion
along exactly one axis. The workshop is full of machines for holding
things still — because holding things still is how precise work gets
done.

So: axes have invariants, and axes *compound* — each one's output
stabilizing the ground for work done in other axes. Sometimes that's a
direct sequence, as with the woodworker; often it's more like a graph,
one result serving as a reference in several other axes at once. One
more example, and you'll see why this matters more right now than it
ever has.

---

## [Example 3 — The code: invariants make work verifiable]

## 3. The code

Software developers rediscovered this pattern and, like the cooks, gave
it a name: **Red, Green, Refactor** — the cadence of test-driven
development.

**Red:** write a failing test. The code is invariant — you don't fix
anything yet, no matter how obvious the fix.

**Green:** make the test pass. Now the *test* is invariant — and here
is the tempting move the discipline forbids: when the test is
inconvenient, you might want to change the test instead of the code.
But you shouldn't.

**Refactor:** improve the code's structure. The tests stay green and
untouched — they are the datum surface proving the code still does
what it did.

And this example reveals the pattern's final property: **invariants
make work verifiable.** "Did the refactoring break anything?" is
unanswerable in a kitchen-chaos workflow where code and tests churn
together. Hold the tests still, and the question answers itself. The
thing you refuse to change is the thing that lets you *check* the
thing you did change.

Three domains, one shape:

| | The discipline | The invariant | The tempting move it forbids |
|---|---|---|---|
| Kitchen | Mise en place | The heat — off until prep is done | "I'll just heat the skillet real quick" |
| Workshop | Reference surfaces | The datum face | "One more pass on that face" |
| Code | Red-Green-Refactor | The failing/passing test | "I'll just change the test and the code together" |

---

## [The payoff — agents]

## Why this matters now

We are handing real work to AI agents. And the hardest problem with
agents isn't capability — it's *legibility*. An agent muddling every
axis at once produces the same thing you produced in that kitchen:
motion everywhere, and no way for anyone watching to reason about it.
The human overseeing the work is stuck asking the worst questions:
*What is it doing right now? What process is it even following?*

Give the agent axes, and everything changes:

- **Each axis has declared invariants** — the agent working the
  refactoring axis does not touch tests. The agent debugging does not
  commit. These aren't vibes; they're constraints you can enforce.
- **The work becomes observable.** The human no longer asks *what is
  the agent doing* — they can see which axis is active, and ask the
  good questions instead: *Is this a meaningful test? Do I agree with
  this debugging approach?*
- **The work becomes verifiable.** A narrow axis has narrow acceptable
  outputs. Checking an agent's work stops being an open-ended audit
  and becomes a bounded question: did it move only along the open
  axis, and did it produce the required artifacts?
- **Axes compound.** The output of the planning axis becomes an
  invariant of the coding axis — and a reference for testing and review
  besides. The structure itself — which axes, in what arrangement,
  handing off what — becomes the process, visible to everyone.

This is not a new demand we're placing on machines. It's the oldest
discipline of skilled work — the cook's mise en place, the
woodworker's datum face, the developer's untouched test — finally
written down clearly enough that we can hand it to an agent.

**Hold something still, and you can trust what moves.**

---

## [CTA]

## Put it to work

I'm building an open set of axis definitions for agentic software
development — skills, subagents, and hooks that give an agent axial
discipline out of the box. *(Coming soon — watch this space, or the
repo.)*

If you're thinking about how your organization adopts agentic
development without losing the ability to reason about the work — I'd
love to talk. This is what I do.

`[Link: email / LinkedIn / GitHub]`

---

## [Bio]

## About the author

**Joel Helbling** has been building software for [N] years — Perl,
Java, Ruby, JavaScript, and a stint as a DBA — and now works as an
Engagement Partner at [Test Double](https://testdouble.com), where he
helps teams do difficult software work well. He remains convinced that
the main technological challenges recur over and over, no matter the
current paradigm — which is more or less what this page is about.

`[FIG: photo, or a CAD-style portrait line drawing]`
