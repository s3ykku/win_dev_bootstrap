@echo off
xcopy "%~dp0config.nu" "%USERPROFILE%\AppData\Roaming\nushell\" /Y
xcopy "%~dp0env.nu" "%USERPROFILE%\AppData\Roaming\nushell\" /Y