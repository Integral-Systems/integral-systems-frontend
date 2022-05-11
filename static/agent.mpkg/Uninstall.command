#!/bin/bash

echo "Stopping Mesh Agent…"
sudo /bin/launchctl unload /Library/LaunchDaemons/meshagent_osx64_LaunchDaemon.plist
sudo /bin/launchctl unload /Library/LaunchDaemons/meshagentDiagnostic_periodicStart.plist &> /dev/null
sudo /bin/launchctl unload /Library/LaunchDaemons/meshagentDiagnostic.plist &> /dev/null
sudo rm /Library/LaunchDaemons/meshagentDiagnostic_periodicStart.plist &> /dev/null
sudo rm /Library/LaunchDaemons/meshagentDiagnostic.plist &> /dev/null
sudo rm /usr/local/mesh_services/meshagent/meshagent_osx64
sudo rm /usr/local/mesh_services/meshagentDiagnostic/meshagentDiagnostic &> /dev/null
sudo rm /Library/LaunchDaemons/meshagent_osx64_LaunchDaemon.plist
sudo rm /Library/LaunchAgents/meshagent_osx64_LaunchAgent.plist
echo "Mesh Agent was uninstalled."

