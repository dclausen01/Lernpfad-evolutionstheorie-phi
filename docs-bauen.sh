#!/bin/sh
# Baut die Web-Version und kopiert sie nach docs/ (GitHub Pages: Branch, Ordner /docs).
# Aufruf: ./docs-bauen.sh [Pfad zum Lernpfad-Baukasten]   (Standard: ../Lernpfad-baukasten)
set -e
cd "$(dirname "$0")"
BAUKASTEN="${1:-../Lernpfad-baukasten}"
python3 "$BAUKASTEN/skripte/bauen.py" .
rm -rf docs
cp -r ausgabe/web docs
touch docs/.nojekyll
echo "✓ docs/ aktualisiert – committen und pushen, dann ist GitHub Pages aktuell."
