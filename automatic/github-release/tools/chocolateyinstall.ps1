$ErrorActionPreference = 'Stop';

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
$pp = Get-PackageParameters

$installDir = $toolsPath
if ($pp.InstallDir)
{ 
  $installDir = $pp.InstallDir
}
Write-Host "$env:ChocolateyPackageName is going to be installed in '$installDir'"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName  
  unzipLocation  = $installDir
  url            = 'https://github.com/[todo]/releases/download/[todo]'
  checksum       = '[todo]'
  checksumType   = 'sha256'
  url64          = 'https://github.com/[todo]/releases/download/[todo]'
  checksum64     = '[todo]'
  checksumType64 = 'sha256'  
}

Install-ChocolateyZipPackage @packageArgs
