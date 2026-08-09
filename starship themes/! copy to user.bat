@echo off
xcopy "%~dp0starship_kanagawa.toml" "%USERPROFILE%\.config\" /Y
xcopy "%~dp0starship_tokyonight_blue.toml" "%USERPROFILE%\.config\" /Y
xcopy "%~dp0starship_tokyonight_storm.toml" "%USERPROFILE%\.config\" /Y
xcopy "%~dp0starship_gruvbox_dark.toml" "%USERPROFILE%\.config\" /Y