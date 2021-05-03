Write-Output "Downloading filebeat-Zip"
Invoke-WebRequest https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.12.0-windows-x86_64.zip -Outfile filebeat.zip
Write-Output "Unzipping file..."
Expand-Archive filebeat.zip -destinationPath C:\Users\khushboo\Documents
Write-Output "Removing Filebeat..."
remove-item C:\Users\khushboo\Documents\filebeat-7.12.0-windows-x86_64\filebeat.yml
Write-Output "Copying Filebeat..."
Copy-Item 'C:\Users\khushboo\Desktop\filebeatnew\filebeat.yml' 'C:\Users\khushboo\Documents\filebeat-7.12.0-windows-x86_64'
$body = "C:\Users\khushboo\Documents\filebeat-7.12.0-windows-x86_64"
Set-Location "$body"
powershell.exe -ExecutionPolicy UnRestricted -File .\install-service-filebeat.ps1
.\filebeat.exe -e test config
Start-Service filebeat





