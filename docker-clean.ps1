[CmdletBinding()]
Param (
	[string]
	[ValidateNotNullOrEmpty()]
	$EnvFilePath = ".\.env",

	[string]
	$DataFolderPath = ".\docker\data",

	[string]
	$DeployFolderPath = ".\docker\deploy\website",

	[string]
	$CertFolderPath = ".\docker\traefik\certs"
)

if (Test-Path $EnvFilePath) {
	Remove-Item $EnvFilePath -Force
}

if (Test-Path $DataFolderPath) {
	Get-ChildItem -Path $DataFolderPath -Directory | ForEach-Object {
		$dataSubfolderPath = $_.FullName

		Get-ChildItem -Path $dataSubfolderPath -Exclude "readme.md" -Recurse | Remove-Item -Force -Recurse -Verbose
	}
}

if (Test-Path $DeployFolderPath) {
	Get-ChildItem -Path $DeployFolderPath -Exclude "readme.md" -Recurse | Remove-Item -Force -Verbose
}

if (Test-Path $CertFolderPath) {
	Get-ChildItem -Path $CertFolderPath -Exclude "readme.md" | Remove-Item -Force -Verbose
}
