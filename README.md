# Careful!
- This script may froce close your Adobe applications! Save your work first and please read this document to the end.
- You will need to install santa (read bellow of how to do so)

# noAdobe-services
Here are some ShellScripts that make use of santa and killall to keep the background services of Adobe disabled. Now the issue is, once you disabled the services, you usually would not be able to start up any Adobe application anymore. For that reason, I made another script which lets you enable the services needed to run CreativeCloud or Photoshop (I only tested Photoshop but other Adobe applications should work with this also).

### There are 3 scripts:
- DisableAdobeServices.command
This script disables all background services (That I could find) of Adobe and kills their process name with "killall". CreativeCloud will be force closed once you run this. It also disables Adobes crash handlers, the processes which run in the background to collect data when a application of Adobe crashes (So far only the crash handlers of CreativeCloud app, Photoshop, Lightroom and Lightroom classic are beeing disabled).

- EnablePhotoshopServices.command
This script enables the AdobeIPCBroker which Photoshop needs to run. After you ran the "DisableAdobeServices.command", run this one and you can launch Photoshop, Lightroom and possibly all other Adobe creative applications (Except the CreativeCloud managment app).

- EnableCreativeCloudServices.command
This script will enable all services needed to run the CreativeCloud managment app. So you can run this to update your applications occanly and then run the "DisableAdobeServices.command" to disable it again.

- RestoreToDefault.command
This script remove all changes made from the "DisableAdobeServices.command to your santa database.


## Installation
1. You will need to install santa. You can get it here (its free and opensource): https://github.com/google/santa/releases
santa is a utlity that allows you to blacklist or whitelist processes on your macos system. You will need this, because Adobe would otherwhise constantly start up its background services after you closed them. With santa they will not be able to start up anymore.


# Questions
