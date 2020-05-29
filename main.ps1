$host.UI.RawUI.BufferSize = New-Object System.Management.Automation.Host.Size(160, 5000)
<###############################################################################################################
Smoogle Support - Assisted Setup script

v1.0    04th September 2019:    A script is born                               

Written By -Z3US- - Smoogle Support

All Code provided as is and used at your own risk.
###############################################################################################################>

##Requires -version 5.1
##Requires -RunAsAdministrator

# Inclusions
$ScriptDirectory = Get-Location
$ScriptDirectory = "$ScriptDirectory\Functions"
$functions = Get-ChildItem "$ScriptDirectory"
foreach ($function in $functions) {
	. (Join-Path $ScriptDirectory "$function")
}

## Global Variables
$global:location = Get-Location
$global:csvout
$global:CSVCreated = ""
$Global:channelsformatted = ""
$global:dataloc = ""
## Start ##

Write-Host "`n`t Welcome to AutoSmoogle, A tool for Translation Circuits." -ForegroundColor Magenta
Write-Host "`n`n`t This script will guide you through prepping for a translation circuit,"
Write-Host "`t and provide you with the commands to run to achieve your goal."
Write-Host "`n`t Please read the screen prompts carefully. You will be provided"
Write-Host "`t the opportunity to skip sections if you prefer."
Read-Host -Prompt "Press any key to continue"
Clear-Host

$ans = Read-Host -Prompt "`nHave you setup a circuit before? (this will skip channel formatting) [Y/N]"
if ($ans -eq "Y") {
	$Global:channelsformatted = $true
	$ans = Read-Host -Prompt "`nWould you like to provide your own CSV ? [Y/N]"
	if ($ans -eq "Y") {
		$global:dataloc = Read-Host -Prompt "Please enter the full location"
	}
	else {
		createcsv
		if ((Read-Host -Prompt "`nDo you want to export this circuit to file? [Y/N]") -eq "Y") { exportcsv }
		$
	}
}
else {
	#Continue
}

if (!($true -eq $Global:channelsformatted)) {
	# Information on Channel Formatting
}

if (!($true -eq $global:CSVCreated)) {
	createcsv
}