@echo off
xcopy "%USERPROFILE%\.config\starship_kanagawa.toml" "%~dp0" /Y
xcopy "%USERPROFILE%\.config\starship_tokyonight_blue.toml" "%~dp0" /Y
xcopy "%USERPROFILE%\.config\starship_tokyonight_storm.toml" "%~dp0" /Y
xcopy "%USERPROFILE%\.config\starship_gruvbox_dark.toml" "%~dp0" /Y