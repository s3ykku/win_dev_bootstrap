@echo off
xcopy "%~dp0yazi.toml" "%USERPROFILE%\AppData\Roaming\yazi\config\" /Y
xcopy "%~dp0theme.toml" "%USERPROFILE%\AppData\Roaming\yazi\config\" /Y
xcopy "%~dp0keymap.toml" "%USERPROFILE%\AppData\Roaming\yazi\config\" /Y
xcopy "%~dp0init.lua" "%USERPROFILE%\AppData\Roaming\yazi\config\" /Y
