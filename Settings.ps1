        $Env:USER1_AUTH_TOKEN = [Environment]::GetEnvironmentVariable('USER1_AUTH_TOKEN', 'Machine')
        $Env:USER2_AUTH_TOKEN = [Environment]::GetEnvironmentVariable('USER2_AUTH_TOKEN', 'Machine')
        
if( $Env:USER1_AUTH_TOKEN -eq $env:UserName) {

        new-item $env:USERPROFILE\Documents\OpenRPA -itemtype directory
        Invoke-WebRequest -Uri "https://raw.githubusercontent.com/T36k0/RDP/master/FILES/s1" -OutFile "$env:USERPROFILE\Documents\OpenRPA\settings.json"
        while (!(Test-Path "C:\Program Files\OpenRPA\OpenRPA.exe")) { Start-Sleep 5 }
        Set-CurrentUser -Save -Username $Env:USER1_AUTH_TOKEN -Password $Env:USER1_AUTH_TOKEN -WSURL ws://robot.shebeng.co
        Start-Process "OpenRPA.exe"
        Start-Process "chrome.exe"
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Terminal Server Client" /v "AuthenticationLevelOverride" /t "REG_DWORD" /d 0 /f
        
        Start-Sleep 40
        
        $Server="127.0.0.2"
        $User="$env:computername\runneradmin2"
        $Password="1"
        cmdkey /generic:TERMSRV/$Server /user:$User /pass:$Password
        mstsc /v:$Server /w:1200 /h:800
        
}

        
if( $Env:USER2_AUTH_TOKEN -eq $env:UserName) {

        new-item $env:USERPROFILE\Documents\OpenRPA -itemtype directory
        Invoke-WebRequest -Uri "https://raw.githubusercontent.com/T36k0/RDP/master/FILES/s2" -OutFile "$env:USERPROFILE\Documents\OpenRPA\settings.json"
        while (!(Test-Path "C:\Program Files\OpenRPA\OpenRPA.exe")) { Start-Sleep 5 }
        Set-CurrentUser -Save -Username $Env:USER2_AUTH_TOKEN -Password $Env:USER2_AUTH_TOKEN -WSURL ws://robot.shebeng.co
        Start-Process "OpenRPA.exe"
        Start-Process "chrome.exe"
        
}
        
