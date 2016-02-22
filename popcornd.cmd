@echo off
setlocal

set "async=true"
set "freq=120"

goto :parsePackage

:: functions

:help

:: TODO: put something here.

goto :eof

:usage

call :help 1>&2
exit /b 1

goto :eof

:: end functions

:parsePackage

if "%~1" == "" goto usage
set "package=%~1"
shift

:parseArgs

if "%~1" == "" goto doneParsing

if /i "%~1" == "-?" goto help
if /i "%~1" == "-h" goto help
if /i "%~1" == "--help" goto help

if /i "%~1" == "-f" (
    shift
    set "freq=%~1"
)

if /i "%~1" == "--freq" (
    shift
    set "freq=%~1"
)

if /i "%~1" == "--forward" (
    shift
    set "forwardArgs=%~1"
)

if /i "%~1" == "--stop-after" (
    shift
    set "duration=%~1"
)

if /i "%~1" == "--sync" set "async=false"

shift
goto parseArgs

:doneParsing
