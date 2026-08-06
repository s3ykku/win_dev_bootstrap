@echo off
xcopy "%~dp0starship_kanagawa.toml" "%USERPROFILE%\.config\" /Y
xcopy "%~dp0starship_tokyonight.toml" "%USERPROFILE%\.config\" /Y
xcopy "%~dp0starship_gruvbox_dark.toml" "%USERPROFILE%\.config\" /Y