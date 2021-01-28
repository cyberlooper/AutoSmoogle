if ($IsWindows) {
    .\main-windows.ps1
} elseif ($Islinux) {
    ./main-windows.ps1
} elseif ($IsMacOs) {
    ./main-mac.ps1
}