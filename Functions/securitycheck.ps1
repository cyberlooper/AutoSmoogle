<###############################################################################################################
Smoogle Support - Assisted Setup script

v1.0    04th September 2019:    A script is born                               

Written By Justin Looper - Smoogle Support

All Code provided as is and used at your own risk.
###############################################################################################################>

function adminrights {
    $UserSec = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    $adminrights = $UserSec.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

    if ($adminrights -eq $True) {
        Write-host "You have Admin Rights" -ForegroundColor Green
    }
    else {
        write-host "The account you are using ($env:username) does not have admin rights on this machine.Please stop your operation and log in with an appropriate account" -foregroundcolor Red
        read-host ("Press any key to Exit")
        Exit
    }
}