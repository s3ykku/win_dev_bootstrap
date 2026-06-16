@echo off
xcopy "%~dp0settings.json" "%USERPROFILE%\AppData\Roaming\Zed\" /Y
xcopy "%~dp0keymap.json" "%USERPROFILE%\AppData\Roaming\Zed\" /Y