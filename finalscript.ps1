Write-Output "Downloading filebeat-Zip"
Invoke-WebRequest https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.12.0-windows-x86_64.zip -Outfile filebeat.zip
Write-Output "Unzipping file..."
Expand-Archive filebeat.zip -destinationPath C:\Users\khushboo\Downloads
$body = "C:\Users\khushboo\Downloads\filebeat-7.12.0-windows-x86_64"
Set-Location "$body"
Write-Output "Service Executing..."
powershell.exe -ExecutionPolicy UnRestricted -File .\install-service-filebeat.ps1
Write-Output "Filebeat Configuration..."
.\filebeat.exe -e test config
Write-Output "Filebeat Execution..."
.\filebeat.exe -c filebeat.yml -e 
Write-Output "Filebeat Starting..."
Start-Service filebeat
Write-Output "Powershell Running in Background..."
powershell -File finalscript.ps1 -WindowStyle Hidden


