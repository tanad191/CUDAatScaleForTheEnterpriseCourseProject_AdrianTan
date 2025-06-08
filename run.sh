#!/usr/bin/env bash
make
find data -type f ! -name ".gitkeep" | while read -r filepath; do
  filename=$(basename "input/$filepath")           # tree.ascii.pgm
  base="${filename%%.*}"                           # tree
  output_filename="${base}.pgm"                    # tree.pgm
  ./bin/imageSpatialFilterNPP --input="input/$filepath" --output="output/$output_filename"
done > output/output.txt