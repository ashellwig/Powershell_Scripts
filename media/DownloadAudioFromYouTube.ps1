#requires -version 5

<#
.Synopsis
   TODO
.DESCRIPTION
   TODO
.EXAMPLE
    TODO: Example of how to use this cmdlet
.OUTPUTS
   Audio extracted from YouTube video located at specified source.
.NOTES
    .AUTHOR Ashton Hellwig <ahellwig.dev@gmail.com>
    .VERSION 0.0.1
    .COPYRIGHT 2020 Ashton Scott Hellwig <ahellwig.dev@gmail.com>
    .PROJECTURI https://github.com/ashellwig/Powershell_Scripts.git
    .LICENSEURI https://github.com/ashellwig/Powershell_Scripts/LICENSE
#>

function SingleVideo
{
    [CmdletBinding(DefaultParameterSetName='Parameter Set Main', 
                  SupportsShouldProcess=$true, 
                  PositionalBinding=$false,
                  HelpUri = 'https://readthedocs.org/projects/powershell-scripts/',
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
