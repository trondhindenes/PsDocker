Function Get-PsDockerContainer
{
    Try
    {
        $Result = Invoke-RestMethod -Uri "$($Script:DockerHost)/containers/json" -CertificateThumbprint $Script:CertThumbPrint    
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
