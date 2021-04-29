Write-Output "Downloading filebeat-Zip"
Invoke-WebRequest https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.12.0-windows-x86_64.zip -Outfile filebeat.zip
Write-Output "Unzipping file..."
Expand-Archive filebeat.zip -destinationPath C:\Users\khushboo\Desktop
$body = "C:\Users\khushboo\Desktop\filebeat-7.12.0-windows-x86_64"
Set-Location "$body"
Write-Output "Execution Policy..."
powershell.exe -ExecutionPolicy UnRestricted -File .\install-service-filebeat.ps1
Write-Output "Testing Configuration..."
.\filebeat.exe -e test config
Write-Output "Executing Filebeat..."
.\filebeat.exe -c filebeat.yml -e 
Write-Output "Filebeat Starting..."
Start-Service filebeat
Write-Output "Running Script in Background..."
powershell -File finalscript.ps1 -WindowStyle Hidden

