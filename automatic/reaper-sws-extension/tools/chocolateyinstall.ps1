$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'reaper-sws-extension*'
  fileType       = 'EXE'
  url            = 'https://www.sws-extension.org/download/featured/sws-2.14.0.7-Windows-x86.exe'
  checksum       = '26d68c268c7f4063cfcb968669dad50a01968db155d385bd38a69f841d385e0b'
  checksumType   = 'sha256'
  url64          = 'https://www.sws-extension.org/download/featured/sws-2.14.0.7-Windows-x64.exe'
  checksum64     = '02d04e663f9f07e0bf9626d29d29b086b37e8f21ef53b380c47f9e1f118162f9'
  checksumType64 = 'sha256'
  silentArgs     = "/S"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
