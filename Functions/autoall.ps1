<###############################################################################################################
Smoogle Support - Assisted Setup script

v1.0    04th September 2019:    A script is born                               

Written By Justin Looper - Smoogle Support

All Code provided as is and used at your own risk.
###############################################################################################################>

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
    $global:autoalldone = $true
}