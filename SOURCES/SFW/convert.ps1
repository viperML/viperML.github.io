$Source = Get-ChildItem "*.jpeg" , "*.jpg" , "*.png"

$fileNumber = [int]"1"

ForEach ($file in $Source) {
    cwebp $file -o $([string]$fileNumber + ".webp") -m 6 -mt
    $fileNumber = $fileNumber + 1
}

$prompt = Read-Host "¿Mover a img/SFW ? [y/N]"
if( $prompt -like "y" ) {
    Remove-Item "..\..\img\SFW\*.webp"
    Move-Item "*.webp"  -Destination "..\..\img\SFW"
}