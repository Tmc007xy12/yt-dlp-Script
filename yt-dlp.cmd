@ECHO OFF

SET DnBest=--hls-prefer-native --add-metadata -f best
SET DnBEST=-f best
SET DnBestAudVid=--hls-prefer-native --add-metadata
SET DnBestUnmerge=--hls-prefer-native --add-metadata -f "bestvideo,bestaudio"
SET DnBestMP4_MPA=--hls-prefer-native --add-metadata -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best"
SET DnBestMP4_AAC=--hls-prefer-native --add-metadata -f "bestvideo[ext=mp4]+bestaudio[ext=aac]/best[ext=mp4]/best"
SET DnMP3=--write-all-thumbnails --hls-prefer-native --add-metadata --embed-thumbnail -f bestaudio/best -x --audio-quality 0 --audio-format mp3
SET DnAAC=--write-all-thumbnails --hls-prefer-native --add-metadata --embed-thumbnail -f bestaudio/best -x --audio-quality 0 --audio-format aac
SET DnM4A=--write-all-thumbnails --hls-prefer-native --add-metadata --embed-thumbnail -f bestaudio/best -x --audio-quality 0 --audio-format m4a
SET Dnflac=--write-all-thumbnails --hls-prefer-native --add-metadata --embed-thumbnail -f bestaudio/best -x --audio-quality 0 --audio-format flac
SET DnVORBIS=--write-all-thumbnails --hls-prefer-native --extract-audio --audio-format vorbis --add-metadata
SET Dnopus=--write-all-thumbnails --hls-prefer-native --add-metadata --embed-thumbnail -f bestaudio/best -x --audio-quality 0 --audio-format opus
SET DnCUSTOM=-F %URL%



SET Destination="C:\Users\tonyc\Desktop\yt-dlp new/%%(title)s.%%(ext)s"

if not -%1-==-- SET URL=%*
if -%1-==-- goto fopNew

:top
CLS
ECHO URL: %URL%
ECHO ----------------------
ECHO Available operations:
ECHO ----------------------
ECHO .
::This prints the list of the operations

ECHO 1. Best already on site
ECHO 2. Best Audio and Best Video
ECHO 3. Best (no merge)
ECHO 4. Best MP4 and M4A
ECHO 5. Best MP4 and AAC
ECHO 6. MP3 (Audio)
ECHO 7. AAC (Audio)
ECHO 8. M4A (Audio)
ECHO 9. flac(Audio)
ECHO 10. vorbis(Audio)
ECHO 11. opus (Audio)
ECHO 12. CUSTOM (Single file)
ECHO -
ECHO f. List all possible formats
ECHO u. Auto-update
ECHO n. Process New File
ECHO q. Quit
ECHO -

::Ask the user to choose the operation they want

SET /P operation=Which operation would you like to do?:
if "%operation%"=="n" goto fopNew
if "%operation%"=="N" goto fopNew
if "%operation%"=="1" goto fop1
if "%operation%"=="2" goto fop2
if "%operation%"=="3" goto fop3
if "%operation%"=="4" goto fop4
if "%operation%"=="5" goto fop5
if "%operation%"=="6" goto fop6
if "%operation%"=="7" goto fop7
if "%operation%"=="8" goto fop8
if "%operation%"=="9" goto fop9
if "%operation%"=="10" goto fop10
if "%operation%"=="11" goto fop11
if "%operation%"=="12" goto fop12
if "%operation%"=="f" goto fopFormat
if "%operation%"=="F" goto fopFormat
if "%operation%"=="u" goto fopUpdate
if "%operation%"=="U" goto fopUpdate
if "%operation%"=="x" goto fopcommand
goto fopQuit


:fop1
ECHO Best:
yt-dlp %DnBest% -o %Destination% %URL%
pause
goto top

:fop2
ECHO Best Audio and Best Video:
yt-dlp %DnBestAudVid% -o %Destination% %URL%
pause
goto top

:fop3
ECHO Best No Merge:
yt-dlp %DnBestUnmerge% -o %Destination% %URL%
pause
goto top

:fop4
ECHO Best MP4 and MPa:
yt-dlp %DnBestMP4_MPA% -o %Destination% %URL%
pause
goto top

:fop5
ECHO Best MP4 and AAC:
yt-dlp %DnBestMP4_AAC% -o %Destination% %URL%
pause
goto top

:fop6
ECHO MP3:
yt-dlp %DnMP3% -o %Destination% %URL%
pause
goto top

:fop7
ECHO AAC:
yt-dlp %DnAAC% -o %Destination% %URL%
pause
goto top

:fop8
ECHO M4A:
yt-dlp %DnM4A% -o %Destination% %URL%
pause
goto top

:fop9
ECHO flac:
yt-dlp %Dnflac% -o %Destination% %URL%
pause
goto top

:fop10
ECHO vorbis:
yt-dlp %Dnvorbis% -o %Destination% %URL%
pause
goto top

:fop11
ECHO opus:
yt-dlp %Dnopus% -o %Destination% %URL%
pause
goto top

:fop12
ECHO CUSTOM:
yt-dlp %DnCUSTOM% %URL%
SET /P format="Select Single format: "
ECHO.
yt-dlp -o Downloads/%%(title)s.%%(ext)s -f %format% -i --ignore-config --hls-prefer-native %URL%
pause
goto top

:fopFormat
ECHO List of all possible formats:
yt-dlp -F %URL%
pause
goto top

:fopUpdate
ECHO Updates:
yt-dlp -U
pause
goto top



:fopNew
SET /P URL=Please enter the video URL:
goto top

:fopQuit

