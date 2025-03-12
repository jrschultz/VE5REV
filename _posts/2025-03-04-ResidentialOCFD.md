---
title: Residential Off-Center Fed Dipole
date: 2025-03-04 07:00:00 -0600
categories: [hamradio,antennas]
tags: [Residential,OCFD,Dipole]
---

A truly awesome QTH or portable antenna is the Off-Center Fed Dipole. These and variants have been long used by hams to get on the air with added gain. A true multi-band antenna you get 40M, 20M, 15M and 10M with only slight tuner touch ups. I used it for every band with a beefier tuner, but 40M-6M is most realistic with any kind of decent performance. There are 80M variants but this focus is the "residential" variety - meaning it can fit into many residential lots.

![ROCFD](./assets/ROCFD/ROCFD01.webp)

### Introduction

_**As with everything on this site, the following notes are from first hand research and testing.**_

I found out about this antenna originally on [YouTube](https://youtu.be/pwA1aPJcNKg?si=JAaBj4aKo-Yt1956). Then I came across this awesome presentation from Ted W3TB. I emailed him and he sent me a [link to a .PDF file](https://github.com/jrschultz/VE5REV/blob/main/assets/ROCFD/ResidentialOCFD.pdf) by Dick K5QY that is mentioned in the video. It was originally published in November 2018 in the now offline CQ magazine. It has great specs and modelling for the various bands.

![YouTube](./assets/ROCFD/OCFDYT.webp)

### The Wire

What makes this "residential" is the shorter overall length. It's not the usual 1/3 2/3 split of typical OCFD antennas. This one uses 41' and 27' sections. I used 18AWG speaker wire. In a dipole, the current is highest at the center and tapers to zero at the ends, while voltage is highest at the ends and lowest at the center. The feed point is offset in an OCFD, so the short leg has a higher voltage-to-current ratio compared to the long leg. Connecting the coax center (the driven signal) to the short leg ensures that the phase and amplitude of the RF energy align with the natural standing wave pattern of the antenna. If you reversed it—connecting the shield to the short leg and the center to the long leg—it could disrupt the balance, increase common-mode currents on the coax shield, and degrade performance. Hence, **my understanding is the short wire should be connected to the coax center and the long wire should be connected to the coax shield.**

### The Balun

It is key to use a 4:1 *Current Balun* for this build and *not* a Voltage UnUn. Many commercially available 4:1 transformers are voltage varieties (like the grey and green ones from LDG). You can easily homebrew your own as it's simply two 1:1 current baluns back to back. I used enamel wire on the 2643251002 Type 43 core. I used these cores because I had them in stock. They are chunkier than the 2.4" size cores but they are stellar performers. I would use Type 43 instead of Type 31 for this build whatever size cores you pick.

![Balun](./assets/ROCFD/ROCFD02.webp)

As for the wiring connections, I have this highly sophisticated and technical wiring diagram for you LOL. I used markers to help keep the connections straight. If you had different colored teflon wire, it would be 17% nicer. This same balun could be used for a Delta Loop antenna. 

![Balun](./assets/ROCFD/ROCFD03.webp)

### The Housing

In my build, I housed the transformer assembly in a waterproof exterior electrical box. These are really expensive and if I was to do it again, I would look at finding a cheaper alternative gasketed project box on Amazon or someplace. But it was available and it's pretty robust. It would be best suited for a QTH install rather than portable. If you used these chunky cores, it could easily be built into PVC pipe for portable. I think it's wise to consider the thermal implications of tight builds. Having space to dissipate heat is probably not a bad thing. I used all stainless steel hardware. But you could use binding posts instead of wing nuts. 

![Balun](./assets/ROCFD/ROCFD04.webp)

### Choke

This build probably should have had another 1:1 installed at the feed point to help keep the coax from stealing current from the radiating pattern. I might still add at Type 31 choke first at the SO-239 before the 4:1.

#### Testing

Attaching 200 ohms worth of resistors across the antenna connections showed really good SWR readings under 2:1 on 40m, 20m and 15m. It was slightly over 2:1 on 10m. None of these would be a problem for a rig's internal tuner to clean up or just use as is. When I did a 20M WSPR test, it showed really good patterning. I had the long leg pointing south and the short leg pointing north and I think that gain is illustrated in the WSPR pattern and seems to match the modelling in the .PDF article. 

![Balun](./assets/ROCFD/ROCFD05.webp)

73 de VE5REV

![TheEnd](./assets/ROCFD/ROCFD06.webp)
