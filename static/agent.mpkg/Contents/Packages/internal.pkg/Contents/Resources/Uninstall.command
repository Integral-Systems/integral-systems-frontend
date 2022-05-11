#!/bin/bash

echo "Stopping Mesh Agent…"
sudo /bin/launchctl unload /Library/LaunchDaemons/meshagent_osx64_LaunchDaemon.plist
sudo rm /usr/local/mesh_services/meshagent/meshagent_osx64
sudo rm /Library/LaunchDaemons/meshagent_osx64_LaunchDaemon.plist
sudo rm /Library/LaunchDaemons/meshagent_osx64_LaunchAgent.plist
echo "Mesh Agent was uninstalled."

