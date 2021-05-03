Write-Output "Downloading filebeat-Zip"
Invoke-WebRequest https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.12.0-windows-x86_64.zip -Outfile filebeat.zip
Write-Output "Unzipping file..."
Expand-Archive filebeat.zip -destinationPath C:\Users\khushboo\Desktop
Move-Item C:\Users\khushboo\Desktop\filebeat\filebeat-7.12.0-windows-x86_64 "C:\Users\khushboo\Desktop\Filebeat"
remove-item C:\Users\khushboo\Desktop\Filebeat\filebeat.yml
Copy-Item 'C:\Users\khushboo\Desktop\filebeatnew\filebeat.yml' 'C:\Users\khushboo\Desktop\Filebeat'
$body = "C:\Users\khushboo\Desktop\Filebeat"
Set-Location "$body"
powershell.exe -ExecutionPolicy UnRestricted -File .\install-service-filebeat.ps1
.\filebeat.exe -e test config
Start-Service filebeat




