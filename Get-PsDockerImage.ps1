Function Get-PsDockerImage
{
    Try
    {
        $Result = Invoke-RestMethod -Uri "$($Script:DockerHost)/images/json" -CertificateThumbprint $Script:CertThumbPrint    
    }
    Catch
    {
        $err = $_
    }
    
    if ($Result)
    {
        return $Result    
    }
    Else
    {
        Write-error $err
    }
    
}
