Function Connect-PsDocker
{
    Param (
        [String]$CertThumbPrint,
        [String]$DockerHost,
        [Switch]$DisableCertCheck
    )
    
    #See if dockerhost is specifyed as an uri
    $DockerHostIsUri = $true
    try
    {
        $TestDockerUri = New-object -TypeName "System.Uri" -ArgumentList $dockerhost
    }
    Catch
    {
        $DockerHostIsUri = $false
    }
    
    if ($DockerHostIsUri -eq $false)
    {
        $DockerHost = "https://$($DockerHost):2376"
        
    }
    Write-Verbose "Storing Docker Host variable: $DockerHost"
    
    $Script:CertThumbPrint = $CertThumbPrint
    $Script:DockerHost = $DockerHost
    
    if ($DisableCertCheck)
    {
        add-type @" 
        using System.Net; 
        using System.Security.Cryptography.X509Certificates; 
        
        public class NoSSLCheckPolicy : ICertificatePolicy { 
            public NoSSLCheckPolicy() {} 
            public bool CheckValidationResult( 
                ServicePoint sPoint, X509Certificate cert, 
                WebRequest wRequest, int certProb) { 
                return true; 
            } 
        } 
"@ 
[System.Net.ServicePointManager]::CertificatePolicy = new-object NoSSLCheckPolicy 
    }
}