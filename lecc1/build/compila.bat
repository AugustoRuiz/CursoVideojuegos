SET WKITPATH=C:\Program Files (x86)\Windows Kits
SET VISUALSTUDIOPATH=C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\VC\Tools\MSVC\14.12.25827
SET COMPILERPATH=%VISUALSTUDIOPATH%\bin\Hostx64\x64
SET INCLUDES=/I"..\..\ext\SFML-2.4.2\include" /I"%VISUALSTUDIOPATH%\ATLMFC\include" /I"%VISUALSTUDIOPATH%\include" /I"%WKITPATH%\10\include\10.0.16299.0\ucrt"
REM /I"%WKITPATH%\NETFXSDK\4.6.1\include\um" /I"%WKITPATH%\10\include\10.0.16299.0\ucrt" /I"%WKITPATH%\10\include\10.0.16299.0\shared" /I"%WKITPATH%\10\include\10.0.16299.0\um"
SET LIBPATH=/LIBPATH:"C:\Data\yt_dvc\ext\SFML-2.4.2\lib" /LIBPATH:"%VISUALSTUDIOPATH%\ATLMFC\lib\x64" /LIBPATH:"%VISUALSTUDIOPATH%\lib\x64" /LIBPATH:"%WKITPATH%\10\lib\10.0.16299.0\ucrt\x64" /LIBPATH:"%WKITPATH%\10\lib\10.0.16299.0\um\x64"
REM /LIBPATH:"%WKITPATH%\10\lib\10.0.16299.0\ucrt\x64" /LIBPATH:"%WKITPATH%\10\lib\10.0.16299.0\um\x64"
SET LIBS=sfml-network-d.lib sfml-audio-d.lib sfml-graphics-d.lib sfml-window-d.lib sfml-system-d.lib kernel32.lib user32.lib gdi32.lib winspool.lib shell32.lib ole32.lib oleaut32.lib uuid.lib comdlg32.lib advapi32.lib

"%COMPILERPATH%\cl.exe" /Zi /EHsc /RTC1 /MDd /GS /c "..\src\main.cpp" %INCLUDES%
"%COMPILERPATH%\link.exe" main.obj /OUT:"..\bin\yt_dvc.exe" %LIBPATH% %LIBS% /MACHINE:X64 /SUBSYSTEM:CONSOLE
copy C:\Data\yt_dvc\ext\lib\SFML\Debug\* ..\bin\