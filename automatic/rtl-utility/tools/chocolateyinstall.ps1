$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName  
  url            = 'https://oblique-audio.com/downloads/RTL_Utility_1_0_9_Win32.exe'
  checksum       = 'aff387baadfd2615fe297befb7007ac526089047330102a26e66d46ba42eca77'
  checksumType   = 'sha256'
  url64          = 'https://oblique-audio.com/downloads/RTL_Utility_1_0_9_x64.exe'
  checksum64     = 'c6e724a1f57d99174bc55a92f3a2318bc3cb552f8b9dca5464ec6f4459af2ee3'
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
