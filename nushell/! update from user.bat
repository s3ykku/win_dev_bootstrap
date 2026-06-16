@echo off
xcopy "%USERPROFILE%\AppData\Roaming\nushell\config.nu" "%~dp0" /Y
xcopy "%USERPROFILE%\AppData\Roaming\nushell\env.nu" "%~dp0" /Y