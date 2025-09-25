powershell Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
powershell .\download-dotnet.ps1 '8.0' x64
pause
