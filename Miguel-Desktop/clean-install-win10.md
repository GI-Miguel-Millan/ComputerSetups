# Clean Install Of Windows 10

## Before Re-install

1. Backup any save data that is not stored in the Cloud.
    - Darksouls 1 and remaster saves are all stored in Documents, which is now backed up in One Drive, so not as concerned.
    - Particularly: Magicite, Darksouls 2+3, Warcraft3, Warcraft2, StarCraft, or any other game/config that doesn't save to the Cloud or connected NAS.
	    - If you mod skyrim using Nexus Mod Manager, backup the program folder where this data is stored.
	    - Beatsaber custom levels and data
    - If you don't have a full backup of users, make sure to at least grab config data from AppData for programs with a more involved setup (i.e. Anki)
	    - At the very least, save Anki data + addons.
2. Make note of any programs that have been added/removed from this list since the last time you performed a fresh install.
3. Create a Windows installer: [detailed Instructions](https://www.microsoft.com/en-us/software-download/windows11)
 
## Important / Immediately after Install

1. Kill any unnecessary processes and remove any bloatware that came with the fresh install.
2. Perform a benchmark test using Windows built in Performance Monitor.
    1. Press the *Windows Key + R* and type "perfom /report"
    2. Save this report for future reference
3. Perform a benchmark test using [NovaBench](https://novabench.com/files/novabench.msi).
3. Map network drives to access any backup data (if backing up to a NAS).
4. Now download and install windows environment improvements/Utilities:

    - Web Browser: [FireFox]('https://download.mozilla.org/?product=firefox-latest&os=win64&lang=en-US')
	- Password Manager: [KeyPassXC](https://keepassxc.org/download/#windows)
    - VPN: [Mullvad](https://mullvad.net/en/download/)
	- Graphic drivers: [Geforce Experience](https://www.nvidia.com/en-us/geforce/geforce-experience/)
    - Remote Desktop: [Teamviewer](https://www.teamviewer.com/en/teamviewer-automatic-download/)
    - Default Editor: [Install Notepad++](https://notepad-plus-plus.org/)
    - Archive manager: [7-Zip](https://www.7-zip.org/)
    - Faster File Search: [Everything](https://www.voidtools.com/)
    - Printer Drivers: [Brother Printer](https://www.brother-usa.com/home/printers-fax)
    - Image Viewer: [Honeyview](https://www.bandisoft.com/honeyview/)
        - Configure: either from scratch, or copy configs from User app data backup.
    - Screenshot Software: [ShareX](https://getsharex.com/)
        - Configure: either from scratch, or copy configs from User app data backup.
		- Note: you need to download the recorder devices for ShareX to record audio/video. [Instructions](https://sublimelms.com/docs/Video-App-Guide/Video%20App/How_to_record_screen_with_voice_using_Sharex_.html)
		- If you don't want all the extra functionality of ShareX (OCR, Audio capture, editor, etc) then you can get [LightShot](https://app.prntscr.com/en/index.html)
    - Git Shell: [git-bash](https://git-scm.com/downloads)
        - If the context menu is broken, then add a registry entry using these [instructions](https://stackoverflow.com/a/44019893).
	
 
 ## Daily Use Programs

- Japanese / Media Related:

    - SRS program: [Anki](https://apps.ankiweb.net/)
	    - Copy over anki data / addons
		- At the very least, we want Anki Connect.
		    - Don't forget to set a static IP so we can yomi-chan cards from mobile browser to desktop Anki.
			- **Important** make sure Anki is allowed through firewall or you will have issues with remote yomi-chan to Anki-connect card generation.
	- Subtitle editor: [Aegissub](http://www.aegisub.org/)
	- Torrent client: [Deluge](https://dev.deluge-torrent.org/wiki/Download)
	    - If the latest 2.0.x windows installer is still unavailable, use the [unofficial installer](https://forum.deluge-torrent.org/viewtopic.php?t=55776)
		- Make sure to configure as a thin client if you use a seedbox.
	- TextHooker: [Textractor](https://github.com/Artikash/Textractor)
	    - older alternative: [ITH](https://github.com/Erikhht/interactive-text-hooker/releases)
	- Text Capture (OCR): [Capture2Text](http://capture2text.sourceforge.net/)
	    - If you've downloaded ShareX already, this one is not necessary as ShareX has OCR functionality.
		- Unlike ShareX, this Capture2Text doesn't require internet functionality.
	- Media Players:
        - [Plex Media Player](https://www.plex.tv/media-server-downloads/#plex-app)
		- [VLC](https://www.videolan.org/vlc/)
	- Mass File Renaming: *FileBot* - Download from the microsoft store if you own it.
	
- Gaming related:

    - [Steam](https://store.steampowered.com/)
	    - Beatsaber mapping: [MediocreMapper2](https://bsmg.wiki/mapping/mediocre-map-assistant.html)
		- Beatsaber mods: [ModAssistant](https://github.com/Assistant/ModAssistant#Usage)
	- [Battle.net](https://www.blizzard.com/en-us/apps/battle.net/desktop)

- Other / MISC:

	- Text & Voice Chat App: [Discord](https://discord.com/)
	- Mouse Software: [Logitech G Hub](https://www.logitechg.com/en-us/innovation/g-hub.html)
	
	
## Download as the need arises

- Audio Editor: [Audacity](https://www.audacityteam.org/)
- Slicer program for 3D printing: [ChiTuBox](https://www.chitubox.com/en/download/chitubox-free)
- Video Capture: [obs-studio](https://obsproject.com/)
- Video editor: [OpenShot Video Editor](https://www.openshot.org/)
- [ProcessExplorer](https://docs.microsoft.com/en-us/sysinternals/downloads/process-explorer)
- Treeview GUI (good for finding disk space hogs): [TreeSize Free](https://www.jam-software.com/treesize_free)
- Piano Rhythm game: [Synthesia](https://synthesiagame.com/)
- Linux Terminal:
    - Setup [Windows Subsystem for Linux (wsl)](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
	- or, get [MobaXterm](https://mobaxterm.mobatek.net/download.html) home edition.

## All Programs
- Adobe Acrobat Reader - probably don't need anymore, can open pdf in browsers
- Adobe Flash player - flash has been discontinued
- [Anki](https://apps.ankiweb.net/)
- [Audacity](https://www.audacityteam.org/)
- [Battle.Net](https://www.blizzard.com/download/confirmation?product=bnetdesk)
- Brother Utilities
- [FireFox](https://download.mozilla.org/?product=firefox-latest&os=win64&lang=en-US)
- [Deluge](https://ftp-osl.osuosl.org/pub/deluge/windows/)
- [Discord](https://discord.com/api/downloads/distributions/app/installers/latest?channel=stable&platform=win&arch=x86)
- DTS:X Ultra - audio driver
- [EarMaster 7](https://www.earmaster.com/downloads/free-versions.html)
- [Everything](https://www.voidtools.com/)
- ext3fsd - use to mount ext2/3/4 filesystem on windows
- FileBot - download from microsoft store
- [Git Bash](https://git-scm.com/download/win)
- [Honeyview](https://www.bandisoft.com/honeyview/dl.php?web)
- [KeePassXC](https://keepassxc.org/download/#windows)
- [Logitech G HUB (mouse software)](https://download01.logi.com/web/ftp/pub/techsupport/gaming/lghub_installer.exe)
- [mp3tag](https://www.mp3tag.de/en/dodownload64.html)
- [MobaXterm](https://mobaxterm.mobatek.net/download-home-edition.html)
- [Mullvad](https://mullvad.net/download/app/exe/latest/)
- [musicbrainz picard](https://picard.musicbrainz.org/)
- [notepad++](https://notepad-plus-plus.org/downloads/)
- [NovaBench](https://novabench.com/files/novabench.msi)
- [NZXT CAM](https://nzxt-app.nzxt.com/NZXT-CAM-Setup.exe)
- [OBS Studio](https://obsproject.com/)
- [Office](https://www.microsoft.com/en-us/microsoft-365/p/microsoft-365-family/cfq7ttc0k5dm?icid=mscom_marcom_dlc&activetab=pivot:overviewtab)
- [Plex](https://www.plex.tv/media-server-downloads/#plex-app)
- [Steam](https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe)
- [Team Viewer](https://download.teamviewer.com/download/TeamViewer_Setup_x64.exe)
- [TreeSize Free](https://customers.jam-software.de/downloadTrial.php?language=EN&article_no=80&ca=1)
- [VLC media player](https://www.videolan.org/vlc/)
- [Visual Studio](https://visualstudio.microsoft.com/)

## After Installing and configuring programs

- Clean up startup programs (remove anything but the essential).
- If not already done, connect to network drives.
- Pin to quick access:
    - Important Network Drive locations (TV Shows, Movies, Music, Pictures)
	- User directory (faster access of AppData)
	- Local Linux directory:
	     - if using wsl with Ubuntu app: "C:\Users\miggy\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu18.04onWindows_79rhkp1fndgsc\LocalState\rootfs\root"
         - if using mobaxterm: C:\Users\miggy\OneDrive\Documents\MobaXterm\home
- Setup wallpaper using "Wallpaper Engine"

## Misc

- If you install / run a japanese game that uses SoftDenchi DRM, use [this](https://pastebin.com/wKJuWdVL) python script to remove the watchdog software.
    - This DRM watchdog is similar to a malware in that it runs even when the game is not running. If you've legally obtained the game, there should be nothing wrong with removing this waste of resources.

## Old/Unnecessary Programs

- Ark Server: arkServerManager
- modeling software: Blender.net
- media remux software: ffmpeg-win-2.2.2 
- MKV editor: MKVToolNix 
- alternate web browser: Opera
- game launcher: Origin Games 
- game launcher: Riot Games 
- desktop epwing dictionary viewer: qolibri_2.2.2_win32
	- Just use yomi-chan, you can get the most important dictionaries anyway.
	
