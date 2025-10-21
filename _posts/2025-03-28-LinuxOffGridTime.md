---
title: Off-Grid Time Sync on Linux
date: 2025-03-29 06:00:00 -0600
categories: [hamradio,digital]
tags: [Linux, Time, Sync]
---

We all know that accurate time for Ham Radio digital modes is *imperative*. You've got to have it right and there's no substitute for it. So if you are off-grid and have no internet and can't use your phone to hotspot your laptop, what do you do? *No worries*! Your ICOM IC-705 has a built in GPS. It has accurate time anywhere in the world. But how do you sync with it? This tutorial might look daunting, but it's really not!

![TimeSync](/assets/TimeSync/TS09.webp)

## IC-705 Settings

### Turn on GPS 

First we need to turn on the GPS on the radio. Press the MENU hard button on the bottom left of the radio and then follow these soft button presses: **PAGE 2>GPS>GPS SET>GPS SELECT>>ON**

![GPS](/assets/TimeSync/TS01.webp)

![GPS](/assets/TimeSync/TS02.webp)

![GPS](/assets/TimeSync/TS03.webp)

### Turn on GPS Out

Second, we need to tell the radio to push the GPS data out the USB connection. Press the MENU hard button and then follow these soft button presses: **SET>CONNECTORS>USB(B)FUNCTION>GPS OUT>>ON**

![GPS](/assets/TimeSync/TS04.webp)

![GPS](/assets/TimeSync/TS05.webp)

![GPS](/assets/TimeSync/TS06.webp)

![GPS](/assets/TimeSync/TS07.webp)

## Linux Settings

Linux is generally set to use Network Time Synchronization. This makes sure that when computers talk to each other, they have accurate time which is key for anything digital. This accurate network time comes from the internet automajically. For off-grid radio, we want to to tell the Linux operating system to instead get its time from the IC-705 GPS.  On [Windows](https://youtu.be/9HSfb1kp9NY?si=-U_v52ZNeOa0zM-F), there's an app that lets you pull the time from the radio and sync to it easily. On Linux, we will do it *ourselves* - like the total Unix Chad Master Race Members we are. 

### A Note on Systemd 

These days, most Linux distributions use *Systemd* to synchronize time. It is designed to work with network time servers - but that's about it. Normally this is fine. However, it lacks the built-in ability to sync with a GPS. Other time sync protocols like ```chrony``` or ```ntp``` are configurable to use GPS devices for syncing time. So we have two options. 1) Disable/uninstall Systemd's timesyncd and reinstall these other choices (*doable, but kinda messy*), or 2) Temporarily disable Systemd time syncing using a script. The following is how we do option 2.

### gpsd Interface Daemon

First, we need to install a GPS interface daemon that will grab the time data that is being pushed from the IC-705. We are going to use ```gpsd``` 

#### Install gpsd

Open terminal and use your package manager to install ```gpsd``` You also need ```gpsd-clients``` on Debian and Fedora Linux derivatives). 

Debian/Ubuntu/Mint:

```bash
sudo apt install gpsd gpsd-clients
```
Fedora:

```bash
sudo dnf install gpsd gpsd-clients
```
Arch:
```bash
sudo pacman -S gpsd
```

#### Plug in the Radio

Hook the IC-705 up to your computer with a USB cable and turn the radio on (make sure your GPS is enabled as per the steps above. You might need to give it a minute to get satellite lock). You can check that your computer can see the radio with the following command in the terminal.

```bash
ls /dev/serial/by-id
```

Two files should be displayed. We are interested in ```usb-Icom_Inc._IC-705_IC-705_12011226-if02``` This is where the IC-705 will be pushing GPS data to the computer. Check it with the following command. 

```bash
sudo cat /dev/serial/by-id/usb-Icom_Inc._IC-705_IC-705_12011226-if02
```

It will display a bunch of stuff like the UTC time data, latitude, longitude, etc. Type ```Ctrl-c``` to stop the output.

**NOTE:**
>Once you've got this tutorial completed, running that command will display ```cat /dev/serial/by-id/usb-Icom_Inc._IC-705_IC-705_12011226-if02: Device or resource busy``` This is another confirmation of sorts that it's working.

#### gpsd Socket

Next we are going to tell gpsd to connect to the satellite data from the IC-705. Type the following into the terminal:

```bash
sudo gpsd /dev/serial/by-id/usb-Icom_Inc._IC-705_IC-705_12011226-if02 -n -F /var/run/gpsd.sock
```

+ ```-n```: Prevents gpsd from waiting for a client before polling the GPS.

+ ```-F```: Specifies the socket file.

You can think of this like a doorway that opens to let the data into the computer. The command will point the IC-705 data to that doorway, called a *socket*. If you need to disable this for any reason type: ```sudo systemctl stop gpsd.socket```

Check that the data is coming through the socket by typing ```cgps``` in the terminal. This should barf out all the gps data in a couple of nice tables and a bunch of other streaming data.

![cgps](/assets/TimeSync/TS08-cgps.webp)

You can exit out of ```cgps``` by pressing ```q```

#### Configure gpsd

We will make these settings accessible in the future by editing the gpsd config file at ```/etc/default/gpsd``` with your editor of choice. 

```bash
sudo nano /etc/default/gpsd
```

Add this data to the file with sudo privileges. Save and exit.

```bash
# Default settings for gpsd.
START_DAEMON="true"
GPSD_OPTIONS="-n"
DEVICES="/dev/serial/by-id/usb-Icom_Inc._IC-705_IC-705_12011226-if02"
#USBAUTO="true"
```
 
#### Enable gpsd

We need to make sure the daemon is running. Type the following in the terminal:

```bash
sudo systemctl enable gpsd
sudo systemctl start gpsd
```
You can check its status in the terminal with 

```bash
sudo systemctl status gpsd
```

Booya! All the hard work is done. The time data is now present and available to our computer. 

### Sync Script

This script deactivates network time syncing (that you normally use at home when on the internet) and replaces it with the time from the IC-705 GPS (plus 1 second for latency - in my testing this worked well). Copy this text and save it to a file. I called mine ```IC705TimeSync.sh``` but name it whatever you prefer.

```bash
#!/bin/bash
# Fetch GPS time from gpsd and set system clock with 1-second latency compensation

# Disable automatic time synchronization
sudo timedatectl set-ntp false

# Fetch GPS time
TIME=$(gpspipe -w -n 10 | grep -m 1 "time" | jq -r '.time')
if [ -n "$TIME" ]; then
    # Add 1 second to the GPS time and convert to format timedatectl expects
    FORMATTED_TIME=$(date -d "$TIME + 1 second" '+%Y-%m-%d %H:%M:%S')
    echo "Setting system time to: $FORMATTED_TIME (GPS time + 1 second)"
    sudo timedatectl set-time "$FORMATTED_TIME"
    echo "Computer time is now in sync with the IC-705 GPS"
else
    echo "No valid GPS time received."
    exit 1
fi

# Re-enable automatic synchronization (optional, remove if not needed)
# sudo timedatectl set-ntp true
```

Once you've got this file saved, you need to make it executable. In terminal type 

```bash
chmod +x IC705TimeSync.sh
```

(Swap the file name with whatever you chose to call the script). This will make it good to go. In terminal you can manually run it with 

```bash
./IC705TimeSync.sh
```

It will ask you for your sudo password. Then it will tell you that the ```Computer time is now in sync with the IC-705 GPS```

**NOTE:**
> Depending on your distro, it might complain if you don't have ```jq``` installed. Just install it with your package manager.

Check everything is working by typing the following in the terminal:

```bash
timedatectl
```

The time displayed will match the GPS time on the IC-705 and also indicate that the ```NTP service is inactive``` which is what we want. 

Congrats! You now have off-grid time syncing from the IC-705 GPS.

### Re-Enabling the Script

If this process gets interrupted - you have to unplug the radio, swap USB ports, power cycle or whatever, just run the following command in the terminal:

```bash
sudo systemctl restart gpsd
```

This will restore the data feed from the radio. Check it with ```cgps``` in the terminal or just re-run the script.

## Re-Enabling Network Time Syncing

When you want to go back to on-grid network time syncing, that command is stashed at the bottom of the script. Just type this into the terminal:

```bash
sudo timedatectl set-ntp true
```

This is handy if you use your digital mode computer for both on and off-grid.

### Hooray!

This is everything you need to get rolling with off-grid time synchronization from the IC-705 on Linux. However, you can follow these additional next few steps if you want to automate this process further. 

![ThumbsUp](/assets/TimeSync/TS11.webp)

## OPTIONAL: Further Automation 

If you operate for a long time off grid, the script isn't designed to repeatedly pull the time from the GPS at set intervals. It's a manual "*run it as needed*" type script. To that end you can simply manually re-run the script every so often or, you can automate it to re-run in the background. This would be helpful for longer sessions or permanent off-grid setups.

**NOTE:**
>**OPTIONAL** - I recommend making a 'Scripts' directory in your home folder. You can add that folder to your Linux PATH to make your scripts executable from anywhere and not have to ```cd``` into that directory to run it. Just add ```export PATH="$HOME/Scripts:$PATH"``` to your shell rc file like ```.bashrc``` or ```.zshrc``` This way you can type IC705TimeSync.sh from anywhere in the terminal and it will run.

### Systemd Service

We will leverage Systemd to repeatedly run the script at a chosen interval. Using your favourite editor, make the service file in ```/etc/systemd/system``` and call it ```ic705-time-sync.service``` You will need sudo privileges.

```bash
sudo nano /etc/systemd/system/ic705-time-sync.service
```

Include the following data in that file:

```bash
[Unit]
Description=Sync system time with IC-705 GPS
After=network.target gpsd.service

[Service]
ExecStart=/path/to/IC705TimeSync.sh
Restart=on-failure

[Install]
WantedBy=multi-user.target
```
**NOTE:**
>You'll want to change line 6 ```/path/to``` directory to the actual location you have your script file. So like ```/home/YourUsername/Scripts/IC705TimeSync.sh```

### Systemd Timer

As for the Service in the previous step, make a Timer file.

```bash 
sudo nano /etc/systemd/system/ic705-time-sync.timer
```

Include the following data in that file:

```bash
[Unit]
Description=Run IC-705 time sync every 5 minutes

[Timer]
OnCalendar=*:0/5
Persistent=true

[Install]
WantedBy=timers.target
```

+ OnCalendar=\*:0/5: This specifies the timer to trigger every 5 minutes. The \*:0/5 means "every hour (*), at minutes divisible by 5 (0, 5, 10, 15, etc.)".

+ Persistent=true: If the system was off when a scheduled run was missed, it will run the service once after booting to catch up.

### Enable and Start the Timer

Reload the ```systemd``` daemon to recognize your new files: 

```bash
sudo systemctl daemon-reload
```

Enable the timer to start on boot:

```bash
sudo systemctl enable ic705-time-sync.timer
```

Start the timer immediately:

```bash
sudo systemctl start ic705-time-sync.timer
```

### Verify it Works

```bash 
systemctl status ic705-time-sync.timer
```

You will see output like this:

```bash
● ic705-time-sync.timer - Run IC-705 time sync every 5 minutes
   Loaded: loaded (/etc/systemd/system/ic705-time-sync.timer; enabled; preset: enabled)
   Active: active (waiting) since Fri 2025-03-28 12:00:00 UTC; 2min ago
   Trigger: Fri 2025-03-28 12:05:00 UTC; 2min 58s left
   Triggers: ● ic705-time-sync.service
```

+ ```Trigger``` shows the next scheduled run (e.g., 12:05:00 if the current time is 12:02:00).

You can list all timers with the following command:

```bash
systemctl list-timers
```

Verify the service logs to ensure it's running:

```bash
journalctl -u ic705-time-sync.service
```

There should be output from the script in the logs every 5 minutes. 

### Adjust Interval

You can change this to suit your needs. If you want a different interval (ex: every 10 minutes), change OnCalendar=\*:0/5 to OnCalendar=\*:0/10.

You can also turn off the timer completely too. Just disable it:

```bash
sudo systemctl disable ic705-time-sync.timer
```

## Summary

This might *seem* like a lot of steps, but once it's all setup, you are golden for off-grid operating with Linux and the IC-705. You can operate digital modes to your heart's content knowing that you have accurate time no matter where you go. 

73 de VE5REV

![TimeSync](/assets/TimeSync/TS12.webp)



