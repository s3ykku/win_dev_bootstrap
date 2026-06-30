@echo off
xcopy "%USERPROFILE%\AppData\Roaming\yazi\config\yazi.toml" "%~dp0" /Y
xcopy "%USERPROFILE%\AppData\Roaming\yazi\config\theme.toml" "%~dp0" /Y
xcopy "%USERPROFILE%\AppData\Roaming\yazi\config\keymap.toml" "%~dp0" /Y
xcopy "%USERPROFILE%\AppData\Roaming\yazi\config\init.lua" "%~dp0" /Y
