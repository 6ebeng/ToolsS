        $Env:USER1_AUTH_TOKEN = [Environment]::GetEnvironmentVariable('USER1_AUTH_TOKEN', 'Machine')
        $Env:USER2_AUTH_TOKEN = [Environment]::GetEnvironmentVariable('USER2_AUTH_TOKEN', 'Machine')
        
if( $Env:USER1_AUTH_TOKEN -eq $env:UserName) {

        new-item $env:USERPROFILE\Documents\OpenRPA -itemtype directory
        while (!(Test-Path "C:\Program Files\OpenRPA\OpenRPA.exe")) { Start-Sleep 5 }
        Set-CurrentUser -Save -Username $Env:USER1_AUTH_TOKEN -Password $Env:USER1_AUTH_TOKEN -WSURL wss://robot.shebeng.co
        Start-Process "OpenRPA.exe"     
        
}

        
if( $Env:USER2_AUTH_TOKEN -eq $env:UserName) {

        new-item $env:USERPROFILE\Documents\OpenRPA -itemtype directory
        while (!(Test-Path "C:\Program Files\OpenRPA\OpenRPA.exe")) { Start-Sleep 5 }
        Set-CurrentUser -Save -Username $Env:USER2_AUTH_TOKEN -Password $Env:USER2_AUTH_TOKEN -WSURL wss://robot.shebeng.co
        Start-Process "OpenRPA.exe"
        
}
        
