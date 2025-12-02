#!/bin/bash
INPUT_DIR="$1"

if [ -z "$INPUT_DIR" ]; then
    echo "Hiba: Hiányzik a mappa."
    echo "Használat: tms ./"
    exit 1
fi

if cd "$INPUT_DIR"; then
    FULL_PATH=$(pwd)
    cd - > /dev/null 
else
    echo "Hiba: A mappa nem létezik: $INPUT_DIR"
    exit 1
fi

MAPPA_NEVE=$(basename "$FULL_PATH")
SZULO_MAPPA=$(dirname "$FULL_PATH")
ZIP_NEV="$MAPPA_NEVE.zip"
ZIP_TELJES_UT="$SZULO_MAPPA/$ZIP_NEV"

echo "------------------------------------------------"
echo "Célpont: $MAPPA_NEVE"
echo "Tisztítás..."
echo "------------------------------------------------"

for item in ".vs" "bin" "obj"; do
    find "$FULL_PATH" -type d -name "$item" -exec rm -rf {} + 2>/dev/null
done

echo "Tömörítés..."

cd "$SZULO_MAPPA"

if zip -r -9 -q "$ZIP_NEV" "$MAPPA_NEVE"; then
    echo "SIKER!"
    echo "Létrejött: $ZIP_TELJES_UT"
else
    echo "Hiba történt a tömörítéskor."
    exit 1
fi

exit 0