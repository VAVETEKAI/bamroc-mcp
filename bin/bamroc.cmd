@echo off
rem Starts the BAMROC MCP server that the BAMROC AI Connector setup installed on this PC
rem (from vavetek.ai or the Autodesk App Store). The server talks to Claude over stdin/stdout.
setlocal
set "BAMROC_PY=%APPDATA%\Autodesk\ApplicationPlugins\BAMROC.bundle\Contents\server\python.exe"
if not exist "%BAMROC_PY%" set "BAMROC_PY=%ProgramData%\Autodesk\ApplicationPlugins\BAMROC.bundle\Contents\server\python.exe"
if not exist "%BAMROC_PY%" (
  echo BAMROC is not installed on this PC. Install the BAMROC AI Connector from https://vavetek.ai/bamroc-mcp-server-documentation/ and restart Claude. 1>&2
  exit /b 1
)
"%BAMROC_PY%" -I -m bamroc_mcp
