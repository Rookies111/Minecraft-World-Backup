#!/bin/bash

function getWorlds() {
    local worlds="["
    # Change working directory to where Minecraft World is stored
    cd ~/.var/app/io.mrarm.mcpelauncher/data/mcpelauncher/games/com.mojang/minecraftWorlds
    # Get all Minecraft Worlds from directory
    for f in *
    do
        worlds+=`echo "\"$f\", "`
    done
    local output=${worlds::-2}"]"
    echo $output
}

function Save() {
    echo $1
    # Get current date and time
    # local NOW=$( date '+%F_%H%M%S' )
    # Zip the Minecraft World
    # zip -r "$1 $NOW" $1 >/dev/null
    # Move to backup directory
    # mv "$1 $NOW.zip" /media/rookies111/Storage/MinecraftWorld
}

function Remove() {
    echo 0
}

ans=$(slint-viewer ~/Utility/Scripts/BackupWorld.slint --on $(Save) $1 --save-data - --load-data - <<EOF
{
    "worlds": $(getWorlds)
}
EOF
)
echo $ans
name=$(awk 'BEGIN{FS="\""}{print $4}' <<< "${ans}")
echo ${name[0]}