$FIREFLOCK_ROOT = "$env:TEMP/fireflock"

$FB50_URL = 'https://github.com/FirebirdSQL/firebird/releases/download/v5.0.1/Firebird-5.0.1.1469-0-windows-x64.zip'
$FB40_URL = 'https://github.com/FirebirdSQL/firebird/releases/download/v4.0.5/Firebird-4.0.5.3140-0-x64.zip'
$FB30_URL = 'https://github.com/FirebirdSQL/firebird/releases/download/v3.0.12/Firebird-3.0.12.33787-0-x64.zip'
$FB25_URL = 'https://github.com/FirebirdSQL/firebird/releases/download/R2_5_9/Firebird-2.5.9.27139-0_x64_embed.zip'
$FB25_EXTRA_URL = 'https://github.com/FirebirdSQL/firebird/releases/download/R2_5_9/Firebird-2.5.9.27139-0_x64.zip'

$FB50_BASENAME = [io.path]::GetFileNameWithoutExtension(([uri]$FB50_URL).Segments[-1])
$FB40_BASENAME = [io.path]::GetFileNameWithoutExtension(([uri]$FB40_URL).Segments[-1])
$FB30_BASENAME = [io.path]::GetFileNameWithoutExtension(([uri]$FB30_URL).Segments[-1])
$FB25_BASENAME = [io.path]::GetFileNameWithoutExtension(([uri]$FB25_URL).Segments[-1])
$FB25_EXTRA_BASENAME = [io.path]::GetFileNameWithoutExtension(([uri]$FB25_EXTRA_URL).Segments[-1])

$FB50_BIN_PATH = "$FIREFLOCK_ROOT/$FB50_BASENAME"
$FB40_BIN_PATH = "$FIREFLOCK_ROOT/$FB40_BASENAME"
$FB30_BIN_PATH = "$FIREFLOCK_ROOT/$FB30_BASENAME"
$FB25_BIN_PATH = "$FIREFLOCK_ROOT/$FB25_BASENAME"
$FB25_EXTRA_BIN_PATH = "$FIREFLOCK_ROOT/$FB25_EXTRA_BASENAME/bin"
