# === Автоматическая установка ПО через Chocolatey ===
Set-ExecutionPolicy Bypass -Scope Process -Force

# Установка Chocolatey (если ещё не установлен)
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Установка Chocolatey..."
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

# Обновление Chocolatey
choco upgrade chocolatey -y

# Основные пакеты
$packages = @(
    "vscode",
    "git",
    "python",
    "7zip",
    "googlechrome",
    "firefox",
    "docker-desktop",
    "pycharm-community",
    "anaconda3",
    "rust",
    "julia",
    "gimp",
    "sumatrapdf",
    "flameshot",
    "qalculate",
    "msys2",
    "zettlr",
    "miktex",
    "texstudio",
    "far",
    "yandexbrowser",
    "microsoft-edge"
)

Write-Host "Установка пакетов..."
foreach ($pkg in $packages) {
    choco install $pkg -y
}

# === Установка Yandex.Telemost из локального файла ===
$telemostInstaller = Join-Path $PSScriptRoot "TelemostSetup.exe"
if (Test-Path $telemostInstaller) {
    Write-Host "Установка Yandex.Telemost..."
    Start-Process -FilePath $telemostInstaller -ArgumentList "/S" -Wait
} else {
    Write-Host "Файл TelemostSetup.exe не найден!"
}

Write-Host "Установка завершена!"
pause
