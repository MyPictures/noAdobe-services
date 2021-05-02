#! /bin/bash

# This Script first prevents execution of the background apps from adobe and then kills their processes with the killall command
# Its possible that if Adobe modifies some background applications (manly if they change their name which is not likely), this script wont be able to properly block them anymore.
# In that case an update of this Script would be required

# Blocking libs and backgroundservices from Adobe using santactl
sudo santactl rule --silent-block --path "/Library/Application Support/Adobe/Adobe Desktop Common/IPCBox/AdobeIPCBroker.app"
sudo santactl rule --silent-block --path "/Library/Application Support/Adobe/Adobe Desktop Common/ADS/Adobe Desktop Service.app"
sudo santactl rule --silent-block --path "/Library/Application Support/Adobe/Creative Cloud Libraries/CCLibrary.app"

sudo santactl rule --silent-block --path "/Applications/Utilities/Adobe Sync/CoreSync/Core Sync.app"
sudo santactl rule --silent-block --path "/Applications/Utilities/Adobe Creative Cloud/ACC/Creative Cloud.app"
sudo santactl rule --silent-block --path "/Applications/Utilities/Adobe Creative Cloud/ACC/Creative Cloud Helper.app"
sudo santactl rule --silent-block --path "/Applications/Utilities/Adobe Creative Cloud Experience/CCXProcess/CCXProcess.app"

#Disable crash reporting services of Adobe (Not needed to run Adobe Applications)
sudo santactl rule --silent-block --path "/Applications/Adobe Photoshop 2021/Adobe Photoshop 2021.app/Contents/Frameworks/AdobeCrashReporter.framework/Versions/A/AdobeCRDaemon.app/Contents/MacOS/AdobeCRDaemon"
sudo santactl rule --silent-block --path "/Applications/Utilities/Adobe Creative Cloud/ACC/Creative Cloud.app/Contents/Frameworks/AdobeCrashReporter.framework/Versions/A/AdobeCRDaemon.app"
sudo santactl rule --silent-block --path "/Applications/Utilities/Adobe Creative Cloud/ACC/Creative Cloud Helper.app/Contents/Frameworks/AdobeCrashReporter.framework/Versions/A/AdobeCRDaemon.app"
sudo santactl rule --silent-block --path "/Library/Application Support/Adobe/Adobe Desktop Common/IPCBox/AdobeIPCBroker.app/Contents/Frameworks/AdobeCrashReporter.framework/Versions/A/AdobeCRDaemon.app"
sudo santactl rule --silent-block --path "/Library/Application Support/Adobe/Adobe Desktop Common/ADS/Adobe Desktop Service.app/Contents/Frameworks/AdobeCrashReporter.framework/Versions/A/AdobeCRDaemon.app"

#Disable crash reporting services for Adobe Lightroom
sudo santactl rule --silent-block --path "/Applications/Adobe Lightroom CC/Adobe Lightroom.app"
#Same for Adobe Lightroom Classig
sudo santactl rule --silent-block --path "/Applications/Adobe Lightroom Classic/Adobe Lightroom Classic.app"

#Using the killall command afterwards to kill any instances that may run in the background.

#Main Adobe background services (without those, Photoshop and other Adobe applications wont run or hang)
sudo killall AdobeIPCBroker

#Crash handling for all Adobe applications
sudo killall AdobeCRDaemon
sudo killall CrashHandler

# CreativeCloud Stuff
sudo killall "Creative Cloud"
sudo killall "Creative Cloud Helper"
sudo killall "Adobe CEF Helper"
sudo killall "Adobe CEF Helper (GPU)"
sudo killall "Adobe CEF Helper (Renderer)"
sudo killall Adobe_CCXProcess.node
sudo killall "Core Sync"
sudo killall "Adobe Desktop Service"
sudo killall "Adobe Installer"
sudo killall com.adobe.acc.installer.v2

#This is nessesary for the CCLibrary process from Adobe, may also kill other node.js processes
sudo killall node
