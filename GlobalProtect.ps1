# Instalar o arquivo MSI com os parâmetros desejados
$msiInstall = Start-Process -FilePath "msiexec.exe" -ArgumentList "/i", "C:\temp\GlobalProtect64.msi", "PORTAL=myportal.gpcloudservice.com", "DEFAULTBROWSER=yes", "CONNECTMETHOD=user-logon", "/quiet", "/norestart" -PassThru -Wait

# Verificar se a instalação foi bem-sucedida
if ($msiInstall.ExitCode -eq 0) {
    Write-Host "Instalação concluída com sucesso!."

    # Registrar o provedor PLAP após a instalação
    Start-Process -FilePath "C:\Program Files\Palo Alto Networks\GlobalProtect\PanGPS.exe" -ArgumentList "-registerplap" -Wait

} else {
    Write-Host "A instalação falhou. Código de erro: $($msiInstall.ExitCode)"
}
