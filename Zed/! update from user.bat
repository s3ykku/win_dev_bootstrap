@echo off
xcopy "%USERPROFILE%\AppData\Roaming\Zed\settings.json" "%~dp0" /Y
xcopy "%USERPROFILE%\AppData\Roaming\Zed\keymap.json" "%~dp0" /Y