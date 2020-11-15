# This script installs and enable all the necessary items for installing and using java script I am Rishabh Singh presenting you my creation.Thank you for using it(Smily Emoji).
#     > powershell -nop -c " iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/Paneerdev/javainstall/main/tp.ps1'))"

$tweaks = @(
	"RequireAdmin",
    "CreateRestorePoint"
    "InstallRishabhProgs"
    "InstallNotepadplusplus"
    "InstallJDK"
    "InstallJRE"
    
    Function InstallRishabhProgs {
        Write-Output "Installing Chocolatey"
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
        choco install chocolatey-core.extension -y /quiet
    }
    
    Function RequireAdmin {
        If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
            Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`" $PSCommandArgs" -WorkingDirectory $pwd -Verb RunAs
            Exit
        }
    }
    
)

Function InstallNotepadplusplus {
	choco install $ChocoInstall notepadplusplus -y
}

Function InstallJRE {
	choco install $ChocoInstall jre8 -y
}


Function InstallJDK {
	choco install $ChocoInstall jdk8 -y
}


Function CreateRestorePoint {
    Write-Output "Creating Restore Point incase something bad happens"
    Enable-ComputerRestore -Drive "C:\"
    Checkpoint-Computer -Description "RestorePoint1" -RestorePointType "MODIFY_SETTINGS"
  }

# Call the desired tweak functions
$tweaks | ForEach { Invoke-Expression $_ }
