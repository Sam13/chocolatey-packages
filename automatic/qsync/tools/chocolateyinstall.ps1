$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'qsync*'
  fileType       = 'EXE'
  url            = 'https://download.qnap.com/Storage/Utility/QNAPQsyncClientWindows-6.0.0.2522.exe'  
  checksum       = '3de6472fcffc9965da20702be288d7996c644240730f594b2afc33873feba58d'
  checksumType   = 'sha256'
  silentArgs     = "/S"
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
