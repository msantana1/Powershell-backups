$compress = @{
    Path = "D:\user\Documentos\Sintitulo.mp4"
    CompressionLevel = "Fastest"
    DestinationPath = "D:\user\Documentos\Sintitulo.zip"
}
Compress-Archive @compress