#!/bin/bash

cp "$1/Contents/meshagent_osx64.msh" /usr/local/mesh_services/meshagent
cp "$1/Contents/meshagent_osx64.bin" /usr/local/mesh_services/meshagent/meshagent_osx64
cp "$1/Contents/meshagent_osx64_LaunchDaemon.plist" /Library/LaunchDaemons/
cp "$1/Contents/meshagent_osx64_LaunchAgent.plist" /Library/LaunchAgents/
rm /usr/local/mesh_services/meshagent/internal.txt

chown root:wheel /usr/local/mesh_services/meshagent
chown root:wheel /usr/local/mesh_services/meshagent/meshagent_osx64
chown root:wheel /Library/LaunchDaemons/meshagent_osx64_LaunchDaemon.plist
chown root:wheel /Library/LaunchAgents/meshagent_osx64_LaunchAgent.plist

chmod 755 /usr/local/mesh_services/meshagent
chmod 755 /usr/local/mesh_services/meshagent/meshagent_osx64

/bin/launchctl load /Library/LaunchDaemons/meshagent_osx64_LaunchDaemon.plist
