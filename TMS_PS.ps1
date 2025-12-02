param(
    [string]$mappa
)
if ($mappa){
    if (-not (Test-Path $mappa)){
        Write-Output "Hiba: A megadott mappa nem létezik: $mappa"
        exit
    }
    Get-ChildItem -Path $mappa -Recurse -Directory | 
        Where-Object {
            $_.Name -Like ".vs" -or
            $_.Name -Like "bin" -or
            $_.Name -Like "obj"
        } |
        ForEach-Object {
            Remove-Item -LiteralPath $_.FullName -Recurse -Force
        }

    $parent = Split-Path -Path $mappa -Parent
    $name = Split-Path -Path $mappa -Leaf
    $zipPath = Join-Path $parent "$name.zip"

    Compress-Archive -Path $mappa -DestinationPath $zipPath -Force
    Write-Output "Kész: $zipPath"
}
else{
    Write-Output 'A Feltöltendő mappádat paraméterként add meg, a következő módon: .\TMS_PS.ps1 ":C:\Projektek\MyApp\"'
}