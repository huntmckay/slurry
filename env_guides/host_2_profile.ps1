# You need to do this to get nvim in your dir
# iwr https://github.com/neovim/neovim/releases/latest/download/nvim-win64.zip -OutFile nvim-win64.zip

# TEMPORARILY BYPASS POLICY
Set-ExecutionPolicy -Scope Process Bypass -Force

# Make the Terminal not suck 
# https://gist.github.com/tuxfight3r/60051ac67c5f0445efee
Set-PsReadLineOption -Editmode Emacs

# LINK ROAMING PROFILE (PowerShell and SSH)
<# This is not an actual roaming profile but its the only thing that doesnt get wiped.
This is the darksouls bonfire of this entire connection guide. #>

$USER = 'hunter.s.mckay'
$ROME = "\\ucfgllccfs01\DEMRedirect\$USER\" # you may have a totally different path name
$GIT = "$ROME\MinGit-2.49.0-64-bit\minw64\bin\git.exe"
$GIT = "$ROME\nvim-win64.zip\nvim\nvim.exe"

# Relink PowerShell profile
$targetProfile = "$HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
if (Test-Path $ROME\profile.ps1) {
    Copy-Item -Path $targetProfile -Target "$roamingRoot\profile.ps1" -Force
    Write-Host "Linked PowerShell profile." -ForegroundColor Green
}

Write-Host "[$env:COMPUTERNAME] ($env:USERNAME)" -ForegroundColor Cyan

Write-Host "Custom Functions"
function jump-cvte { ssh -F $ROME\config cvte }
function jump-cctc { ssh -F $ROME\config cctc }
function go-rome { cd $ROME }

set-alias "e" -Value "C:\Users\hunter.s.mckay\nvim-win64\nvim-win64\nvim.exe" -Scope Global
set-alias "s" -Value "get-childitem" -Scope Global
set-alias "unzip" -Value "Expand-Archive" -Scope Global
set-alias "edit-ssh" -Value "e $HOME\.ssh\config" -Scope Global
set-alias "git" -Value "$ROME\$GIT\git.exe" -Scope Global
