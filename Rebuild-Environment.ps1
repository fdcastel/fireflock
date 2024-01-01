[CmdletBinding(SupportsShouldProcess=$true)]
Param()

$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

. ./Settings.ps1

if (Test-Path $FIREFLOCK_ROOT) {
    Write-Verbose "Removing $FIREFLOCK_ROOT"
    Remove-Item $FIREFLOCK_ROOT -Force -Recurse
}
mkdir $FIREFLOCK_ROOT | Out-Null

Write-Verbose "Downloading $FB50_BASENAME"
Invoke-WebRequest $FB50_URL -OutFile $FIREFLOCK_ROOT/$FB50_BASENAME.zip -Verbose:$false

Write-Verbose "Downloading $FB40_BASENAME"
Invoke-WebRequest $FB40_URL -OutFile $FIREFLOCK_ROOT/$FB40_BASENAME.zip -Verbose:$false

Write-Verbose "Downloading $FB30_BASENAME"
Invoke-WebRequest $FB30_URL -OutFile $FIREFLOCK_ROOT/$FB30_BASENAME.zip -Verbose:$false

Write-Verbose "Downloading $FB25_BASENAME"
Invoke-WebRequest $FB25_URL -OutFile $FIREFLOCK_ROOT/$FB25_BASENAME.zip -Verbose:$false

Write-Verbose "Downloading $FB25_EXTRA_BASENAME"
Invoke-WebRequest $FB25_EXTRA_URL -OutFile $FIREFLOCK_ROOT/$FB25_EXTRA_BASENAME.zip -Verbose:$false

Get-ChildItem $FIREFLOCK_ROOT/*.zip -File | ForEach-Object {
    $baseName = $_.BaseName
    Write-Verbose "Extracting $baseName"
    Expand-Archive -Path $_ -DestinationPath $FIREFLOCK_ROOT/$baseName
}
Remove-Item $FIREFLOCK_ROOT/*.zip 

Write-Verbose "Patching $FB50_BASENAME/firebird.conf"
(Get-Content "$FB50_BIN_PATH/firebird.conf" -Raw).Replace('#IpcName = FIREBIRD', 'IpcName = FIREBIRD50') | Set-Content "$FB50_BIN_PATH/firebird.conf" -Encoding Ascii

Write-Verbose "Patching $FB40_BASENAME/firebird.conf"
(Get-Content "$FB40_BIN_PATH/firebird.conf" -Raw).Replace('#IpcName = FIREBIRD', 'IpcName = FIREBIRD40') | Set-Content "$FB40_BIN_PATH/firebird.conf" -Encoding Ascii

Write-Verbose "Patching $FB30_BASENAME/firebird.conf"
(Get-Content "$FB30_BIN_PATH/firebird.conf" -Raw).Replace('#IpcName = FIREBIRD', 'IpcName = FIREBIRD30') | Set-Content "$FB30_BIN_PATH/firebird.conf" -Encoding Ascii

Write-Verbose "Patching $FB25_BASENAME/firebird.conf"
(Get-Content "$FB25_BIN_PATH/firebird.conf" -Raw).Replace('#IpcName = FIREBIRD', 'IpcName = FIREBIRD25') | Set-Content "$FB25_BIN_PATH/firebird.conf" -Encoding Ascii

Write-Verbose "Renaming $FB25_BASENAME/fbembed.dll"
Move-Item $FB25_BIN_PATH/fbembed.dll $FB25_BIN_PATH/fbclient.dll

Write-Verbose "Copying $FB25_EXTRA_BASENAME/bin/isql.exe"
Copy-Item $FB25_EXTRA_BIN_PATH/isql.exe $FB25_BIN_PATH