$dir = Split-Path $MyInvocation.MyCommand.Path
Push-Location $dir

$Source = Get-ChildItem "Main\*.jpeg" , "Main\*.jpg" , "Main\*.png"
$numberMain = [int]"0"
ForEach ($file in $Source) {
    cwebp $file -o $("Main\" + [string]$numberMain + ".webp") -m 6 -mt -resize 0 600
    $numberMain = $numberMain + 1
}


$Source = Get-ChildItem "Alt\*.jpeg" , "Alt\*.jpg" , "Alt\*.png"
$numberAlt = [int]"0"
ForEach ($file in $Source) {
    cwebp $file -o $("Alt\" + [string]$numberAlt + ".webp") -m 6 -mt -resize 0 600
    $numberAlt = $numberAlt + 1
}

$prompt = Read-Host "¿Mover a img ? [y/N]"
if( $prompt -like "y" ) {
    Remove-Item "..\img\Main\*.webp"
    Remove-Item "..\img\Alt\*.webp"
    Move-Item "Main\*.webp"  -Destination "..\img\Main"
    Move-Item "Alt\*.webp"  -Destination "..\img\Alt"

    Set-Content -Path "..\imgNumbers.js" -Value "// File genereated by SOURCE\convet.ps1"
    Add-Content -Path "..\imgNumbers.js" -Value $("var numberMain = " + [string]$numberMain)
    Add-Content -Path "..\imgNumbers.js" -Value $("var numberAlt = " + [string]$numberAlt)
}

Pop-Location