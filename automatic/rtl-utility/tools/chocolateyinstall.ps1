$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName  
  url            = 'https://oblique-audio.com/downloads/RTL_Utility_1_0_10_Win32.exe'
  checksum       = 'a0e0837ca6b5431b947d3111138c42fafac6262e44fecb92f51101a0a36d2c00'
  checksumType   = 'sha256'
  url64          = 'https://oblique-audio.com/downloads/RTL_Utility_1_0_10_x64.exe'
  checksum64     = 'f844b4c380ab9b8cff1e688865c95dc94da47aed7ab6f1310e8177910b2aac3f'
  checksumType64 = 'sha256'
}

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
$pp = Get-PackageParameters

$installDir = $toolsPath
if ($pp.InstallDir)
{ 
  $installDir = $pp.InstallDir
}
Write-Host "$env:ChocolateyPackageName is going to be installed in '$installDir'"

# Exe name is platform dependant - leave in URL for automatic updater
if ((Get-ProcessorBits -ge 64) -and
    ([String]::IsNullOrWhiteSpace([Environment]::GetEnvironmentVariable("chocolateyForceX86"))))
{
  $exeName = [System.IO.Path]::GetFileName($packageArgs['url64'])
}
else
{
  $exeName = [System.IO.Path]::GetFileName($packageArgs['url'])
}   
# Full file path is only known after exe name
$packageArgs['fileFullPath'] = [System.IO.Path]::Combine($installDir, $exeName)

Get-ChocolateyWebFile @packageArgs
