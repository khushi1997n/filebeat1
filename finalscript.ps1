Write-Output "Downloading filebeat-Zip"
Invoke-WebRequest https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.12.0-windows-x86_64.zip -Outfile filebeat.zip
Write-Output "Unzipping file..."
Expand-Archive filebeat.zip -destinationPath C:\Users\khushboo\Desktop\pipeline
$body = "C:\Users\khushboo\Desktop\filebeat-7.12.0-windows-x86_64"
Set-Location "$body"
powershell.exe -ExecutionPolicy UnRestricted -File .\install-service-filebeat.ps1
.\filebeat.exe -e test config
.\filebeat.exe -c filebeat.yml -e 
Start-Service filebeat
Stop-Service filebeat

