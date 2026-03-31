$ErrorActionPreference = 'Stop';

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
$pp = Get-PackageParameters

$installDir = $toolsPath
if ($pp.InstallDir)
{ 
  $installDir = $pp.InstallDir
}
Write-Host "$env:ChocolateyPackageName is going to be installed in '$installDir'"

# Create temporary directory to extract .tar.gz -> .tar
$tempDir = [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), [System.Guid]::NewGuid())
New-Item -ItemType Directory -Path $tempDir

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName  
  unzipLocation  = $tempDir
  url            = 'https://github.com/lindell/multi-gitter/releases/download/v0.62.0/multi-gitter_0.62.0_Windows_i386.tar.gz'
  checksum       = '17967b4a20b46acfbea5172c8111d0b9120a76b84a35f9917b34c777bb3e7a6a'
  checksumType   = 'sha256'
  url64          = 'https://github.com/lindell/multi-gitter/releases/download/v0.62.0/multi-gitter_0.62.0_Windows_x86_64.tar.gz'
  checksum64     = 'c621e1ac4c1922a40e8da7951b300ff036e9a88b2da6a83673546db6da942d25'
  checksumType64 = 'sha256'  
}

# Extract .tar.gz into temporary directory
Install-ChocolateyZipPackage @packageArgs
# Extract .tar into installation directory
$File = Get-ChildItem -File -Path $tempDir -Filter *.tar
Get-ChocolateyUnzip -fileFullPath $File.FullName -destination $installDir
# Remove temporary directory
Remove-Item $tempDir -Recurse
