@echo off
setlocal

pushd "%~dp0" >nul 2>&1
if errorlevel 1 (
  echo Failed to access script directory "%~dp0".
  exit /b 1
)

for /f "delims=" %%F in ('dir /b /a:-d /o-d "*.vsix" 2^>nul') do (
  set "latest=%%F"
  goto :fileFound
)

echo No .vsix files found in "%~dp0".
popd >nul
exit /b 1

:fileFound
if not defined OPEN_VSX_TOKEN (
  echo Environment variable OPEN_VSX_TOKEN is not set.
  popd >nul
  exit /b 1
)

echo Publishing "%latest%" to Open VSX...
ovsx publish "%latest%" -p "%OPEN_VSX_TOKEN%"
set "exitCode=%errorlevel%"

popd >nul
exit /b %exitCode%
