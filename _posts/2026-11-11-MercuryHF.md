---
title: MercuryHF Modem
date: 2026-11-18 06:00:00 -0600
categories: [ham radio,digital]
tags: [Digital,winlink,mercury]
---

![MercuryHF](/assets/mercury/mercury-00.webp)

There's another exciting software modem project called **Mercury**. From their [website](https://mercury.hermes.radio/#get-started):

> Mercury is a fully open-source HF modem — built for emergency communications, remote communities, and amateur radio operators. Developed by Rhizomatica as part of the HERMES Project.

This project comes to us from the non-profit world, with communication as a human right. So this modem is actually a public-good infrastructure piece. It checks all the boxes of the free and open-source world which is totally awesome and it runs on Linux, Windows, Mac, iOS & Sailfish OS! This is already a zillion times more _gemütlich_ than VARA. 

Here's how to get MercuryHF installed on [Linux Mint](https://linuxmint.com/download.php). Reference radio is the Icom IC-705.

## 👣 INITIAL STEPS

It's best practice to always do these two steps first:

### 🔄 Update the System

```bash
sudo apt update && sudo apt upgrade -y
```

-----

## 🌡️ INSTALLATION

You can install a command line setup (like a Chad) and also a GUI program (17% more complicated).

⚠️ **NOTE:** I was able to assemble the GUI and it was functional, but I didn't have much luck with it cooperating with ```hamlib``` and ```pat```. 

The Mercury documentation is extensive and complicated! [xara](https://jrschultz.github.io/VE5REV/posts/Xara/) had it beat for simplicity of install/config! 

🔹Introductory [ReadMe](https://github.com/Rhizomatica/mercury/tree/mercuryv2)

🔹Full [Documentation](https://github.com/Rhizomatica/mercury/blob/mercuryv2/docs/README.md) 

## 😎 COMMAND LINE CHAD VERSION:

### 📥 Install Mercury Dependencies

```bash
sudo apt-get update && sudo apt-get install build-essential pkg-config libasound2-dev libpulse-dev libhamlib-dev make git
```

### ⚒️ Clone & Build

We are going to use ```git``` to clone the software repository to your computer. I like to make an ```/Apps``` directory for this in my home folder, but you don't have to. It just helps keep things a little neater in the home folder.

```bash
git clone https://github.com/Rhizomatica/mercury.git
cd mercury && make
sudo make install
```

This will build the software and get everything ready.

-----

## 👀 GUI VERSION

Mercury offers 3 GUIs:

🔹A [web interface](https://rhizomatica.github.io/mercury/app/)

🔹A [qt client](https://github.com/Rhizomatica/mercury-qt) 

🔹A binary you have to build

⚠️ **NOTE:** <rant>The Mercury project needs to offer a pre-built binary in an app-image or a flatpak or something. It's a bit cumbersome to install the GUI.</rant> 

⚠️ **NOTE:** To build the GUI on Linux, it requires the ```Go``` language as a dependency. 

### 1️⃣ Install the GUI build dependencies:

```bash
sudo apt update
sudo apt install build-essential pkg-config make git \
    golang-go pkg-config libhamlib-dev libpulse-dev libasound2-dev \
    libssl-dev libhidapi-dev libgl1-mesa-dev libegl1-mesa-dev \
    xorg-dev libwayland-dev libxkbcommon-dev
```

### 2️⃣ Clone the repository and switch to the mercuryv2 branch 

```bash
git clone https://github.com/Rhizomatica/mercury.git
cd mercury
git checkout mercuryv2
```

### 3️⃣ Build the GUI

```bash
make fyne-ui
```

### 4️⃣ Run it 

```bash
./mercury-ui
```

-----

## ⚙️ COMMANDLINE CHAD CONFIGURATION

Mercury is configured using an ```ini``` file. They provide you with an example file which is quite nice. We simply copy it and edit it. I like keeping the config file in the ```~/.config/mercury``` directory as suggested:

```bash
mkdir -p ~/.config/mercury
cp /usr/share/doc/mercury/mercury.ini.example ~/.config/mercury/mercury.ini
```

### ⚙️ The Edited ini File:

The default example ```ini``` file has a lot of options. This is my pared-down file:

```bash
[main]
ui_enabled = false
ui_port = 10000
ui_protocol = wss
ui_tls_cert = /etc/ssl/certs/hermes.radio.crt
ui_tls_key = /etc/ssl/private/hermes.radio.key
waterfall_enabled = true
input_device = "plughw:1,0"
output_device = "plughw:1,0"
capture_channel = left
sound_system = alsa
arq_tcp_base_port = 8300
broadcast_tcp_port = 8100
callsign = "VE5REV"
verbose = false
trace = false
log_utc = false
log_max_mb = 20
freedv_verbosity = 0

[ptt]
method = hamlib
device = 127.0.0.1:4532
hamlib_model = 2
hamlib_serial_speed = 38400
hamlib_conf = ""
hamlib_log_level = 0

[arq]
disconnect_drain_timeout_s = 30
retry_stagger_ms = 2000
silence_fallback_s = 150
call_max_s = 300
mfsk_tx_only = false
max_keydown_s = 0

[channel]
busy_detect = false
busy_threshold_db = 10
busy_hysteresis_db = 3
busy_on_debounce_ms = 300
busy_hang_ms = 1500
busy_reseed_on_hop = false

[audio]
tx_gain_db = 0.50
tx_delay_ms = 10

[tnc]
keepalive_s = 60
buffer_report_ms = 1000

[store]
enabled = true
path = ""
max_messages = 500

```

### 🛠️ Changes you need to make:

Besides the obvious ```callsign``` change, you need to configure your audio in and out.

In the ```[main]``` section:
 
```
input_device = "plughw:1,0"
output_device = "plughw:1,0"
callsign = "VE5REV"
```

Mercury conveniently gives you a terminal command for finding your sound cards. With your radio connected and turned on run:

```bash
mercury -z # List available sound cards
```

In the ```ptt``` section, I'm using ```hamlib``` with settings for the reference IC-705:

```bash
[ptt]
device = "/dev/ttyACM0"
hamlib_model = 3085
hamlib_serial_speed = 38400
```

## ⚙️ GUI CONFIGURATION: 

You just configure everything in the app under the settings menu! Wee! 

## MORE RESOURCES

▶️ TheTechPrepper [Mercury HF: What Works, What Doesn’t, and Where It Fits](https://youtu.be/4LaFSDcLHus)

▶️ OH8STN [The End of VARA HF? Why I’m Backing Mercury](https://youtu.be/PGqiw7TvR9Q)

73 de VE5REV



