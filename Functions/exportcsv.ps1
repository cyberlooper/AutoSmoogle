<###############################################################################################################
Smoogle Support - Assisted Setup script
Function: ExportCSV

Exporting channel data for 

v1.0    04th September 2019:    A script is born                               

Written By -Z3US- - Smoogle Support

All Code provided as is and used at your own risk.
###############################################################################################################>

function exportcsv {
    write-host -Prompt "`n`tThe configuration will export to the scripts location"
    $name = read-host -Prompt "`n`tPlease give your file a name"

    $exportloc = "$global:location\exports"
    $global:csvout > "$exportloc\$name"
}