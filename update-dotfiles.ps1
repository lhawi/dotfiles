# Sync .ideavimrc
Copy-Item -Path "$env:USERPROFILE\.ideavimrc" `
          -Destination ".\ideavim\" -Force
