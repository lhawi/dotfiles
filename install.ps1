@'
# install.ps1 — jalankan di laptop baru untuk restore semua config
Write-Host "Installing dotfiles..." -ForegroundColor Cyan

# Neovim
Write-Host "Neovim..." -ForegroundColor Yellow
$nvimDest = "$env:LOCALAPPDATA\nvim"
if (Test-Path $nvimDest) { Rename-Item $nvimDest "$nvimDest.bak" }
Copy-Item -Path "$PSScriptRoot\nvim" -Destination $nvimDest -Recurse -Force
Write-Host "✓ Neovim" -ForegroundColor Green

# PowerShell
Write-Host "PowerShell..." -ForegroundColor Yellow
$psDest = "$env:USERPROFILE\Documents\PowerShell"
if (!(Test-Path $psDest)) { New-Item -Path $psDest -ItemType Directory -Force }
Copy-Item -Path "$PSScriptRoot\powershell\Microsoft.PowerShell_profile.ps1" `
          -Destination $psDest -Force
Write-Host "✓ PowerShell" -ForegroundColor Green

# Windows Terminal
Write-Host "Windows Terminal..." -ForegroundColor Yellow
$wtPath = Get-ChildItem "$env:LOCALAPPDATA\Packages" |
          Where-Object { $_.Name -like "Microsoft.WindowsTerminal*" } |
          Select-Object -First 1
if ($wtPath) {
    Copy-Item -Path "$PSScriptRoot\windows-terminal\settings.json" `
              -Destination "$($wtPath.FullName)\LocalState\" -Force
    Write-Host "✓ Windows Terminal" -ForegroundColor Green
}

# Install tools via Scoop
Write-Host "Installing tools via Scoop..." -ForegroundColor Yellow
if (!(Get-Command scoop -ErrorAction SilentlyContinue)) {
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
    irm get.scoop.sh | iex
}
$tools = @("neovim","git","nodejs","ripgrep","fd","gcc","oh-my-posh","lazygit")
foreach ($tool in $tools) { scoop install $tool }

# Install Nerd Font
scoop bucket add nerd-fonts
scoop install JetBrainsMono-NF

# Oh My Posh theme
Write-Host "Oh My Posh theme..." -ForegroundColor Yellow
$opmDest = "$env:LOCALAPPDATA\Programs\oh-my-posh\themes"
if (!(Test-Path $opmDest)) { New-Item -Path $opmDest -ItemType Directory -Force }
Copy-Item -Path "$PSScriptRoot\oh-my-posh\catppuccin.omp.json" `
          -Destination $opmDest -Force
Write-Host "✓ Oh My Posh" -ForegroundColor Green

# IdeaVim
Write-Host "IdeaVim..." -ForegroundColor Yellow
Copy-Item -Path "$PSScriptRoot\ideavim\.ideavimrc" `
          -Destination "$env:USERPROFILE\" -Force
Write-Host "✓ IdeaVim" -ForegroundColor Green

Write-Host ""
Write-Host "✓ Semua selesai!" -ForegroundColor Cyan
Write-Host "Buka nvim → plugin lazy.nvim otomatis terinstall"
'@ | Out-File install.ps1 -Encoding utf8
