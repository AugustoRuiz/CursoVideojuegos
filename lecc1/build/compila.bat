SET VISUALSTUDIOPATH=%VSINSTALLDIR%VC\Tools\MSVC\14.12.25827
SET VSx64BIN=%VISUALSTUDIOPATH%\bin\Hostx64\x64\

SET INCLUDES=/I"%USERPROFILE%\Documents\CursoVideojuegos\ext\SFML-2.4.2\include" /I"%VISUALSTUDIOPATH%\ATLMFC\include" /I"%VISUALSTUDIOPATH%\include" /I"%WindowsSdkDir%include\%WindowsSDKLibVersion%ucrt"
SET LIBPATH=/LIBPATH:"%USERPROFILE%\Documents\CursoVideojuegos\ext\SFML-2.4.2\lib" /LIBPATH:"%VISUALSTUDIOPATH%\ATLMFC\lib\x64" /LIBPATH:"%VISUALSTUDIOPATH%\lib\x64" /LIBPATH:"%WindowsSdkDir%lib\%WindowsSDKLibVersion%ucrt\x64" /LIBPATH:"%WindowsSdkDir%lib\%WindowsSDKLibVersion%um\x64"
SET LIBS=sfml-network-d.lib sfml-audio-d.lib sfml-graphics-d.lib sfml-window-d.lib sfml-system-d.lib kernel32.lib user32.lib gdi32.lib winspool.lib shell32.lib ole32.lib oleaut32.lib uuid.lib comdlg32.lib advapi32.lib

"%VSx64BIN%cl.exe" /Zi /EHsc /RTC1 /MDd /GS /c "..\src\main.cpp" %INCLUDES%
"%VSx64BIN%link.exe" main.obj /OUT:"..\bin\yt_dvc.exe" %LIBPATH% %LIBS% /MACHINE:X64 /SUBSYSTEM:CONSOLE
copy %USERPROFILE%\Documents\CursoVideojuegos\ext\lib\SFML\Debug\* ..\bin\