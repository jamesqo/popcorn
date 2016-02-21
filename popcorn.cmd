@echo off
setlocal

set "output=nul"
set "times=1"

:help

goto :eof

:parseArgs

if "%~1" == "" goto main

if /i "%~1" == "-?" goto help
if /i "%~1" == "-h" goto help
if /i "%~1" == "--help" goto help

if /i "%~1" == "-t" (
    set "times=%~2"
    shift
)

if /i "%~1" == "--times" (
    set "times=%~2"
    shift
)

if /i "%~1" == "-o" (
    set "output=%~2"
    shift
)

if /i "%~1" == "--output" (
    set "output=%~2"
    shift
)

shift
goto parseArgs

:curl

@powershell -NoProfile "iwr %~1 -OutFile %~2" 2> nul

goto :eof

:downloadPackage

set "url=https://www.nuget.org/api/v2/package/%~1"
call :curl "%url%" %2

goto :eof

:main

for /l %%i in (1, 1, %times%) do (
    call :downloadPackage "%package%" "%output%"
)
