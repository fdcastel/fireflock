# fireflock

Scripts to build Firebird embedded environments.


# Overview

These scripts download, set up, and create databases for each version of the Firebird database server using the embedded engine.

Ideal for test automation scenarios. Since each environment is self-contained, you can avoid conflicts with any pre-existing Firebird installation.

For Linux (bash) and Windows (Powershell).


# Scripts

## Rebuild-Environment

```bash
./rebuild-environment.sh
```

```powershell
./Rebuild-Environment.ps1
```

Downloads all required binaries into a temporary folder (`/tmp/fireflock` on Linux or `$env:TEMP/fireflock` on Windows).

There are no parameters. But you may change the `FIREFLOCK_ROOT` variable in `settings.sh` / `Settings.ps1` if you wish to use another location for binaries.

This script completely obliterates the contents of the `FIREFLOCK_ROOT` folder and rebuilds it again.


## Rebuild-Databases

```bash
./rebuild-databases.sh [-t|--target <target-folder>] [-p|--prefix <prefix>] [--pagesize <n>] [--charset <c>]
```

```powershell
./Rebuild-Databases.ps1 [[-Target] <string>] [[-Prefix] <string>] [[-PageSize] <int>] [[-Charset] <string>] [<CommonParameters>]
```

Builds one (empty) database for each Firebird version.

Using parameters, you may set:

- the target folder (`--target`, default `$FIREFLOCK_ROOT`)
- a prefix for each database name (`--prefix`, default `test`)
- the database page size (`--pagesize`, default `8192`)
- the database default charset (`--charset`, default `UTF8`)

If a database with the same name already exists in the target folder, it will be deleted and rebuilt again.
