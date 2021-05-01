#! /bin/bash
# CreativeCloud will not run if any of those applications are beeing prevented from running.

#Library stuff needed for CreativeCloud
sudo santactl rule --remove --path "/Library/Application Support/Adobe/Adobe Desktop Common/IPCBox/AdobeIPCBroker.app"
sudo santactl rule --remove --path "/Library/Application Support/Adobe/Adobe Desktop Common/ADS/Adobe Desktop Service.app"
sudo santactl rule --remove --path "/Library/Application Support/Adobe/Creative Cloud Libraries/CCLibrary.app"

#Cloud Services, Helper Service and all the other stuff which the CreativeCloud application needs to run
sudo santactl rule --remove --path "/Applications/Utilities/Adobe Sync/CoreSync/Core Sync.app"
sudo santactl rule --remove --path "/Applications/Utilities/Adobe Creative Cloud Experience/CCXProcess/CCXProcess.app"
sudo santactl rule --remove --path "/Applications/Utilities/Adobe Creative Cloud/ACC/Creative Cloud Helper.app"
sudo santactl rule --remove --path "/Applications/Utilities/Adobe Creative Cloud/ACC/Creative Cloud.app"
