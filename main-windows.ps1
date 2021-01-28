$host.UI.RawUI.BufferSize = New-Object System.Management.Automation.Host.Size(160, 5000)
<###############################################################################################################
Smoogle Support - Assisted Setup script

v1.0    04th September 2019:    A script is born                               

Written By -Z3US- - Smoogle Support

All Code provided as is and used at your own risk.
###############################################################################################################>

#Requires -version 5.1

# # Inclusions
# $ScriptDirectory = Get-Location
# $functions = Get-ChildItem "$ScriptDirectory\Functions"
# foreach ($function in $functions) {
# 	. (Join-Path "$ScriptDirectory\Functions" "$function")
# }

## script Variables
$script:location = Get-Location
$script:name = ""
$script:csvout = ""
$script:CSVProvided = ""
$script:CSVCreated = ""
$script:channelsformatted = ""
$script:dataloc = ""
$script:finisheddata = ""
$script:autoalldone = ""
$script:linkdone = ""
$script:exportloc = ""
$script:exportpath = ""

## Functions ##

function link {
    $channels = $csvout.channel
    $langs = $csvout.lang
    $dests = $csvout.channel

    $global:finisheddata += "`n`#`# Links `#`#`n"
    foreach ($lang in $langs) {
        foreach ($chan in $channels) {
            foreach ($dest in $dests) {
                if ($dest -contains $chan) {
                    write-host "Avoiding Source to Destination conflict"
                }
                else {
                    if ($dest.EndsWith("$lang")) {
                        $global:finisheddata += "tr?link `#$chan `#$dest $lang`n"
                    }
                    else {
                        write-host "Avoiding incorrect destination link"
                    }
                }
            }
        }
    }
    $script:linkdone = $true
}

function autoall {
    $channels = $csvout.channel
    $langs = $csvout.lang

    $global:finisheddata += "`#`# Autoall translations `#`#`n"
    foreach ($chan in $channels) {
        foreach ($lang in $langs) {
            if ($chan.EndsWith($lang)) {
                write-host "Avoided source to destination conflict"
            }
            else {
                Write-host "$chan translation to $lang"
                $global:finisheddata += "tr?autoall $lang `#$chan`n"
            }
        }
    }
    $script:autoalldone = $true
}

function exportcsv {
    write-host "`n`tThe configuration will export to $location"
    $name = read-host "`n`tPlease give your file a name"

    $exportloc = "$location\exports"
    if (!(test-path $exportloc)) {
        New-Item -Path $exportloc -Force -ItemType directory
    }
    $script:exportpath = "$exportloc\$name.csv"
    $csvout > "$exportpath"
}


function createcsv {
    $count = read-host "`n`tHow many channels in the circuit?"
    $counted = 0
    $csvout = "channel,lang`n"
    while (!($count -eq $counted)) {
        $counted++
        $channame = read-host "`n`t`[$counted`] Please enter the channel name and language separated by a comma (channel-en,en)"
        $csvout += "$channame`n"
    }
    $CSVCreated = $true
    Exportcsv
}

function import ($exportpath) {
    if (!($exportpath -eq $null)) {
        $script:csvout = import-csv $exportpath
        $script:CSVCreated = $true
    } else {
        $dataloc = Read-Host "`n`tPlease enter the full location"
	    $csvout = import-csv $dataloc
	    $CSVProvided = $true
    }
}
function formatting {
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

    $script:channelsformatted = $true
	write-host "`n`t Ok next we need to tell this system what channels you have."
}

function formatted {
    if ($exportpath) {
        import $exportpath
    } else {
        $provide = Read-Host "`n`tWould you like to provide your own CSV ? [Y/N]"
        switch ($provide) {
            Y {import}
            N {createcsv}
            default {createcsv}
        }
        $channelsformatted = $true
    }
}

function preqcheck {
    if ($channelsformatted -eq $true) {
        if (($CSVCreated -eq $true) -or ($CSVProvided -eq $true)) {
            if (!($true -eq $autoalldone)) {
                autoall
            }
            if (!($true -eq $linkdone)) {
                link
            }
        }
    }
}


function fincheck {
    if (!($true -eq $autoalldone)) {
        write-host "Something went wrong. Autoall did not run, seek support"
        read-host "Press any Key to continue"
        Exit
    } elseif (!($true -eq $linkdone)) {
        write-host "Something went wrong. Link did not run, seek support"
        read-host "Press any Key to continue"
        Exit
    } else {
        #All checks out
    }
}
function main {
$ans = read-host "`n`tHave you setup a circuit before? (this will skip channel formatting) [Y/N]"
    if ($ans -eq "Y") {
        #Circuits attempted before
        formatted # Proceed to Data import/create
        preqcheck # Checking all prerequisits are met
        fincheck # Checking all functions ran as intended

    } else {
        formatting # Walking though correctly formatting channels
        createcsv # Creating logical CSV layout for channels
        formatted
        preqcheck # Checking all prerequisits are met
        fincheck # Checking all functions ran as intended
    }
    
    Out-File -FilePath $location\CompleteCircuit.txt -InputObject $finisheddata
    if (test-path $location\CompleteCircuit.txt) {
        Clear-Host
        write-host "`n`t Congradulations. If you check $location, you will find your completed file." -ForegroundColor Green
        write-host "`n`tNow comes the hard part. You have to copy and paste each command, into discord." -ForegroundColor Yellow
        Write-host "`n`tGood Luck, and visit us on the support server if you run into any isues." -ForegroundColor Green
        read-host "Press any key to finish."
    }
}

## Main Script ##

if (Test-Path .\CompleteCircuit.txt) {
    remove-item .\CompleteCircuit.txt -Force
}

Write-Host "`n`n`t This script will guide you through prepping for a translation circuit,"
Write-Host "`t and provide you with the commands to run to achieve your goal."
Write-Host "`n`t Please read the screen prompts carefully. You will be provided" -ForegroundColor Yellow
Write-Host "`t the opportunity to skip sections if you prefer." -ForegroundColor Yellow
Read-Host "`n`t Press any key to continue" 
Clear-Host

main