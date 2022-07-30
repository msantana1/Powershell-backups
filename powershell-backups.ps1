#$file = "D:\user\Documentos\Sintitulo.mp4"
$file = $args[0]

$label_date = Get-Date -Format "MM-dd-yyyy-HH-mm"
$label_path = Split-Path -Path $file
$label_name = Get-ChildItem $file
$label_zip = $label_path+"\"+$label_name.BaseName+"_"+$label_date+".zip"


$compress = @{
    Path = $file
    CompressionLevel = "Fastest"
    DestinationPath = $label_zip
}

if(Test-Path -Path $file -PathType Leaf){
    #Write-Host $file
    #Write-Host $label_zip
    Write-Host "INFO: Creando backup..."
    try {
        Compress-Archive @compress
    }
    catch {
        throw $_.Exception.Message
    }
}
else{
    Write-Host "ERROR: El archivo orignal no existe"
}

if(Test-Path -Path $label_zip -PathType Leaf){
    Write-Host "SUCCESS: Backup creado exitosamente"
}
else {
    Write-Host "ERROR: Backup no creado"
}