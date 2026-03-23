#!/usr/bin/env bash
# Convert figures in ./figures/ to dark-theme versions in ./.figures/:
#   - PNGs and SVGs: copied directly (SVGs get recolored)
#   - PDFs: converted to SVG via mutool, then recolored
#   - Color replacement: black -> #cccccc, white -> transparent
# Wipes .figures/ and rebuilds from scratch each run.

set -euo pipefail

SCRIPT_DIR="$(dirname "$0")"
SRC_DIR="$SCRIPT_DIR/../figures"
DST_DIR="$SCRIPT_DIR/../.figures"

rm -rf "$DST_DIR"
mkdir -p "$DST_DIR"

# Recolor an SVG: black -> #cccccc, white -> transparent
recolor_svg() {
  local svg="$1"
  sed -i \
    -e 's/rgb(0%, 0%, 0%)/#cccccc/g' \
    -e 's/rgb(0,0,0)/#cccccc/g' \
    -e 's/rgb(0, 0, 0)/#cccccc/g' \
    -e 's/#000000/#cccccc/g' \
    -e 's/#000/#cccccc/g' \
    -e 's/fill="black"/fill="#cccccc"/g' \
    -e 's/stroke="black"/stroke="#cccccc"/g' \
    -e 's/fill:black/fill:#cccccc/g' \
    -e 's/stroke:black/stroke:#cccccc/g' \
    -e 's/rgb(100%, 100%, 100%)/transparent/g' \
    -e 's/rgb(255,255,255)/transparent/g' \
    -e 's/rgb(255, 255, 255)/transparent/g' \
    -e 's/#ffffff/transparent/gi' \
    -e 's/#fff\b/transparent/g' \
    -e 's/fill="white"/fill="transparent"/g' \
    -e 's/stroke="white"/stroke="transparent"/g' \
    -e 's/fill:white/fill:transparent/g' \
    -e 's/stroke:white/stroke:transparent/g' \
    "$svg"

  # Set default fill="#cccccc" on root <svg> so elements without explicit fill
  # (paths, glyphs, text) inherit light gray instead of the SVG default (black)
  sed -i 's/<svg /<svg fill="#cccccc" /' "$svg"

}

# Process a single source file
process_file() {
  local src="$1"
  local relpath="${src#$SRC_DIR/}"
  local base="${relpath%.*}"
  local ext="${src##*.}"

  case "$ext" in
    png)
      local dst="$DST_DIR/$base.png"
      mkdir -p "$(dirname "$dst")"
      echo "Copying $(basename "$src")"
      cp "$src" "$dst"
      ;;
    svg)
      local dst="$DST_DIR/$base.svg"
      mkdir -p "$(dirname "$dst")"
      echo "Copying + recoloring $(basename "$src")"
      cp "$src" "$dst"
      recolor_svg "$dst"
      ;;
    pdf)
      local dst="$DST_DIR/$base.svg"
      mkdir -p "$(dirname "$dst")"
      echo "Converting $(basename "$src") -> ${base}.svg"
      local tmp_dst="$DST_DIR/${base}1.svg"
      mutool convert -F svg -o "$DST_DIR/$base.svg" "$src" 2>/dev/null
      if [ -f "$tmp_dst" ] && [ ! -f "$dst" ]; then
        mv "$tmp_dst" "$dst"
      fi
      recolor_svg "$dst"
      ;;
  esac
}

# Find all source files recursively
find "$SRC_DIR" -type f \( -name '*.png' -o -name '*.svg' -o -name '*.pdf' \) | sort | while read -r src; do
  process_file "$src"
done

echo "Done."
