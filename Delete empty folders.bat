REM Instructions: Drop in root folder, all directories and
REM subdirectories will be purged of empty folders.
for /f "delims=" %%i in ('dir /s /b /ad ^| sort /r') do rd "%%i" 2>NUL
