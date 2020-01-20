<#
.Synopsis
    Highlights string in text output using regular expressions.
.DESCRIPTION
    Highlights string in text output using regular expressions.
.EXAMPLE
    Find-String [string]:SearchThisString
.NOTES
    .AUTHOR Ashton Hellwig <ahellwig.dev@gmail.com>
    .VERSION 0.0.1
    .PROJECTURI https://github.com/ashellwig/Powershell_Scripts.git
    .LICENSEURI https://github.com/ashellwig/Powershell_Scripts/LICENSE
.NOTES
    All I did was clean up Wes's script (See README.md#Acknowledgements) and
    do a bit of formatting.
#>

# Find-String.ps1
#  Wrapper around dir | select-string which will highlight the pattern in the results
param	( [string] $pattern = ""
    , [string] $filter = "*.*"
    , [switch] $recurse = $false
    , [switch] $caseSensitive = $false)

if ($pattern -eq $null -or $pattern -eq "") { Write-Error "Please provide a search pattern!" ; return }

$regexPattern = $pattern
if ($caseSensitive -eq $false) { $regexPattern = "(?i)$regexPattern" }
$regex = New-Object System.Text.RegularExpressions.Regex $regexPattern

# Write the line with the pattern highlighted in red
function Write-HostAndHighlightPattern([string]$inputText) {
    $index = 0
    while ($index -lt $inputText.Length) {
        $match = $regex.Match($inputText, $index)
        if ($match.Success -and $match.Length -gt 0) {
            Write-Host $inputText.SubString($index, $match.Index - $index) -nonewline
            Write-Host $match.Value.ToString() -ForegroundColor Red -nonewline
            $index = $match.Index + $match.Length
        } else {
            Write-Host $inputText.SubString($index) -nonewline
            $index = $inputText.Length
        }
    }
}

# Do the actual find in the files
Get-ChildItem -recurse:$recurse -filter:$filter | 
Select-String -caseSensitive:$caseSensitive -pattern:$pattern |	
ForEach-Object {
    Write-Host "$($_.FileName)($($_.LineNumber)): " -nonewline
    Write-HostAndHighlightPattern $_.Line
    Write-Host
}