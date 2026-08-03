@echo off
xcopy "%USERPROFILE%\AppData\Roaming\alacritty\alacritty.toml" "%~dp0" /Y
xcopy "%USERPROFILE%\AppData\Roaming\alacritty\tokyo-night-storm.toml" "%~dp0" /Y
xcopy "%USERPROFILE%\AppData\Roaming\alacritty\kanagawa_wave.toml" "%~dp0" /Y
