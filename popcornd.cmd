@echo off
setlocal

set "async=true"
set "flagfile=%TEMP%\popcorn\flagfile-%RANDOM%"
set "freq=120"

goto :parsePackage

:: functions

:help

type "%~dp0help\popcornd.txt"

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

:: Rerun the script using start /b if --sync isn't passed
if "%async%" == "true" (
    start /b "%~f0" --sync %*
    exit /b %ERRORLEVEL%
)

if "%duration%" != "" (
    :: Create a file in %duration% minutes that will signal we have to stop
    start cmd /c "timeout %duration% && type nul > %flagfile%"
)

:loop

if not exist "%flagfile%" (
    :: Do the actual work
    popcorn "%package%" %forwardArgs%
    
    :: Sleep and continue the loop
    timeout %freq% > nul
    goto loop
)
