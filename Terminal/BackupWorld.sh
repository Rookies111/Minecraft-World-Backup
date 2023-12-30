#!/bin/bash

# Get current date and time
NOW=$( date '+%F_%H%M%S' )
# Change working directory to where Minecraft World is stored
cd ~/.var/app/io.mrarm.mcpelauncher/data/mcpelauncher/games/com.mojang/minecraftWorlds
# Display all available worlds
echo "All available Minecraft worlds"
worlds=()
i=1
for f in *
do
    worlds[$i]="$f"
    echo $'\t'$"$i) ${worlds[i]}"
    (( ++i ))
done
# Choose what world to backup
if read -p "What Minecraft World do you want to backup?: " ans
then
    echo "Backing up ${worlds[$ans]}"
    # Zip the Minecraft World
    zip -r "${worlds[$ans]} $NOW" ${worlds[$ans]} >/dev/null
    # Move to backup directory
    mv "${worlds[$ans]} $NOW.zip" /media/rookies111/Storage/MinecraftWorld
    echo "Backup completed"
fi
