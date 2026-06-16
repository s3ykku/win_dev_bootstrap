@echo off
xcopy "%USERPROFILE%\AppData\Roaming\helix\config.toml" "%~dp0" /Y
xcopy "%USERPROFILE%\AppData\Roaming\helix\languages.toml" "%~dp0" /Y