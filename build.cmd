@echo off

REM
REM ELMAH - Error Logging Modules and Handlers for ASP.NET
REM Copyright (c) 2004-9 Atif Aziz. All rights reserved.
REM
REM  Author(s):
REM
REM      Atif Aziz, http://www.raboof.com
REM
REM Licensed under the Apache License, Version 2.0 (the "License");
REM you may not use this file except in compliance with the License.
REM You may obtain a copy of the License at
REM
REM    http://www.apache.org/licenses/LICENSE-2.0
REM
REM Unless required by applicable law or agreed to in writing, software
REM distributed under the License is distributed on an "AS IS" BASIS,
REM WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
REM See the License for the specific language governing permissions and
REM limitations under the License.
REM
REM -------------------------------------------------------------------------
REM
REM To compile for Microsoft .NET Framework 2.0, 3.0 and 3.5, you only
REM need MSBUILD.EXE and which is expected to be located in the standard
REM installation directory.

setlocal
pushd "%~dp0"
set MSBUILD35EXE=%SystemRoot%\Microsoft.NET\Framework\v3.5\MSBuild.exe
if not exist "%MSBUILD35EXE%" (
    echo The .NET Framework 3.5 does not appear to be installed on this 
    echo machine, which is required to build the solution.
    exit /b 1
)
for %%i in (debug release) do if exist "%MSBUILD35EXE%" "%MSBUILD35EXE%" Elmah.sln /p:Configuration=%%i
popd
