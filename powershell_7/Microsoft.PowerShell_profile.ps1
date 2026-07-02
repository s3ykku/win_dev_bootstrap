$env:STARSHIP_CONFIG = "$HOME\.config\starship_kanagawa.toml"

Invoke-Expression (&starship init powershell)
$PSStyle.FileInfo.Directory = "`e[36;1m"

Set-Location $HOME

Set-Alias ll Get-ChildItem
Set-Alias c clear
function v { nvim @args }

function y {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp -Encoding UTF8 -ErrorAction SilentlyContinue
    if (-not [string]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath $cwd
    }
    Remove-Item -Path $tmp -ErrorAction SilentlyContinue
}

function setoldgo {
    $env:GOTOOLCHAIN = "go1.20"
    Write-Host "GOTOOLCHAIN установлен на go1.20"
}

function setdefgo {
    $env:GOTOOLCHAIN = "auto"
    Write-Host "GOTOOLCHAIN установлен на auto"
}

function clac {
    Clear-History

    $historyPath = (Get-PSReadLineOption).HistorySavePath

    # Чтобы текущая сессия не записала историю обратно при выходе
    Set-PSReadLineOption -HistorySaveStyle SaveNothing

    if (Test-Path $historyPath) {
        Remove-Item $historyPath -Force
    }

    [Microsoft.PowerShell.PSConsoleReadLine]::ClearScreen()

    Write-Host "Command history cleared. Restarting PowerShell..."
    Start-Sleep -Seconds 1

    & (Get-Process -Id $PID).Path -NoLogo

    exit
}
