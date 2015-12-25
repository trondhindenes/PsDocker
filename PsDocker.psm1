Get-ChildItem $psscriptroot\*.ps1 | Foreach-Object { . $_.FullName }

$Script:CertThumbPrint = $null
$Script:DockerHost = $null
