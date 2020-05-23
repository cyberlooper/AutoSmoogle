<###############################################################################################################
Smoogle Support - Assisted Setup script

v1.0    04th September 2019:    A script is born                               

Written By Justin Looper - Smoogle Support

All Code provided as is and used at your own risk.
###############################################################################################################>

#Requires -version 7.0.1
##Requires -RunAsAdministrator

# Inclusions
$ScriptDirectory = Get-Location
$ScriptDirectory = "$ScriptDirectory\Functions"
$functions = Get-ChildItem "$ScriptDirectory"
foreach ($function in $functions) {
   . $function
}
. (Join-Path $ScriptDirectory\Functions\*.ps1)