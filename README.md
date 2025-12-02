# TMS_CLEANER

Különböző Visual Studio (Rider) projektek könnyebb feltöltését szolgáló szkriptek gyűjteménye, hogy ne kelljen manuálisan törölni azokat a mappákat, amiket az ELTE TMS rendszere nem enged feltölteni (pl.: `.vs`, `bin`, `obj`).

---

## Használat

A scriptet a használt operációs rendszernek megfelelően válaszd ki:

## 1. PowerShell Script (.ps1) - Windows
A parancssori környezet: **PowerShell**.

1. Nyisd meg a PowerShellt.
2. Futtasd a scriptet a **feltöltendő mappa elérési útjával**:

```powershell
.\TMS_PS.ps1 "C:\Projektek\MyApp"
```

## 2. Bash Script (.sh) - Linux, macOS, WSL
A parancssori környezet: **Bash Terminal** (Linux, macOS, Git Bash vagy Windows Subsystem for Linux - WSL).

1. Add meg a scriptnek a futtatási jogot (csak egyszer szükséges):
```shell
chmod +x tms_ps.sh
```
2. Futtasd a scriptet a feltöltendő mappa elérési útjával (győződj meg róla, hogy az útvonal a rendszerednek megfelelő formátumban van!):
```shell
./tms_ps.sh "/home/felhasznalo/Projektek/MyApp"
```

## Mit csinál a script?

* Törli a megadott mappában és almappáiban található, Visual Studio által generált build és cache mappákat:
  * `.vs` (Visual Studio rejtett konfiguráció)
  * `bin` (Build kimenet)
  * `obj` (Objektum fájlok/köztes build) 
* Létrehoz egy zip fájlt a mappa szülőkönyvtárában, így a projekt feltölthető formában marad:

```powershell
C:\Projektek\MyApp\        # megtisztítva
C:\Projektek\MyApp.zip     # feltölthető verzió
```

## Megjegyzések

* Ha a megadott mappa nem létezik, a script hibaüzenetet ír ki és leáll.
* A zip fájl felülírja a meglévőt, ha már létezik.
* A script minden rejtett és read-only fájlt is töröl a kiválasztott mappákból.
