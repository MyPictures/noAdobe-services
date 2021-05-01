# Careful!
- This script may froce close your Adobe applications! Save your work first and please read this document completly.
- You will need to install santa (read bellow of how to do so).
- This script does not delete or modify your Adobe installation files.
- Those scripts were tested with CreativeCloud 5.4, it should work for most Adobe applications because the processes stayed the same for some time now (AdobeIPCBroker, Cloud stuff...., etc.). I also used santa version 2021.3 for testing.

# noAdobe-services
Here are some ShellScripts that make use of santa and killall to keep the background services of Adobe disabled. Now the issue is, once you disabled the services, you usually would not be able to start up any Adobe application anymore. For that reason, I made other scripts which let you enable the services needed to run CreativeCloud or Photoshop (I only tested Photoshop but other Adobe creative cloud applications should work with this also).

## There are 3 scripts:
- **DisableAdobeServices.command:**
This script disables all background services (That I could find) of Adobe and kills their process instance by their name with "killall". **CreativeCloud will be force closed once you run this.** It also disables Adobes crash handlers, those usually run in the background to collect data when a application of Adobe crashes (So far only the crash handlers of CreativeCloud app, Photoshop, Lightroom and Lightroom classic are beeing disabled by this script).

- **EnablePhotoshopServices.command:**
This script enables the AdobeIPCBroker which Photoshop needs to run. After you ran the "DisableAdobeServices.command", run this one and you can launch Photoshop, Lightroom and possibly all other Adobe creative applications (Except the CreativeCloud managment app).

- **EnableCreativeCloudServices.command:**
This script will enable all services needed to run the CreativeCloud managment app. Run this to update your applications occasionally and then re-run the "DisableAdobeServices.command" to disable the background services again.

- **RestoreToDefault.command:**
This script will remove all changes made from the "DisableAdobeServices.command" to your santa database.

# Installation
1. You will need to install santa. You can get it here (its free and opensource): https://github.com/google/santa/releases
santa is a utility that allows you to blacklist or whitelist processes on your macos system. You will need this, because Adobe would otherwhise constantly start up its background services after you closed them. With santa those services will not be able to start up anymore. Santa also supports m1 macs by the way.
- Download the dmg and install it like any other application.
- Make sure you give the santa daemon permissions for the harddrive, otherwhise it will not work properly. In macos go under Settings/Security/Privacy and search for harddrive access and check the box for "com.google.santa.daemon.systemextension".
- Reboot your system, open a terminal and check with the command **santactl status** if santa is working properly.
2. Download the scripts [noAdobe-services releases](https://github.com/MyPictures/noAdobe-services/releases) from here and make them executable with **cmod u+x xxxxxxxx.command**
3. Place them anywhere you want, and now run the ones you need/want. You will get asked for your password, enter your password and the scripts should run.

# More
- Check out the .plist section from ravbug. [ravbug](https://www.ravbug.com/tutorials/stop-adobe-daemons/)
