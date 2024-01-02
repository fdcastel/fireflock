[CmdletBinding(SupportsShouldProcess=$true)]
Param(
    [Parameter(ValueFromPipeline=$true)]
    [System.String]
    $Target=$Null,

    [System.String]
    $Prefix='test',
    
    [ValidateSet(4096, 8192, 16384, 32768)] 
    [System.Int32]
    $PageSize = 8192,

    [System.String]
    $Charset = 'UTF8'
)

$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

. ./Settings.ps1

$dbFolder = $FIREFLOCK_ROOT
if ($Target) {
    $dbFolder = $Target
}
mkdir -Force $dbFolder | Out-Null

# Build databases
$Engines = 'fb50', 'fb40', 'fb30', 'fb25'
$Engines | ForEach-Object {
    $engine = $_

    $engineFolder = (Get-Variable "$($engine)_BIN_PATH").Value
    $isql = Join-Path $engineFolder 'isql.exe'

    $database = Join-Path $dbFolder "$Prefix.$engine.fdb"
    Remove-Item $database -Force -ErrorAction SilentlyContinue

    Write-Verbose "Creating '$database' (PageSize=$PageSize, Charset='$Charset')"
    @"
    CREATE DATABASE '$database'
        USER 'SYSDBA' PASSWORD 'masterkey'
        PAGE_SIZE $PageSize DEFAULT CHARACTER SET $Charset;
"@ | & $isql -quiet | Out-Null
}
