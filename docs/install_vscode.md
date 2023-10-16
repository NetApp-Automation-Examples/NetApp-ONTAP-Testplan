## Offical Microsoft package manager: WinGet

`winget install -e --id Microsoft.VisualStudioCode`

[Visual Studio Code installer](https://go.microsoft.com/fwlink/?LinkID=534107)


## Basic PowerShell Example

`Start-Process -FilePath "path/to/vscode/VSCodeUserSetup-x64.exe" -Argument "/VERYSILENT /MERGETASKS=!runcode"`



# Silent with logging
# VSCodeSetup-x64-x.y.z.exe /VERYSILENT /NORESTART /MERGETASKS=!runcode,desktopicon,addcontextmenufiles,addcontextmenufolders,associatewithfiles /LOG="%WINDIR%\Temp\VSCode64-Install.log"

### Extensions - Visual Studio Code Remote - SSH - unique-identifier

ms-vscode-remote.remote-ssh


## PowerShell Gallery - Install-VSCode.ps1

[Install-VSCode 1.4.3](https://www.powershellgallery.com/packages/Install-VSCode/1.4.3)

This script can be used to easily install Visual Studio Code and the
PowerShell extension on your machine.  You may also specify additional
extensions to be installed using the -AdditionalExtensions parameter.
The -LaunchWhenDone parameter will cause VS Code to be launched as
soon as installation has completed.

Example:  
`Install-Script -Name Install-VSCode -AdditionalExtensions ms-vscode-remote.remote-ssh`