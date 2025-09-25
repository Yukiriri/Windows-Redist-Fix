@echo off & pushd %~dp0

echo VC++...
for %%i in (vc\*.exe) do (
    echo %%i
    "%%i" /passive /norestart
)
echo VC++ OK

echo .NET...
for %%i in (dotnet\*.exe) do (
    echo %%i
    "%%i" /passive /norestart
)
echo .NET OK

echo DX...
set dx9_installer_name=directx_Jun2010_redist
echo dx\%dx9_installer_name%.exe
dx\%dx9_installer_name%.exe /Q /T:%TEMP%\%dx9_installer_name%
%TEMP%\%dx9_installer_name%\DXSETUP.exe /silent
echo DX OK

pause
