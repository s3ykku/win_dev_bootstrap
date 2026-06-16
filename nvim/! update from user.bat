@echo off
xcopy "%USERPROFILE%\AppData\Local\nvim\lua" "%~dp0lua\" /E /I /Y
xcopy "%USERPROFILE%\AppData\Local\nvim\init.lua" "%~dp0" /Y