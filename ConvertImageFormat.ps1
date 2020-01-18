#requires -version 6
<#
.SYNOPSIS
  Randomizes Filenames in Specified Folder
.DESCRIPTION
  Convert the format of $image1 to the format specifed as $format
.PARAMETER <Parameter_Name>
    
.INPUTS
  <Inputs if any, otherwise state None>
.OUTPUTS
  <Outputs if any, otherwise state None - example: Log file stored in C:\Windows\Temp\<name>.log>
.NOTES
  Version:        1.0
  Author:         <Name>
  Creation Date:  <Date>
  Purpose/Change: Initial script development
  
.EXAMPLE
  <Example goes here. Repeat this attribute for more than one example>
#>

#---------------------------------------------------------[Initialisations]--------------------------------------------------------

#Set Error Action to Silently Continue
$ErrorActionPreference = "SilentlyContinue"

#Dot Source required Function Libraries
# None

#----------------------------------------------------------[Declarations]----------------------------------------------------------

#Script Version
$sScriptVersion = "0.1"

#Log File Info
$sLogPath = "C:\Windows\Temp"
$sLogName = "ConvertImageFormat.log"
$sLogFile = Join-Path -Path $sLogPath -ChildPath $sLogName

#-----------------------------------------------------------[Functions]------------------------------------------------------------

Function ConvertImageFormat {
  Param(
      [string] $dir = $(throw "Please specify a Directory for the input"),
      [string] $informat = $(throw "Please specify the input file extension (without the '.')"),
      [string] $outformat = $(throw "Please specify output extension (without the '.')")
  )
  
  Begin{
    for ($i = 0 -lt $files.Count; i++) {
        $converter = "C:\Program Files\ImageMagick-7.0.9-Q16\magick.exe"
        $files = Get-ChildItem $dir -Filter "*.$informat"
        $outfile[$i] = [string]::Format("$($files[$i] | Select-Object BaseName).{0}", $outformat)
        $cmdline =  $converter + " `"" + $files[$i].FullName  + "`""  + $outfile[$i] + "`" "
        Log-Write -LogPath $sLogFile -LineValue "Converting $filename[$i] from $informat to $($outputfile[$i] | Select-Object Extension)"
        Invoke-Expression -Command $cmdline
        i++
    }
  }
  
  Process{
    Try{
        ConvertImageFormat -dir $dir -informat $informat -outformat $outformat
    }
    
    Catch{
      Log-Error -LogPath $sLogFile -ErrorDesc $_.Exception -ExitGracefully $True
      Break
    }
  }
  
  End{
    If($?){
      Log-Write -LogPath $sLogFile -LineValue "Completed Successfully."
      Log-Write -LogPath $sLogFile -LineValue " "
    }
  }
}
#>

#-----------------------------------------------------------[Execution]------------------------------------------------------------

Log-Start -LogPath $sLogPath -LogName $sLogName -ScriptVersion $sScriptVersion
ConvertImageFormat
Log-Finish -LogPath $sLogFile