$dir = Split-Path $MyInvocation.MyCommand.Path
Push-Location $dir

$Source = Get-ChildItem "SFW\*.jpeg" , "SFW\*.jpg" , "SFW\*.png"
$numberSFW = [int]"0"
ForEach ($file in $Source) {
    cwebp $file -o $("SFW\" + [string]$numberSFW + ".webp") -m 6 -mt
    $numberSFW = $numberSFW + 1
}


$Source = Get-ChildItem "NSFW\*.jpeg" , "NSFW\*.jpg" , "NSFW\*.png"
$numberNSFW = [int]"0"
ForEach ($file in $Source) {
    cwebp $file -o $("NSFW\" + [string]$numberNSFW + ".webp") -m 6 -mt
    $numberNSFW = $numberNSFW + 1
}

$prompt = Read-Host "¿Mover a img ? [y/N]"
if( $prompt -like "y" ) {
    Remove-Item "..\img\SFW\*.webp"
    Remove-Item "..\img\NSFW\*.webp"
    Move-Item "SFW\*.webp"  -Destination "..\img\SFW"
    Move-Item "NSFW\*.webp"  -Destination "..\img\NSFW"

    Set-Content -Path "..\imgNumbers.js" -Value "// File genereated by SOURCE\convet.ps1"
    Add-Content -Path "..\imgNumbers.js" -Value $("var numberSFW = " + [string]$numberSFW)
    Add-Content -Path "..\imgNumbers.js" -Value $("var numberNSFW = " + [string]$numberNSFW)
}

Pop-Location