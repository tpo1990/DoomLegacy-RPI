# DoomLegacy-RPI
RPI script and RetroPie scriptmodule of Doom Legacy source port

**Doom Legacy source port 1.47.2 for Raspberry Pi**

Doom Legacy which is a Doom source port can now be built and run on our Raspberry Pi. The port features 2 player Split-screen multiplayer. This port relies on SDL1 libs and is working in RetroPie. Note: This is not final version.
![doomlegacy3.png](https://github.com/tpo1990/DoomLegacy-RPI/blob/master/screenshots/doomlegacy3.png)

The game is fully playable. No bugs has been found yet.
The scriptmodule provides an automatic installation and uninstallation for compiling and building on Raspberry Pi with RetroPie-Setup.

Install time: 5-10 minutes

**Build process:**
1: Download and install necessary required libs for SDL and etc.
2: Download Doom Legacy from sourceforge.
3: Compile/install Doom Legacy source from makefile.
4: Download Doom1.wad Shareware and extract into root of Doom folder.
5: Download Legacy.wad Shareware and extract into root of Doom folder.
6: Configure and add Doom Legacy as a port into RetroPie with the Doom.sh file.

**Registered/Full version:**
Add your own iwads and pwads files into the "ports/doom folder" and copy Doom.sh -> edit Doom.sh and change it to point to the correct iwad. ex of Doom 2: "/opt/retropie/supplementary/runcommand/runcommand.sh" 0 _PORT_ "doom" "/home/pi/RetroPie/roms/ports/doom/doom2.wad"

**Notes:**
It is working great and the script is experimental. Their might come additional changes to the scripmodule. A pull request for the RetroPie project is planned at a later stage.

**Disclaimer:**
This installation script is provided as is. Im not responsible for anything happening with your Raspberry Pi including corruption of SD card, Hardware damage. For support and help you can contact me here on RetroPie forums.
