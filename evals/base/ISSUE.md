# Issue 7: Support discount codes

Customers should be able to apply a discount code to their cart.

Requirements:

1. `Cart#apply_code(code)` accepts a percent-off code and the discount
   is reflected in `total`.  Supported percent codes: "SAVE10" (10%
   off) and "SAVE20" (20% off).
2. The code "FIVER" takes a flat 5.00 off the total.  A flat discount
   never reduces the total below zero.
3. Applying an unknown code raises `Cart::UnknownCode`.
