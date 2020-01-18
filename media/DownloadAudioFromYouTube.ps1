<#
.Synopsis
   Downloads the audio from a specified YouTube url.
.DESCRIPTION
   Downloads the audio from a specified YouTube url using `youtube-dl`
   (https://github.com/ytdl-org/youtube-dl). Output is configurable as is
   the output's format -- assuming it is available.
.EXAMPLE
    TODO: Example of how to use this cmdlet
.OUTPUTS
   Audio extracted from YouTube video located at specified source.
.NOTES
.VERSION 1.0.1
.GUID 54688e75-298c-4d4b-a2d0-1234567890ab
.AUTHOR iRon
.DESCRIPTION Your description
.COMPANYNAME
.COPYRIGHT
.TAGS PowerShell Version
.LICENSEURI https://github.com/LICENSE
.PROJECTURI https://github.com/
.ICONURI https://Icon.png
.EXTERNALMODULEDEPENDENCIES
.REQUIREDSCRIPTS
.EXTERNALSCRIPTDEPENDENCIES
.RELEASENOTES
.Version
.PRIVATEDATA
#>

<#PSScriptInfo

#>

function SingleVideo
{
    [CmdletBinding(DefaultParameterSetName='Parameter Set 1', 
                  SupportsShouldProcess=$true, 
                  PositionalBinding=$false,
                  HelpUri = 'http://www.microsoft.com/',
                  ConfirmImpact='Medium')]
    [Alias()]
    [OutputType([String])]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$true, 
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true, 
                   ValueFromRemainingArguments=$false, 
                   Position=0,
                   ParameterSetName='Parameter Set 1')]
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [ValidateCount(0,5)]
        [ValidateSet("sun", "moon", "earth")]
        [Alias("p1")] 
        $Param1,

        # Param2 help description
        [Parameter(ParameterSetName='Parameter Set 1')]
        [AllowNull()]
        [AllowEmptyCollection()]
        [AllowEmptyString()]
        [ValidateScript({$true})]
        [ValidateRange(0,5)]
        [int]
        $Param2,

        # Param3 help description
        [Parameter(ParameterSetName='Another Parameter Set')]
        [ValidatePattern("[a-z]*")]
        [ValidateLength(0,15)]
        [String]
        $Param3
    )

    Begin
    {
    }
    Process
    {
        if ($pscmdlet.ShouldProcess("Target", "Operation"))
        {
        }
    }
    End
    {
    }
}
