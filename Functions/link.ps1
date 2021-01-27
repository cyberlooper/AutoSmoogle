<###############################################################################################################
Smoogle Support - Assisted Setup script

v1.0    04th September 2019:    A script is born                               

Written By Justin Looper - Smoogle Support

All Code provided as is and used at your own risk.
###############################################################################################################>

function link {
    $channels = $csvout.channel
    $langs = $csvout.lang
    $dests = $csvout.channel

    $global:finisheddata += "`#`# Links `#`#`n"
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
    $global:linkdone = $true
}