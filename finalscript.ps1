Write-Output "Downloading filebeat-Zip"
Invoke-WebRequest https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.12.0-windows-x86_64.zip -Outfile filebeat.zip
Write-Output "Unzipping file..."
Expand-Archive filebeat.zip -destinationPath C:\Users\khushboo\Pictures
Write-Output "Removing Filebeat..."
remove-item C:\Users\khushboo\Pictures\filebeat-7.12.0-windows-x86_64\filebeat.yml
Write-Output "Copying Filebeat..."
Copy-Item 'C:\Users\khushboo\Desktop\filebeatnew\filebeat.yml' 'C:\Users\khushboo\Pictures\filebeat-7.12.0-windows-x86_64'
$body = "C:\Users\khushboo\Pictures\filebeat-7.12.0-windows-x86_64"
Set-Location "$body"
Write-Output "Executing Filebeat..."
powershell.exe -ExecutionPolicy UnRestricted -File .\install-service-filebeat.ps1
Write-Output "Test Configuration..."
.\filebeat.exe -e test config
Write-Output "Start Service..."
Start-Service filebeat
./filebeat.exe -c filebeat.yml -e





