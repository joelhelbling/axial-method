# Handoff notes — green → refactor (loop covering Issue 7)

Ugliness tolerated to get to green:

- nested if/else ladder in apply_code
- instance variables @dc and @f are rushed names
- the flat discount amount 5.0 is a magic number in total
- the discount logic in total grew by accretion; the percent and flat
  branches read as two bolted-on afterthoughts
