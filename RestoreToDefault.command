#! /bin/bash

# This Script first prevents execution of the background apps from adobe and then kills their processes with the killall command
# Its possible that if Adobe modifies some background applications (manly if they change their name which is not likely), this script wont be able to properly block them anymore.
# In that case an update of this Script would be required

# Blocking libs and backgroundservices from Adobe using santactl
sudo santactl rule --remove --path "/Library/Application Support/Adobe/Adobe Desktop Common/IPCBox/AdobeIPCBroker.app"
sudo santactl rule --remove --path "/Library/Application Support/Adobe/Adobe Desktop Common/ADS/Adobe Desktop Service.app"
sudo santactl rule --remove --path "/Library/Application Support/Adobe/Creative Cloud Libraries/CCLibrary.app"

sudo santactl rule --remove --path "/Applications/Utilities/Adobe Sync/CoreSync/Core Sync.app"
sudo santactl rule --remove --path "/Applications/Utilities/Adobe Creative Cloud/ACC/Creative Cloud.app"
sudo santactl rule --remove --path "/Applications/Utilities/Adobe Creative Cloud/ACC/Creative Cloud Helper.app"
sudo santactl rule --remove --path "/Applications/Utilities/Adobe Creative Cloud Experience/CCXProcess/CCXProcess.app"

#Disable crash reporting services of Adobe (Not needed to run Adobe Applications)
sudo santactl rule --remove --path "/Applications/Adobe Photoshop 2021/Adobe Photoshop 2021.app/Contents/Frameworks/AdobeCrashReporter.framework/Versions/A/AdobeCRDaemon.app/Contents/MacOS/AdobeCRDaemon"
sudo santactl rule --remove --path "/Applications/Utilities/Adobe Creative Cloud/ACC/Creative Cloud.app/Contents/Frameworks/AdobeCrashReporter.framework/Versions/A/AdobeCRDaemon.app"
sudo santactl rule --remove --path "/Applications/Utilities/Adobe Creative Cloud/ACC/Creative Cloud Helper.app/Contents/Frameworks/AdobeCrashReporter.framework/Versions/A/AdobeCRDaemon.app"
sudo santactl rule --remove --path "/Library/Application Support/Adobe/Adobe Desktop Common/IPCBox/AdobeIPCBroker.app/Contents/Frameworks/AdobeCrashReporter.framework/Versions/A/AdobeCRDaemon.app"
sudo santactl rule --remove --path "/Library/Application Support/Adobe/Adobe Desktop Common/ADS/Adobe Desktop Service.app/Contents/Frameworks/AdobeCrashReporter.framework/Versions/A/AdobeCRDaemon.app"

#Disable crash reporting services for Adobe Lightroom
sudo santactl rule --remove --path "/Applications/Adobe Lightroom CC/Adobe Lightroom.app"
#Same for Adobe Lightroom Classig
sudo santactl rule --remove --path "/Applications/Adobe Lightroom Classic/Adobe Lightroom Classic.app"
