<###############################################################################################################
Smoogle Support - Assisted Setup script

v1.0    04th September 2019:    A script is born                               

Written By -Z3US- - Smoogle Support

All Code provided as is and used at your own risk.
###############################################################################################################>
function createcsv {
    $count = read-host -Prompt "How many channels in the circuit?"
    $counted = 0
    $global:csvout = "channel,lang`n"
    while (!($count -eq $counted)) {
        $counted++
        $channame = read-host -Prompt "`[$counted`] Please enter the channel name and language separated by a comma (channel-en,en)"
        $global:csvout += "$channame`n"
    } break
}