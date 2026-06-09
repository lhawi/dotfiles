# update-dotfiles.ps1
# Jalankan setiap kali ada perubahan config

cd "$env:USERPROFILE\dotfiles"

Write-Host "Syncing dotfiles..." -ForegroundColor Cyan

# Neovim
Write-Host "Neovim..." -ForegroundColor Yellow
Copy-Item -Path "$env:LOCALAPPDATA\nvim\*" `
          -Destination ".\nvim\" -Recurse -Force
Write-Host "✓ Neovim" -ForegroundColor Green

# PowerShell profile
Write-Host "PowerShell..." -ForegroundColor Yellow
Copy-Item -Path "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" `
          -Destination ".\powershell\" -Force
Write-Host "✓ PowerShell" -ForegroundColor Green

# Windows Terminal
Write-Host "Windows Terminal..." -ForegroundColor Yellow
$wtPath = Get-ChildItem "$env:LOCALAPPDATA\Packages" |
          Where-Object { $_.Name -like "Microsoft.WindowsTerminal*" } |
          Select-Object -First 1
if ($wtPath) {
    Copy-Item -Path "$($wtPath.FullName)\LocalState\settings.json" `
              -Destination ".\windows-terminal\" -Force
    Write-Host "✓ Windows Terminal" -ForegroundColor Green
}

# Oh My Posh theme
Write-Host "Oh My Posh..." -ForegroundColor Yellow
Copy-Item -Path "$env:LOCALAPPDATA\Programs\oh-my-posh\themes\catppuccin.omp.json" `
          -Destination ".\oh-my-posh\" -Force
Write-Host "✓ Oh My Posh" -ForegroundColor Green

# IdeaVim
Write-Host "IdeaVim..." -ForegroundColor Yellow
Copy-Item -Path "$env:USERPROFILE\.ideavimrc" `
          -Destination ".\ideavim\" -Force
Write-Host "✓ IdeaVim" -ForegroundColor Green

# VSCode
Write-Host "VSCode..." -ForegroundColor Yellow
Copy-Item -Path "$env:APPDATA\Code\User\settings.json" `
          -Destination ".\vscode\" -Force
Copy-Item -Path "$env:APPDATA\Code\User\keybindings.json" `
          -Destination ".\vscode\" -Force
Write-Host "✓ VSCode" -ForegroundColor Green

# Push ke GitHub
Write-Host ""
Write-Host "Pushing to GitHub..." -ForegroundColor Cyan
git add .
git commit -m "update: $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
git push

Write-Host ""
Write-Host "✓ Semua selesai & tersimpan di GitHub!" -ForegroundColor Green
