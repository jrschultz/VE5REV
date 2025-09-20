---
title: Residential Off-Center Fed Dipole
date: 2025-09-08 06:00:00 -0600
categories: [hamradio,antennas]
tags: [OCFD, Antennas]
---

A truly awesome QTH or portable antenna is the Off-Center Fed Dipole. These and variants have been long used by hams to get on the air with added gain. A true multi-band antenna you get 40M, 20M, 15M and 10M with only slight tuner touch ups. I used it for every band with a beefier tuner, but 40M-6M is most realistic with any kind of decent performance. There are 80M variants but this focus is the **"residential"** variety - meaning it can fit into many residential lots.

![ROCFD](./assets/ROCFDCon/ROCFD01.webp)

## Introduction

I found out about this antenna originally on [YouTube](https://youtu.be/pwA1aPJcNKg?si=JAaBj4aKo-Yt1956). Then I came across this awesome presentation from Ted W3TB. I emailed him and he sent me a [link to a .PDF file](https://github.com/jrschultz/VE5REV/blob/main/assets/ROCFDCon/ResidentialOCFD.pdf) by Dick K5QY that is mentioned in the video. It was originally published in November 2018 in the now offline 'CQ Magazine'. It has great specs and modelling for the various bands.

![YouTube](./assets/ROCFDCon/OCFDYT.webp)

-----

## The Build

### Wire

What makes this "residential" is the shorter overall length. Also, it's not the usual 1/3 2/3 split of typical OCFD antennas. This one uses 41' and 27' sections or a 60/40 split. In discussion with Rick, DJ0IP, he recommends a 59.7/40.3 split. This is a minor tweak to the overall design of this antenna as specked in the PDF file. I used 18AWG speaker wire for the elements.

### Hybrid Balun Design

This is where I went down an incredibly long rabbit hole. The PDF file kind of skims over this, but Off Center Fed Dipoles almost always involve a lot of common mode current. There is massive debate about what balun you are supposed to use. Current? Voltage? Hybrid? And the long story short is this: if you aren't going to use a hybrid balun, use a 4:1 current balun and a 1:1 choke on both ends of your coax feed line. But the general recommendation now is to build **a hybrid balun**. This consists of a 4:1 voltage (Ruthroff) transformer and a 1:1 current choke. It saves cost, size and weight over a current balun because you only need potentially two cores instead of three. 

![YouTube](./assets/ROCFDCon/ROCFD2-Diagram.webp)

You can also use 16 twisted pair turns for the voltage transformer if you are using the balun with 80M. But for 40M and up, 8 turns as illustrated here will work fine. For the 1:1 choke, using coax is **highly recommended**. 

Check out [The Hitchhiker's Guide to OCFD](https://www.dj0ip.com/hhg2-ocfd). Rick, DJ0IP has got YouTube videos, PDF downloads and everything there. This is not some keyboard experts in a Facebook forum! This is all compiled, first hand field research. It doesn't get any better than this as a resource. 

### The Cores

For 100 watts SSB, the recommended core for the transformer is the Type 61 5961002701 1.400” (35.56mm) Outside Diameter. For the choke, the recommended core is the Type 43 5943002701 1.4” (35.55mm) OD. The Type 61 has got better thermals than Type 43 and will hold up better for demanding digital modes and CW. Shown here are 8 bifiliar turns of 18g solid core wire for the transformer and the choke with 12 turns of RG-316 coax.

![HybridBalun](./assets/ROCFDCon/ROCFD03.webp)

### The Housing

I used an gasket-sealed, exterior electrical box which is really robust. It's also really heavy. I would recommend this for a QTH installation for sure. For a mobile build, you could probably get by with zip-tying the cores to a light piece of cutting board or plexiglass instead which would make it significantly lighter.

-----

## Testing

### NanoVNA

On the bench, I tested the balun with a 200Ω resistor load. It's pretty good, but could use some additional work to tighten up the transformation. We're looking for a flat 50Ω response if our transformer is working correctly.

![NanoVNA](./assets/ROCFDCon/ROCFD07.webp)

### Field Deployment

Like all dipoles, setting up this antenna for portable work is kind of a pain. You need to have trees in the exact right place and direction which can be challenging. The feed point center is kind of heavy so it might be difficult to deploy this on lighter masts.  Fortunately, I found some trees in the right places. To deploy this, I laid the antenna out on the ground and then throw my paracord ropes into the trees for the middle and on both ends for support. I attach the coax and then raise the center first and then the antenna elements. 

![Deployment](./assets/ROCFDCon/ROCFD05.webp)

The sweep from this deployment was OK. The dips were in the right places but they could have been a bit better. I think this had to do with the less than optimal deployment height. However, an internal rig tuner could have cleaned these up no problems as it was only 2.5:1 at its worst on 40M. Wire length could also be trimmed a bit to help tighten up the resonance. 

![NanoVNA](./assets/ROCFDCon/ROCFD06.webp)

### WSPR

I ran my standard 20 minute, 1 Watt test. The pattern looks very good broadside the antenna as you would expect. I had no issues with the IC-705 locking up from CMI and I didn't use an additional 1:1 at the rig (which is highly advised). The IC-705 is a fussy beast and it performed with no issues with this setup which is very promising.

![NanoVNA](./assets/ROCFDCon/ROCFD04-WSPR.webp)

I got 260 contacts on the 20M band. 

**SNR:** Max: +04 Min: -31 Avg: -17

**Distance:** Max: 2871 Min: 1089 Avg: 1812

### Summary

OCFD dipoles are awesome antennas. They are stellar multi-band performers. Deploying them for portable operations is a bit of a pain as you need 3 tether points. It’s definitely not a quick setup process. However, as a QTH antenna or a camping setup where you are going to be in a place for a few days, it’s a more than solid option. Resonance without a tuner may be a bit tricky depending on deployment height, but with a tuner you’re golden. The setup convenience of an EFHW for portable work gets my vote though. You only need 1 deployment rope instead of 3. Both of these antennas are comparable gain-wise, 2-3dBi on fundamentals and then 5-6dBi on the higher bands in peak directions. But the OCFD may have more directivity which may be an advantage for working a specific direction.

73 de VE5REV



