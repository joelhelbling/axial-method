# Handoff notes — red → green (Issue 7 batch)

Batch scope: the discount-code behaviors of Cart#apply_code.

Failure evidence: each new test fails with NoMethodError (undefined
method 'apply_code') — the behavior doesn't exist yet.  The existing
suite still passes (4 runs, 0 failures).

Glimpsed but not written: nothing this loop.
