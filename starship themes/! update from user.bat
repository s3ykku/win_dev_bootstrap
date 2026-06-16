@echo off
xcopy "%USERPROFILE%\.config\starship_kanagawa.toml" "%~dp0" /Y
xcopy "%USERPROFILE%\.config\starship_tokyonight.toml" "%~dp0" /Y