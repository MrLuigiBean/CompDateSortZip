wsl.exe -- ./CompressScreenshots.sh
PAUSE

PowerShell.exe -Command .\DateChanger.ps1
PAUSE

:: wsl.exe -- ./SortScreenshots.sh
PAUSE

:: PowerShell.exe -Command .\ZipFolderContents.ps1
PAUSE
:: PAUSE
