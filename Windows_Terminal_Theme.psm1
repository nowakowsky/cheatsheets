#this is just customized AVIT theme, inspired by LAMBDA theme

#requires -Version 2 -Modules posh-git

function Write-Theme {

    param(
        [bool]
        $lastCommandFailed,
        [string]
        $with
    )
    $prompt = Write-Prompt -Object $sl.PromptSymbols.StartSymbol -ForegroundColor $sl.Colors.Red

    $dir = Get-FullPath -dir $pwd

    $prompt += Write-Prompt -Object $dir -ForegroundColor $sl.Colors.Pwd

   $status = Get-VCSStatus
    if ($status) {
        $themeInfo = Get-VcsInfo -status ($status)
        $prompt += Write-Prompt -Object " git:" -ForegroundColor $sl.Colors.Red
        $prompt += Write-Prompt -Object "$($themeInfo.VcInfo) " -ForegroundColor $themeInfo.BackgroundColor
    }

    #check for elevated prompt
    If (Test-Administrator) {
        $prompt += Write-Prompt -Object " $($sl.PromptSymbols.ElevatedSymbol)" -ForegroundColor $sl.Colors.AdminIconForegroundColor
    }

    #check the last command state and indicate if failed
    If ($lastCommandFailed) {
        $prompt += Write-Prompt -Object " $($sl.PromptSymbols.FailedCommandSymbol)" -ForegroundColor $sl.Colors.CommandFailedIconForegroundColor
    }

    $prompt += Set-Newline

    if (Test-VirtualEnv) {
        $prompt += Write-Prompt -Object "[venv $(Get-VirtualEnvName)] " -ForegroundColor $sl.Colors.VirtualEnvForegroundColor
    }

    if ($with) {
        $prompt += Write-Prompt -Object "$($with.ToUpper()) " -BackgroundColor $sl.Colors.WithBackgroundColor -ForegroundColor $sl.Colors.WithForegroundColor
    }

    $prompt += Write-Prompt -Object $sl.PromptSymbols.PromptIndicator -ForegroundColor $sl.Colors.Pwd
    $prompt += ' '
    $prompt
}

function Get-TimeSinceLastCommit {
    return (git log --pretty=format:'%cr' -1)
}

$sl = $global:ThemeSettings #local settings
$sl.PromptSymbols.StartSymbol = 'pwd: '
$sl.PromptSymbols.PromptIndicator = [char]::ConvertFromUtf32(0x000003BB)
$sl.Colors.Red = [ConsoleColor]::Red
$sl.Colors.WithForegroundColor = [ConsoleColor]::DarkRed
$sl.Colors.WithBackgroundColor = [ConsoleColor]::Magenta
$sl.Colors.Pwd = [ConsoleColor]::White
$sl.Colors.VirtualEnvForegroundColor = [System.ConsoleColor]::Red
$sl.PromptSymbols.ElevatedSymbol = "ADMIN! "
