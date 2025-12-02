#!/bin/bash

MAJ_MAPPA="$1"

if [ -z "$MAJ_MAPPA" ]; then
    echo "Hiba: Hiányzik a feltöltendő mappa elérési útja."
    echo "Használat: ./tms_ps.sh \"/út/a/projekt/mappához\""
    exit 1
fi

if [ ! -d "$MAJ_MAPPA" ]; then
    echo "Hiba: A megadott mappa nem létezik vagy nem elérhető: $MAJ_MAPPA"
    exit 1
fi

echo "Tisztítás indítása a(z) '$MAJ_MAPPA' mappában..."

MAPPAK_TÖRLÉSHEZ=(".vs" "bin" "obj")

for mappa_nev in "${MAPPAK_TÖRLÉSHEZ[@]}"; do
    find "$MAJ_MAPPA" -type d -name "$mappa_nev" -exec echo "Törlés: {}" \; -exec rm -rf {} \;
done

echo "Tisztítás befejezve."

echo "Tömörítés indítása..."

PARENT_DIR=$(dirname "$MAJ_MAPPA")
MAPPA_NEVE=$(basename "$MAJ_MAPPA")

ZIP_UT="$PARENT_DIR/$MAPPA_NEVE.zip"

if zip -r -9 -q "$ZIP_UT" "$MAJ_MAPPA"; then
    echo "Kész: A tömörített fájl elérési útja: $ZIP_UT"
else
    echo "Hiba: A ZIP fájl létrehozása sikertelen."
    exit 1
fi

exit 0