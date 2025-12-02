# TMS_PS

Különböző Visual Studio projektek könnyebb feltöltését szolgáló PowerShell script, hogy ne kelljen manuálisan törölni azokat a mappákat, amiket az ELTE TMS rendszere (pl.: `.vs`, `bin`, `obj`) nem enged feltölteni.

---

## Használat

1. Nyisd meg a PowerShellt.
2. Futtasd a scriptet a **feltöltendő mappa elérési útjával**:

```powershell
.\TMS_PS.ps1 "C:\Projektek\MyApp"
```

## Mit csinál a script?

* Törli a megadott mappában és almappáiban található `.vs`, `bin` és `obj` mappákat.
* Létrehoz egy zip fájlt a mappa szülőkönyvtárában, így a projekt feltölthető formában marad:

```powershell
C:\Projektek\MyApp\        # megtisztítva
C:\Projektek\MyApp.zip     # feltölthető verzió
```

## Megjegyzések

* Ha a megadott mappa nem létezik, a script hibaüzenetet ír ki és leáll.
* A zip fájl felülírja a meglévőt, ha már létezik.
* A script minden rejtett és read-only fájlt is töröl a kiválasztott mappákból.
