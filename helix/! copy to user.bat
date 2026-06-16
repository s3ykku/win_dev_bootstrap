@echo off
xcopy "%~dp0config.toml" "%USERPROFILE%\AppData\Roaming\helix\" /Y
xcopy "%~dp0languages.toml" "%USERPROFILE%\AppData\Roaming\helix\" /Y