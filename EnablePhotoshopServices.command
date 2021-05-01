#! /bin/bash

# I have only tested this script with Photoshop but it should work just fine for the other applications aswell.
# All what Photoshop needs is the IPCBroker. It runs fine if you have the crash handlers disabled.
# Photoshop may start up a little slower at the beginning. That is because it will first try to start the IPCBroker service and then start itself.
# Once the IPCBroker service is running, you shouldnt notice a difference in application start performance but yeah I cannot be sure...

sudo santactl rule --remove --path "/Library/Application Support/Adobe/Adobe Desktop Common/IPCBox/AdobeIPCBroker.app"