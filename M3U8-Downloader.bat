@echo off
title M3U8-Downloader by F.-T.-Corp. [v0.0.2]
color 0a
cls

:start
cls
echo.
echo ############################
echo # This is a HELP-Extractor #
echo # You only need to select  #
echo # your m3u8-FILE/Link and  #
echo # the ffmpeg.exe and m3u8- #
echo # Downloader.bat do the    #
echo # rest!                    #
echo # You can use it to        #
echo # Download HLS-Videos      #
echo # (HLS=HTTP LIVE SERVER)   #
echo ############################
echo .

set /p link=Enter your .m3u8-Videolink that you want to extract: 
set /p titlename=Enter a title for the extracted downloaded file: 
echo .

echo Start selecting downloadserver...
echo .

ffmpeg -i "%link%" -c copy -bsf:a aac_adtstoasc "%titlename%.mp4"
echo .

echo copy to output...

if exist output\ (
  goto copf
) else (
  mkdir output
  goto copf
)

:copf
copy "%titlename%.mp4" "output\"
echo .
del "%titlename%.mp4"
echo DELETED SUCCSESS...
echo .

pause
goto start