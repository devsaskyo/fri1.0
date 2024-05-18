#!/bin/bash


if [ $EUID -ne 0 ]; then
    echo "Error: insufficient permissions. Please use 'sudo /etc/fri-uninstall.sh' to run."
    exit 1
fi

pref="[fri-unistaller]"
echo "$pref Starting the uninstallation proccess..."
echo "$pref COMPLETELY UNINSTALLING [fri]..."
rm -rf /etc/fri/ || echo "CRITICAL ERROR: COULD NOT REMOVE MAIN DIRECTORY: /etc/fri"
rm -rf /usr/bin/fri || echo "CRITICAL ERROR: COULD NOT REMOVE /usr/bin/fri, PLEASE REMOVE MANUALLY."
rm -rf /usr/bin/friends || echo "CRITICAL ERROR: COULD NOT REMOVE /usr/bin/friends, PLEASE REMOVE MANUALLY."
echo "$pref [fri] WAS UNINSTALLED SUCCESSFULLY."
rm -rf /etc/fri-uninstall.sh || echo "ERROR: COULD NOT REMOVE /etc/fri-uninstall.sh, please remove manually."
