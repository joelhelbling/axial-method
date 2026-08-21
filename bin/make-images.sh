#!/usr/bin/env bash
# Generate optimized web assets from source images.
#
# Sources in images/ are canonical (crops are Joel's, baked in).
# This script only resizes and compresses into assets/ — it never
# modifies images/.  Re-run any time; output is deterministic.
#
# Usage: bin/make-images.sh

set -euo pipefail
cd "$(dirname "$0")/.."

mkdir -p assets

# opt <source> <output> <width>
#   Resize to <width> (never upscale), strip metadata, JPEG q82.
opt() {
  magick "images/$1" -auto-orient -resize "${3}>" -strip \
    -interlace Plane -quality 82 "assets/$2"
  echo "assets/$2  $(du -h "assets/$2" | cut -f1)"
}

# --- 2:1 / 3:1 banner plates (displayed ~788px wide; 2x = 1600) ---
opt maxim-tolchinskiy-Oz5hzB-d7G0-unsplash-cropped.png        hero-lathe.jpg      1600
opt bending-car.jpeg                                          concept-4b.jpg      1600
opt pexels-tanner-barrott-506845-8456734-rotated-cropped.png  mise-en-place.jpg   1600
opt pexels-lauren-diaz-768597919-19130312-rotated-cropped.png prep-complete.jpg   1600
opt pexels-tima-miroshnichenko-6790029-cropped.png            rip-to-width.jpg    1600
opt coding-red-green-refactor-cropped.png                     red-green.jpg       1600
opt welcome-to-vibeville-cropped.png                          vibeville.jpg       1600

# --- portrait-format prints (displayed 250-280px wide; 2x) ---
opt pexels-cottonbro-5089144-cropped.png                      jointer.jpg          500
opt pexels-tima-miroshnichenko-6790088.jpg                    hand-planer.jpg      560
opt joel-helbling-portrait.png                                joel-helbling.jpg    400
