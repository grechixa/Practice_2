# === �������������� ��������� �� ����� Chocolatey ===
Set-ExecutionPolicy Bypass -Scope Process -Force

# ��������� Chocolatey (���� ��� �� ����������)
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "��������� Chocolatey..."
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

# ���������� Chocolatey
choco upgrade chocolatey -y

# �������� ������
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

Write-Host "��������� �������..."
foreach ($pkg in $packages) {
    choco install $pkg -y
}

# === ��������� Yandex.Telemost �� ���������� ����� ===
$telemostInstaller = Join-Path $PSScriptRoot "TelemostSetup.exe"
if (Test-Path $telemostInstaller) {
    Write-Host "��������� Yandex.Telemost..."
    Start-Process -FilePath $telemostInstaller -ArgumentList "/S" -Wait
} else {
    Write-Host "���� TelemostSetup.exe �� ������!"
}

Write-Host "��������� ���������!"
pause
