# Site Copy - Draft 1.1

> Working draft of the full page narrative, top to bottom. Illustration
> placeholders are marked with `[FIG]`. Section labels in brackets are
> structural notes, not headings that necessarily appear on the page.

---

## [Hero]

# Hold something still.

Difficult problems get simpler when we stop trying to change everything
all at once. **The Axial Method** is a way of working, an old, familiar,
and proven approach: at every stage, choose what _won't_ change, and what
will.  This works with all kinds of problems, from baking cookies to
building a house.  Saavy builders have used it for millennia, and now
it has new relevance for AI agents.

---

## [The concept — steering wheel]
### One axis at a time

A car could change direction any number of ways.  It could bend in the
middle.  It could slither like a snake.  But instead, we build a rigid
body and allow exactly one thing to move: the angle of the front wheels.
That single constraint is what makes a car easy to understand, easy to
design, easy to build and easy to use.

That's the essence of an **axis**: a mode of work defined not only by
its objectives, but also by its **invariants**.  The factors deliberately
held still are the very ones that free you to work with precision
along the one dimension that's open.

It may seem surprising that an axis should be defined as much by what
you're refusing to do as by what you're trying to accomplish.  You can
sense the difference between a meaningful invariant and an arbitrary one:

> **A real invariant is one you'll be tempted to break.**
> Holding it still requires discipline.  If there's no temptation,
> it's not a real axis — just an arbitrary step in a to-do list.

You already know this pattern.  You've used it your whole life.  Let's
look at some common examples.

---

## [Example 1 — The kitchen: the problem, and the first axis]

### 1. The kitchen

It's Saturday afternoon, and you've decided it's time to baking cookies.
The kitchen is a mess since last night, so you're loading the dishwasher
between steps.  Halfway into mixing the dry ingredients, you discover
you're out of brown sugar.  Now youre at the grocery store, leaving the
butter softening on a cluttered counter.  Back at home, the recipe says
"blend the wet ingredients" but you've already cracked the eggs into the
flour while the mixer runs.

None of these tasks is difficult.  And yet somehow it's chaos.  The failure
isn't in any single technique, it's that every axis is moving at once.

Chefs solved this centuries ago; they call it **mise en place**.  Everything
in its place _before_ mixing, before heat is applied.
- Read the whole recipe.
- Gather every ingredient.
- Measure, chop, arrange.

Then, and only then, cook.

Notice the invariants?  **While you're prepping, the heat stays off.**  You
don't form the cookies before mixing in the chocolate chips, and you don't
mix the chocolate chips into the dry ingredients.  As tempting as it may
be to knock off as many tasks as quickly as possible, success depends on
the discipline of respecting the invariants in each axis.

The kitchen is full of axes: prepping, cooking, plating, cleaning...and
mise enpace is the discipline for just one of them.  How the axes _fit
together_ is its own craft.  To demonstrate that, let's go to the workshop.

---

## [Example 2 -- The workshop: axes in sequence]

### 2. The workshop

`[FIG: 4-step CAD-style diagram sequence — rough board → datum face
hatched → edge squared against face → board at final thickness. Each
step labels the invariant surfaces as datums (A, B…) and shows one
arrow of permitted motion.]`

A woodworker starts with a rough, twisted board.  The design calls for
it to be flat, square, and true.  There is no single operation that can
accomplish all that at once.  Instead, tradition prescribes a time-honored
sequence:

**Flatten one face.** Just one.  Ignore all other surfaces.  If it wobbles,
shim it so it's stable, then work until that one face is perfectly flat.

**Square one edge** — a clean straight code, as square as possible.  The
flattened face in the previous step is now a *reference surface* that
allows the board to light flat so we can get a clean cut on the edge.

**Bring the board to thickness** — riding the flat face across the
planer bed.

**Rip to width** — guided by the squared edge.

Note how **the output of each axis became an invariant _and also a
reference_ for the next.**  The first flat face isn't just a completed
step, it's also the fixed reference that makes the next operatoin
possible.  Engineers have notation for this: on a technical drawing, the
invariant surface is marked as a _datum_, and every measurement is taken
from that datum.

The woodworker's tools enforce the same idea physically.  A clamp exists
to restrict motion of something otherwise moveable.  A drill press constrains
drilling along a single axis.  Every workshop is full of machines for
holding things or dimensions of things _still_.  We hold things still
in order to do precise work.

So: axes have invariants, and axes _compound_: each one's output
stabilizes the ground for work done in other axes.  Sometimes that's a
direct sequence, as with the woodworker; often it's more complex, with
one result serving as a reference in several other axes at once, or a
given invariant enforced in several different axes.

Let's look at one more example, to demonstrate why this matters in the
era of agentic AI.

---

## [Example 3 — The code: invariants make work verifiable]

### 3. The code

Software developers also use this pattern, and like the chefs, they
give names to their methods.  One of those is called **Red, Green, Refactor**,
and it's the cadence of test-driven development.

**Red:** write a failing test.  Here the code is invariant — you might be
tempted to fix the code, but don't do that yet, no matter how obvious the fix!

**Green:** now we make the test pass.  This is the fun part!  Note that now the
_test_ is invariant: it might be tempting to change the test instead of the code
but you shouldn't.  That's the discipline of this axis.

**Refactor:** think the last step was fun?  Now you get to improve the code's
structure, design and coherence!  In this axis we keep the tests as invariant
once again: they are the datum surface proving the code still functions as
it should.

This example reveals Axial Methodology's final property: **invariants
make work _verifiable_.**  "Did the refactoring break anything?"  That
question is unanswerable in a kitchen-chaos workflow where code and
tests churn together.  By holding the tests still, we can definitively
answer the question.  The invariant you refuse to mutate is the datum that
lets you verify the part you did change.

---

## [The payoff — agents]

### Why this matters now

Today we are handing off real work to AI agents.  The biggest problem with
this isn't capability — it's _legibility_.  An agent muddling every
axis at once produces the same kitchen-chaos we saw while baking cookies:
motion everywhere, and no way for an observer to reason about it.  The
human overseeing the work is left asking the worst kind of questions:
_What's going on right now?  What process is it even following?_

But give your agents axes, and everything improves:

- **Each axis has declared invariants,** so the agent doing refactoring
  does not touch tests.  The debugging agent does not commit their
  experimental edits.  These aren't just vibes; they're constraints you
  can enforce.
- **The work becomes observable.**  The human no longer has to ask _what
  is this agent doing?_  They can see which axis is active, and ask more
  targeted questions instead: _Is this a meaningful test?  Do I agree
  with this debugging approach?_
- **The work becomes verifiable.**  A narrow axis has narrow acceptable
  outputs.  When checking an agent's work, we move from open-ended audits
  to bounded questions: were the invariants respected, and did it produce
  the required artifacts?
- **Axes compound.**  Artifacts from planning becomes invariants in the
  coding axis, and a reference for testing and review besides.  The
  structure itself --which axes, in what arrangement, with what handoffs
  and invariants-- these become the process, easily visible and discoverable.

This isn't a new style of work devised just for agents.  It's the oldest
discipline in skilled work: the cook's mise en place, the woodworker's
clamp, the engineer's datum face and the developer's untouched test, now
re-expressed in a form that can be used to direct an agent.

**Hold part of a system still so you can work with the rest of it.**

---

## [CTA]

### Put it to work

I'm building an open set of axis definitions for agentic software
development — skills, subagents, and hooks that give an agent axial
discipline out of the box. *(Coming soon — watch [the repo](https://github.com/joelhelbling/axial-method).)

If you're thinking about how your organization adopts agentic development
without losing the ability to understand the work — I'd love to talk!  This
is what we do at [Test Double](https://testdouble.com), the awesome company where
I work.

`[Link: LinkedIn / GitHub]`

---

## [Bio]

### About the author

**Joel Helbling** has been building software for over 30 years; from Pascal
and Perl, to Java, Ruby & JavaScript.  Today he works as an Engagement Partner
at [Test Double](https://testdouble.com), where he helps teams solve today's
technology problems without losing control of the future.

[FIG: photo, or a CAD-style portrait line drawing]
