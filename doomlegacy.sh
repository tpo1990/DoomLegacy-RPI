#!/usr/bin/env bash

# This file is part of The RetroPie Project
# 
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="doomlegacy"
rp_module_desc="Doom Legacy - Enhanced splitscreen port of the official DOOM source"
rp_module_licence="GPL2 https://raw.githubusercontent.com/tpo1990/DoomLegacy-RPI/master/LICENSE"
rp_module_help="For registered version, add your own iwad and pwads (doom.wad, doom2.wad, tnt.wad and plutonia.wad) to $romdir/ports/doom. Notice: If doom.wad is not found in doom roms folder, shareware version will be installed."
rp_module_section="exp"
rp_module_flags=""

function depends_doomlegacy() {
    getDepends cmake libsdl1.2-dev libsdl-net1.2-dev libsdl-sound1.2-dev libsdl-mixer1.2-dev libsdl-image1.2-dev fluidsynth
}

function sources_doomlegacy() {
    wget -O- -q https://liquidtelecom.dl.sourceforge.net/project/doomlegacy/1.48.4/doomlegacy_1.48.4_source.tar.bz2 | tar -xvj --strip-components=1
}

function build_doomlegacy() {
    make OS=LINUX SMIF=SDL HAVE_MIXER=1
}

function install_doomlegacy() {
    md_ret_files=('bin')
}

function game_data_doomlegacy() {
    if [[ ! -f "$romdir/ports/doom/legacy.wad" ]]; then
        downloadAndExtract "https://iweb.dl.sourceforge.net/project/doomlegacy/1.48.4/doomlegacy_1.48.4_common.zip" "$romdir/ports/doom/"
        mv "$romdir/ports/doom/doomlegacy_1.48.4/legacy.wad" "$romdir/ports/doom/"
        rm -r "$romdir/ports/doom/doomlegacy_1.48.4"
        chown -R $user:$user "$romdir/ports/doom"
    fi
    
    if [[ -f "$romdir/ports/doom/doom.wad" ]]; then
       chown $user:$user "$romdir/ports/doom/doom.wad"
       addPort "$md_id" "doom" "Doom" "DOOMWADDIR=$romdir/ports/doom $md_inst/bin/doomlegacy -iwad %ROM%" "$romdir/ports/doom/doom.wad"
    else wget "$__archive_url/doom1.wad" -O "$romdir/ports/doom/doom1.wad"
       chown $user:$user "$romdir/ports/doom/doom1.wad"
       addPort "$md_id" "doom" "Doom Shareware" "DOOMWADDIR=$romdir/ports/doom $md_inst/bin/doomlegacy -iwad %ROM%" "$romdir/ports/doom/doom1.wad"
    fi
    
    if [[ -f "$romdir/ports/doom/doom2.wad" ]]; then
       chown $user:$user "$romdir/ports/doom/doom2.wad"
       addPort "$md_id" "doom" "Doom II: Hell on Earth" "DOOMWADDIR=$romdir/ports/doom $md_inst/bin/doomlegacy -iwad %ROM%" "$romdir/ports/doom/doom2.wad"
    fi
    
    if [[ -f "$romdir/ports/doom/tnt.wad" ]]; then
       chown $user:$user "$romdir/ports/doom/tnt.wad"
       addPort "$md_id" "doom" "Final Doom - TNT: Evilution" "DOOMWADDIR=$romdir/ports/doom $md_inst/bin/doomlegacy -iwad %ROM%" "$romdir/ports/doom/tnt.wad"
    fi
    
    if [[ -f "$romdir/ports/doom/plutonia.wad" ]]; then
       chown $user:$user "$romdir/ports/doom/plutonia.wad"
       addPort "$md_id" "doom" "Final Doom - The Plutonia Experiment" "DOOMWADDIR=$romdir/ports/doom $md_inst/bin/doomlegacy -iwad %ROM%" "$romdir/ports/doom/plutonia.wad"
    fi
}

function configure_doomlegacy() {
    mkRomDir "ports/doom"
    mkRomDir "$md_inst/bin/wads"

    mkUserDir "$home/.doomlegacy"
    mkUserDir "$md_inst/bin/wads"
    moveConfigDir "$home/.doomlegacy" "$md_conf_root/doom"
    moveConfigDir "$md_inst/bin/wads" "$romdir/ports/doom"

    [[ "$md_mode" == "install" ]] && game_data_doomlegacy
}

function remove_doomlegacy() {
    rm "$romdir/ports/doom/legacy.wad"
}
