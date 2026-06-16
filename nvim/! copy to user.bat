@echo off
xcopy "%~dp0lua" "%USERPROFILE%\AppData\Local\nvim\lua" /E /I /Y
xcopy "%~dp0init.lua" "%USERPROFILE%\AppData\Local\nvim\" /Y