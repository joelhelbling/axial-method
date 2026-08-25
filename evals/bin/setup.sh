#!/bin/sh
# Builds the four eval sandboxes from evals/base plus per-scenario
# overlays.  Each sandbox is a standalone git repository, left in the
# exact state its scenario begins from.
#
# Usage: evals/bin/setup.sh [target-dir]
# Default target: a fresh directory under the system temp dir.

set -e

EVALS_DIR="$(cd "$(dirname "$0")/.." && pwd)"
TARGET="${1:-$(mktemp -d -t axial-evals)}"
mkdir -p "$TARGET"

fresh_repo() {
  # $1: sandbox name.  Copies base and makes the initial commit.
  rm -rf "$TARGET/$1"
  cp -R "$EVALS_DIR/base" "$TARGET/$1"
  cd "$TARGET/$1"
  git init -q
  git add -A
  git commit -qm "Cart with items, totals, and tests"
  echo "AXIAL-NOTES.md" >> .git/info/exclude
}

# Evals 1 and 2 begin from the untouched base: Issue 7 unstarted, the
# empty? bug lurking uncovered.
fresh_repo eval1-full-sequence
fresh_repo eval2-red-temptation

# Eval 3 begins at green's exit: ugly implementation, suite green,
# green's handoff notes waiting for refactor.
fresh_repo eval3-refactor-discipline
cp "$EVALS_DIR/overlays/eval3-refactor-discipline/lib/cart.rb" lib/cart.rb
cp "$EVALS_DIR/overlays/eval3-refactor-discipline/test/cart_discount_test.rb" test/cart_discount_test.rb
git add lib/cart.rb test/cart_discount_test.rb
git commit -qm "Add discount codes (issue 7)"
cp "$EVALS_DIR/overlays/eval3-refactor-discipline/AXIAL-NOTES.md" AXIAL-NOTES.md
bin/test >/dev/null 2>&1 || { echo "eval3 fixture suite is not green" >&2; exit 1; }

# Eval 4 begins at red's exit: the batch staged (one test wrong-shaped),
# nothing committed, red's handoff notes untracked.
fresh_repo eval4-green-wrong-test
cp "$EVALS_DIR/overlays/eval4-green-wrong-test/test/cart_discount_test.rb" test/cart_discount_test.rb
git add test/cart_discount_test.rb
cp "$EVALS_DIR/overlays/eval4-green-wrong-test/AXIAL-NOTES.md" AXIAL-NOTES.md

echo "Sandboxes ready under: $TARGET"
ls "$TARGET"
