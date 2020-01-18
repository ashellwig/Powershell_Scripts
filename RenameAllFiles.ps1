#requires -version 6
<#
.SYNOPSIS
  Randomizes Filenames in Specified Folder
.DESCRIPTION
  Renames all files in $dir by applying a unique, random GUID as the filename.

.Parameter dir
  Directory containing files to be renamed.
    
.INPUTS
  Directory of Files
.OUTPUTS
  Files renamed in-place using a random guid.
.NOTES
  Version:        1.0
  Author:         Ashton Hellwig <ahellwig.dev@gmail.com>
  Creation Date:  2019-11-24
  Purpose/Change: Initial script development
  
.EXAMPLE
  RenameAllFiles -dir C:\Users\Documents\sensitive-info
#>

#---------------------------------------------------------[Initialisations]--------------------------------------------------------

#Set Error Action to Silently Continue
$ErrorActionPreference = "SilentlyContinue"

#Dot Source required Function Libraries
# None

#----------------------------------------------------------[Declarations]----------------------------------------------------------

#Script Version

#Log File Info
# CHANGED IN PSCORE6

#-----------------------------------------------------------[Functions]------------------------------------------------------------
function FunctionName {
  param (
    [string] $dir
  )

  if (!(Test-Path -Path $dir)) {
    Write-Error -Message "Directory does not exist. Try again." -RecommendedAction "Check your spelling."
  } else {
    Set-Location -Path $dir
    
  }
  
}

#>

#-----------------------------------------------------------[Execution]------------------------------------------------------------

RenameAllFiles -dir $dir
