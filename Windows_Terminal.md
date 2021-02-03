### My custom style for Windows Terminal

Install oh-my-posh
```powershell
Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser
```

copy [theme](https://github.com/nowakowsky/cheatsheets/blob/main/Windows_Terminal_Theme.psm1) to C:\Program Files\WindowsPowerShell\Modules\oh-my-posh\2.0.496\Themes

code $PROFILE

```powershell
Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Windows_Terminal_Theme
```

