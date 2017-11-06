PARAM ($ScriptPath) 
#************************************************ 
# StartScriptAsProcess.ps1 
# Version 1.0 
# Date: 2/07/2014 
# Author: Tim Springston [MSFT] 
# Description: This script will take the parameter of a PowerShell script, 
#  prompt the user for a username and password and then run that script 
#  in a new process context as that user. 
#************************************************ 
$TestScriptPath = Test-Path $ScriptPath 
if ($TestScriptPath -eq $false) 
    { 
    do  { 
        Write-Host "There's a problem with the script file path to start. Please reenter the script path." -ForegroundColor Yellow 
        $ScriptPath = Read-Host  
        } 
        while ($TestScriptPath -eq $false) 
    } 
 
#Separate the script name from path and place into a var 
$ScriptPathArray = $ScriptPath.Split('\') 
$PathArrayCount = $ScriptPathArray.count 
$ScriptName = $ScriptPathArray[$ScriptPathArrayCount - 1] 
$Trailer = '\' + $ScriptName 
$ScriptDir = $ScriptPath.Replace($Trailer,'') 
$ScriptName = '.\' + $ScriptName 
 
#Collect credentials and parse them for domain 
$Credential = Get-Credential -Message "PowerShell Script Run As Credentials" 
$RawUserName = $Credential.UserName 
if ($RawUserName -match "@") 
    {$Domain = $RawUserName.Split('@')[1]; $User = $RawUserName.Split('@')[0]} 
if ($RawUserName -match "\\") 
    {$Domain = $RawUserName.Split('\')[0]; $User = $RawUserName.Split('\')[1]} 
     
$StartArguments = "-command " + $ScriptName 
$StartArguments = $StartArguments.ToString() 
$StartFile = "Powershell.exe" 
 
$RunScriptProcess = New-Object System.Diagnostics.Process 
$RunScriptProcess.StartInfo.FileName = "PowerShell.exe" 
$RunScriptProcess.StartInfo.UseShellExecute = $false 
$RunScriptProcess.StartInfo.Arguments = $StartArguments 
$RunScriptProcess.StartInfo.Username = $UserName 
$RunScriptProcess.StartInfo.Password = $Credential.Password 
$RunScriptProcess.StartInfo.Domain = $Domain 
$RunScriptProcess.StartInfo.WorkingDirectory = $ScriptDir 
$RunScriptProcess.StartInfo.Verb = "RunAsUser" 
 
if ($RunScriptProcess.Start()){$RunScriptProcess.WaitForExit(); "Script $Scriptname has finished."} 
