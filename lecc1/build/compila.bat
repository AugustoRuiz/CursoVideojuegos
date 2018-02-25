SET RUTACURSO=%~dp0..\..\
REM ESTA RUTA CAMBIA SEGUN LA VERSION DE VISUAL STUDIO.
SET RUTAVS=%VSINSTALLDIR%VC\Tools\MSVC\14.12.25827
SET VSx64BIN=%RUTAVS%\bin\Hostx64\x64\

SET INCLUDES=/I"%RUTACURSO%ext\SFML-2.4.2\include" /I"%RUTAVS%\ATLMFC\include" /I"%RUTAVS%\include" /I"%WindowsSdkDir%include\%WindowsSDKLibVersion%ucrt"
SET LIBPATH=/LIBPATH:"%RUTACURSO%ext\SFML-2.4.2\lib" /LIBPATH:"%RUTAVS%\ATLMFC\lib\x64" /LIBPATH:"%RUTAVS%\lib\x64" /LIBPATH:"%WindowsSdkDir%lib\%WindowsSDKLibVersion%ucrt\x64" /LIBPATH:"%WindowsSdkDir%lib\%WindowsSDKLibVersion%um\x64"
SET LIBS=sfml-network-d.lib sfml-audio-d.lib sfml-graphics-d.lib sfml-window-d.lib sfml-system-d.lib kernel32.lib user32.lib gdi32.lib winspool.lib shell32.lib ole32.lib oleaut32.lib uuid.lib comdlg32.lib advapi32.lib

"%VSx64BIN%cl.exe" /Zi /EHsc /RTC1 /MDd /GS /c "..\src\main.cpp" %INCLUDES%
"%VSx64BIN%link.exe" main.obj /OUT:"..\bin\yt_dvc.exe" %LIBPATH% %LIBS% /MACHINE:X64 /SUBSYSTEM:CONSOLE
copy "%RUTACURSO%ext\lib\SFML\Debug\*" ..\bin\