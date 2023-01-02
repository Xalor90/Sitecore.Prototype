Get-Item -Path ".env" | Remove-Item -Force -Verbose

Get-ChildItem -Path (Join-Path $PSScriptRoot "\docker\data") -Directory | ForEach-Object {
    $dataPath = $_.FullName

    Get-ChildItem -Path $dataPath -Exclude "readme.md" -Recurse | Remove-Item -Force -Recurse -Verbose
}

Get-ChildItem -Path (Join-Path $PSScriptRoot "\docker\traefik") -Directory | ForEach-Object {
    $itemPath = $_.FullName

    Get-ChildItem -Path $itemPath -Exclude "readme.md","dynamic" | Remove-Item -Force -Verbose
}
