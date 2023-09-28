# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

$env:XDG_CONFIG_HOME = "$HOME/.config"

Import-Module posh-git
$omp_config = Join-Path $PSScriptRoot "pedro.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

# Terminal-Icons
Import-Module -Name Terminal-Icons

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"

# sfsu
Invoke-Expression (&sfsu hook)

# Alias
Set-Alias -Name vim -Value nvim
Set-Alias ll ls
Set-Alias g git
function gsw { git switch $args }
function gco { git checkout $args }
function gs { git status }
function ga { git add $args }
function gaa { git add . }
function gpl { git pull }
function gplf { git pull --force }
function gplff { git pull --force-with-lease }
function gpsh { git push }
function gpshf { git push --force }
function gpshff { git push --force-with-lease }
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
