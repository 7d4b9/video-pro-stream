

#!/bin/bash

set -e

INPUT_DIR="$HOME/Videos/vegito-recordings"
OUTPUT_DIR="$INPUT_DIR/converted"
mkdir -p "$OUTPUT_DIR"

echo "🎥 Conversion des vidéos MKV en MP4..."
for file in "$INPUT_DIR"/*.mkv; do
  [ -e "$file" ] || continue
  filename=$(basename -- "$file")
  name="${filename%.*}"
  output="$OUTPUT_DIR/${name}.mp4"

  echo "⏳ Conversion de $filename..."
  ffmpeg -i "$file" -c:v copy -c:a aac -b:a 192k "$output"
  echo "✅ Fichier converti : $output"
done

echo "🏁 Conversion terminée. Tous les fichiers sont dans : $OUTPUT_DIR"