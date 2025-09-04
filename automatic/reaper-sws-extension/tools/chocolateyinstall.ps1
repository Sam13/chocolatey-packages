$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'reaper-sws-extension*'
  fileType       = 'EXE'
  url            = 'https://www.sws-extension.org/download/featured/sws-2.14.0.6-Windows-x86.exe'
  checksum       = '058e5d49760c80af7f4658bc42376fb3b56a58c1eb797523b50a28fec6347aab'
  checksumType   = 'sha256'
  url64          = 'https://www.sws-extension.org/download/featured/sws-2.14.0.6-Windows-x64.exe'
  checksum64     = '0780c3aee8df821b1ceba28464056e34e8b31eea80de36c0634c06e425ee7aca'
  checksumType64 = 'sha256'
  silentArgs     = "/S"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
