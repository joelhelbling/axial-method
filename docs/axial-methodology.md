# Problem Solving

## An Agentic Approach

For solving problems in the general case, it can be helpful to think in terms of _"axes"._  What do we mean by an
"axis"?  It means isolating one or more invariants, and permitting articulation in other parts of the system.  This
permits reasoning and work on a particular part of the problem without the confusion of working on the whole problem
at once.  When some parts of the system are held stationary, other parts can move and accomplish work in a controlled
way.

For example, when designing a car, any number of ways to change it's direction could be devised, but we use a steering
wheel whose effect is to change _only_ the orientation of the front wheels while keeping the car's body rigid.  This is
vastly simpler to design and build than, say, a car which turns the way a snake does.

Let's take another example: a software project.  Some examples of axes for that work might be:

### Setting up and Supporting
What infrastructure, technologies and dependencies meet the needs of the project?  Note that we would not consider
changing the code, nor the tests in this mode, those would be invariants for the current axis.

### Testing
In a test-driven development (TDD) project, we would consider the tests as an axis.  When working in this axis, in
true TDD fashion, we would not change the code, but would aim to create a failing test.  Making that test pass would
involve working in a different axis, i.e. the coding axis.

### Refactoring
When refactoring, we do not change the tests, because they are the invariant which assures that the code is still
correct.

### Pull Requesting
In the pull requesting axis, we do not change the code (although we might rebase the commits).  The goal is to write a 
a clear and concise description of the changes, which links/references the relevant issues and sources.

### Reviewing
In the reviewing axis, we consider the code as an invariant, and the pull request itself as invariant, but we would 
add comments to the PR, and create a review of the code in the PR.

### Planning
When planning, we don't go straight into coding.  The entire codebase (including tests) is an invariant in this axis.

### Issue reporting
In the issue reporting axis, we don't change the code, but we would create an issue, and write a clear and concise
description of the problem.

### Issue triaging
In this axis, we don't change the code, we don't change the meta work (e.g. issues, PRs, etc), but we _select_ one or
more issues to work on.

### Debugging
In the debugging axis, it is the _commits_ that are the invariant.  We might change the code temporarily, or write a
test harness to try to reproduce the problem, but we would not commit those changes, since the goal is to find the
root cause of the problem.

### Retrospecting
In this axis, the codebase is an invariant, as is any planning, or estimation.  Here we look at recent working
sessions, and try to understand what's working well, and what needs to be improved.

## What is an Axis?

In each of the above examples, the invariant is a key distinction.  The effectiveness is due to the things we do _not_
change in an axis, as much or more than by the things we do change.  The invariants are selected in order to stabilize
parts of the problem space, allowing us to reason about other aspects of the problem in a more focused way.

### The anatomy of an axis
From an agentic perspective, an axis is:

- a defintion of the axis, including
  - the goal of working in the axis
  - the invariants that are part of the axis
  - resources that are _referenced_ when working in the axis (but not to be changed)
  - the allowable outputs: changes and artifacts resulting from working in the axis
  - the _required_ outputs: artifacts resulting from working in the axis

The defined constraints and outputs also make work in an axis _verifiable_.  By constraining an agent to work in
way, you have narrowed acceptable outcomes, which makes it much easy to confirm correctness and completeness.

### Why is this useful?
I find that I tend to work in axes like this, and that I enjoy working in this way, and that it produces better
results.  The alternative is when I muddle axes together, often creating a mess which is hard to follow and hard
to reason about.  This is not a good way to work.

By the same token, agents with axial discipline will create work which is easier for humans to follow and reason
about.  Rather than having to ask,
- "Where are we, what is the agent doing right now?", or
- "What process is the agent following now?"

...the human can instead observe which axis is currently active, and then the questions become much more simple, like
- "Do I agree with this debugging approach?"
- "Is this a meaningful test?"
- "How helpful is this refactor?"

Axes can be defined down to arbitrary levels of granularity.  For example, in a web application, you might have
testing, refactoring, implmentation axes defined for _front-end_ work and another set for _back-end_ work.  This
could provide the means to tell the agent e.g. "You're working on the front-end, so don't change the back-end code."

## Implementation

In many systems, the axes could be defined as a set of skills, one to define the axial concept, and one for each
axis which is to be defined as a part of the work.  In this way, an agent may acquire some ability to discern or
select the next axis to work in, and to appropriately plan and execute work in that axis.  Another affordance that
could be useful for implementing axial work is **subagents**; you could define a separate agent to work in each axis.
Hooks could be another useful affordance, allowing for hard constraints on invariants (as well as helpful re-iteration
of those invariants in prompt form).

It may be easy enough to understand how invariants could make work in an axis simpler, but what about the bigger
picture?  How do we manage work involving multiple axes?  This is an important question, since not answering it
leaves the axial approach as a toy concept useful only for small tasks in isolation.

### Axial sequences

A good set of axes will be designed so that each axis complements and coordinates with the others.  Outputs from
one axis might be an invariant or a required resource for another axis.  Furthermore, some notion of the logical
process, the progression of work through one axis after another should be defined, likely as the base skill (if
using skills to define the axes).

Well-designs axes should avoid too much overlap, even, if possible, for the sake of disambiguating work _not_ to be
done in an axis.
