$env:Path += ";$env:LOCALAPPDATA\Programs\oh-my-posh\bin"
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\catppuccin.omp.json" | Invoke-Expression