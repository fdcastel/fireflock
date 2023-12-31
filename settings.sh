# /bin/bash

FIREFLOCK_ROOT="/tmp/fireflock"

FB50_URL="https://github.com/FirebirdSQL/firebird/releases/download/v5.0.0-RC2/Firebird-5.0.0.1304-RC2-linux-x64.tar.gz"
FB40_URL="https://github.com/FirebirdSQL/firebird/releases/download/v4.0.4/Firebird-4.0.4.3010-0.amd64.tar.gz"
FB30_URL="https://github.com/FirebirdSQL/firebird/releases/download/v3.0.11/Firebird-3.0.11.33703-0.amd64.tar.gz"
FB25_URL="https://github.com/FirebirdSQL/firebird/releases/download/R2_5_9/FirebirdCS-2.5.9.27139-0.amd64.tar.gz"

FILENAME="${FB50_URL##*/}" ; FB50_BASENAME="${FILENAME::-7}"
FILENAME="${FB40_URL##*/}" ; FB40_BASENAME="${FILENAME::-7}"
FILENAME="${FB30_URL##*/}" ; FB30_BASENAME="${FILENAME::-7}"
FILENAME="${FB25_URL##*/}" ; FB25_BASENAME="${FILENAME::-7}"

FB50_BIN_PATH="$FIREFLOCK_ROOT/$FB50_BASENAME/opt/firebird/bin"
FB40_BIN_PATH="$FIREFLOCK_ROOT/$FB40_BASENAME/opt/firebird/bin"
FB30_BIN_PATH="$FIREFLOCK_ROOT/$FB30_BASENAME/opt/firebird/bin"
FB25_BIN_PATH="$FIREFLOCK_ROOT/$FB25_BASENAME/opt/firebird/bin"
