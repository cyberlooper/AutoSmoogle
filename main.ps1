$host.UI.RawUI.BufferSize = New-Object System.Management.Automation.Host.Size(160, 5000)
<###############################################################################################################
Smoogle Support - Assisted Setup script

v1.0    04th September 2019:    A script is born                               

Written By -Z3US- - Smoogle Support

All Code provided as is and used at your own risk.
###############################################################################################################>

#Requires -version 5.1
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
$global:name = ""
$global:csvout = ""
$global:CSVProvided = ""
$global:CSVCreated = ""
$Global:channelsformatted = ""
$global:dataloc = ""
$global:finisheddata = ""
$global:autoalldone = ""
$global:linkdone = ""
## Start ##

Write-Host "`n`t Welcome to AutoSmoogle, A tool for Translation Circuits." -ForegroundColor Magenta
Write-Host "`n`n`t This script will guide you through prepping for a translation circuit,"
Write-Host "`t and provide you with the commands to run to achieve your goal."
Write-Host "`n`t Please read the screen prompts carefully. You will be provided" -ForegroundColor Yellow
Write-Host "`t the opportunity to skip sections if you prefer." -ForegroundColor Yellow
Read-Host -Prompt "`n`t Press any key to continue" 
Clear-Host

$ans = Read-Host -Prompt "`n`tHave you setup a circuit before? (this will skip channel formatting) [Y/N]"
if ($ans -eq "Y") {
	$Global:channelsformatted = $true
	$ans = Read-Host -Prompt "`n`tWould you like to provide your own CSV ? [Y/N]"
	if ($ans -eq "Y") {
		$global:dataloc = Read-Host -Prompt "`n`tPlease enter the full location"
		$csvout = import-csv $dataloc
		$global:CSVProvided = $true
	}
	else {
		createcsv
		if ((Read-Host -Prompt "`n`tDo you want to export this circuit to file? [Y/N]") -eq "Y") {
			exportcsv
			$csvout = import-csv "$exportloc\$name.csv"
		}
		$global:CSVCreated = $true
		#$global:csvout > "c:\temp.csv"
		#Export-Csv -path "c:\temp.csv" -InputObject $global:csvout -NoClobber
		Out-File -FilePath "c:\temp.csv" -InputObject $csvout
		$csvout = import-csv "c:\temp.csv"
		Remove-Item -Force "c:\temp.csv"
	}
}


if (!($true -eq $Global:channelsformatted)) {
	# Information on Channel Formatting

	Clear-Host
	write-host "`n`t Formatting Channels
	 -------------------" -ForegroundColor Green

	write-host "`n`t Formatting channels correctly makes setting up translatonal"
	write-host "`t ciruits incredibly easy."
	write-host "`n`t The recommended setup is to append the channel name with"
	write-host "`t the source language (E.G leader-en). This way the system"
	write-host "`t is able accurately setup the circuit. The general gist is"
	write-host "`t take a channel, translate it to your desired langauages"
	write-host "`t and then forward to a dedicated language channel."
	write-host "`n`t So lets format shall we..."
	Write-host "`t Create a catagory, and create a channel for each required"
	write-host "`t language. REMEMBER (#name-language)"
	read-host "`n`t Press any Key to when ready"

	write-host "`n`t Ok next we need to tell this system what channels you have."
}

if (($true -eq $CSVCreated) -or ($true -eq $CSVProvided)) {
	#continue
}
Else { 
	createcsv 
}

if (($Global:channelsformatted -eq $true) -and (($global:CSVCreated -eq $true) -or ($global:CSVProvided -eq $true))) {
	if (!($true -eq $global:autoalldone)) {
		autoall
	}
	if (!($true -eq $global:linkdone)) {
		link
	}
}

#exporting file
$savedata = $location
#$global:finisheddata > "$savedata\CompleteCircuit.txt" -noclobber
Out-File -FilePath $savedata\CompleteCircuit.txt -InputObject $global:finisheddata -Force

if (test-path $savedata\CompleteCircuit.txt) {
	Clear-Host
	write-host "`n`t Congradulations. If you check $savedata, you will find your completed file." -ForegroundColor Green
	write-host "`n`tNow comes the hard part. You have to copy and paste each command, into discord." -ForegroundColor Yellow
	Write-host "`n`tGood Luck, and visit us on the support server if you run into any isues." -ForegroundColor Green
}