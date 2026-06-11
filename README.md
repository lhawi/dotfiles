# Dotfiles — lhawi

Setup pribadi untuk Windows 10.

## Isi

| Tool | Keterangan |
|------|-----------|
| **Neovim** | Config lengkap dengan lazy.nvim, Catppuccin Mocha |
| **PowerShell** | Oh My Posh dengan tema Catppuccin |
| **Windows Terminal** | Transparansi + Catppuccin color scheme |
| **Oh My Posh** | Tema Catppuccin |
| **IdeaVim** | Config untuk IntelliJ IDEA / Android Studio / WebStorm |
| **VSCode** | Settings & keybindings (VSCodeVim) |
| **Obsidian** | Vim keybindings via obsidian-vimrc plugin |

## Install di laptop baru

```powershell
git clone https://github.com/lhawi/dotfiles.git "$env:USERPROFILE\dotfiles"
cd "$env:USERPROFILE\dotfiles"
.\install.ps1
```

`install.ps1` akan:
- Copy semua config ke lokasi yang benar
- Install tools via Scoop (neovim, git, nodejs, ripgrep, fd, gcc, oh-my-posh, lazygit)
- Install JetBrainsMono Nerd Font

## Update setelah ubah config

```powershell
.\update-dotfiles.ps1
```

Otomatis sync semua config dari lokasi aslinya ke repo ini, lalu push ke GitHub.

## Struktur

```
dotfiles/
├── nvim/               # Neovim config (lazy.nvim)
├── powershell/         # PowerShell profile
├── windows-terminal/   # Windows Terminal settings
├── oh-my-posh/         # Tema Catppuccin
├── ideavim/            # .ideavimrc
├── vscode/             # settings.json & keybindings.json
├── obsidian/           # .obsidian.vimrc
├── install.ps1         # Setup laptop baru
└── update-dotfiles.ps1 # Sync config → repo → GitHub
```
