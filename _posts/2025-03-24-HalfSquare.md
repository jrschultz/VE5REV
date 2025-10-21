---
title: Half-Square Antenna
date: 2025-03-24 06:00:00 -0600
categories: [hamradio,antennas]
tags: [HalfSquare, DX, Antennas]
---

The Half-Square Antenna. It's literally half-a-square. Or a square with 3 sides. This antenna has long been heralded as a DX machine. Is it any good??

![Diagram](/assets/HalfSquare/HSD.webp)

### Concept
This wire antenna has got two quarter wave verticals and a half wave length across the top. The two verticals hang down to form both sides. Properly speaking, this antenna *should be* fed in a top corner where it has a 50 ohm impedance. However, that is a total pain to actually do. Your coax has to come straight out from that top corner to not mess with the hanging vertical. It could be done if you were going to set this up as a QTH antenna. But for portable, forget about it. Instead, you can feed it from the bottom of one of the verticals with an EFHW transformer. Whether or not this hack affects the properties of this antenna, I'm not sure. To this point, I'm not really certain this is actually any different than any other EFHW deployed in the same shape. For roughly the same amount of wire you can have a 40M EFHW and the resulting harmonics. So the jury is still out on that. Callum over at [DX Commander](https://youtu.be/llEV35ZZvKQ?si=zpbmjTlZS4ftfco1) has a really good video about this antenna.

### Build Notes

I calculated a full wave length for 20M and then adjusted it for velocity factor and cut the wire to this overall length. To make the verticals, I measured 5.13m (16'8) and bent the wire making a small loop, securing it with a ziptie. I added another different coloured ziptie on just the radial portion as a visual aid to see the vertical. The top then stretched over 10.26m (33'7). Then I bent the wire again and installed another ziptie for the final vertical. The loops are how you hang it. I used 18AWG stranded speaker wire that I got at RONA.

![Zipee](/assets/HalfSquare/HS01.webp)

### The Deployment

Setup wise, it's pretty easy. I found some trees that were about the right distance apart. I flung two 50' paracords over nearby limbs. This antenna needs to only be around 17-18' up in the air so the radials are almost touching the ground. Or in my case, the EFHW transformer was on the ground the the vertical wire was fed from that point. I pulled the wire up and tied off the paracord on each side. You can barely see the wire in this photo but trust me, it's there. The wire ran East/West.

![Deployed](/assets/HalfSquare/HS02.webp)

### The Transformer

I used my DIY 56:1 EFHW 1:1 Combo UnUn that I made. For monoband antennas, I have great results with the 56:1. I set this one up to use the Wago Lever Nuts. That way I can trim the wire and connect it up easily when testing. Once you get the antenna tuned to length, you can add ring connectors or whatever you choose. This one is also configured for a counterpoise wire. Generally you want .05 wavelength for that counterpoise piece. In this case, it's about 1m. I ran 50' of coax back to the rig and had another 1:1 choke there to completely isolate the coax and kill all noise.

![UnUn](/assets/HalfSquare/HS03.webp)

### NanoVNA

In a striking turn of events, I hooked up the NanoVNA and this was the result! I couldn't believe it. Zero trimming. Zero adjustments. Smith Chart said it was 49.66+j11.65Ω. So I would say it's *rather* efficient. As there was no adjustments needed, I setup WSRP and let it run.

![NanoVNA](/assets/HalfSquare/20M_HSQR_56_1_50CX.webp)


### WSPR Results

Because everything went super well with the deployment, I knew I would have problems somewhere else. And, I had a snafu with WSPR. I started the test and forgot to knock my power down to 1 watt. It went out at 5 watts for 10 minutes until I realized my screw up. I restarted the test, changing my call sign to VE5REV/P in the WSJT-X software. The hang up was that [wspr.rocks](https://wspr.rocks/), for whatever reason, couldn't pull my call sign with the stroke portable. So I don't have proper SNR data to share. 

![NanoVNA](/assets/HalfSquare/HS05.webp)

[WSPRnet](https://www.wsprnet.org/) was able to load the map data from that call sign though, so it wasn't a total bust. It looks like a nice, even pattern. Because the wire was deployed East/West, there might be some noticable nulls off the ends. I have no stations reporting from Eastern Canada and New England which might indicate this is the case.

![WSPR](/assets/HalfSquare/HalfSquareWSPRb.webp)

The distance data was goofed up too. There was a crazy anomalous station that picked me up near Antarctica showing up with call sign 101AGL. I couldn't find any information about this station when I looked it up. It was reportedly 14,103km away! Probably just a glitch.

### SSB Contacts

I only had a few minutes to do some POTA hunting. I brought my external battery and tried with 10 watts. I nabbed 1 2fer POTA contact from Arkansas and they gave me a 53 report. But that was it. There were pileups a mile long pretty much everywhere I called so I had a hard time breaking in with 10 watts. It might have just been conditions but it seems I had far more success with the [VP2E](https://jrschultz.github.io/VE5REV/posts/VP2E/) antenna that I deployed in the same direction only using 5 watts SSB.

### In Conclusion

This antenna is a pretty easy build. It's got pretty simple deployment. Trees are your friends but you could also use telescoping masts. Performance wise it seems to be getting out OK. And I can't complain about the out-of-the-box SWR one iota. It was a very quiet antenna too. I will have to do some repeat WSPR testing to get a proper SNR idea. But in the back of my mind, I'm thinking this is just like any other EFHW setup. It's literally an EFHW for the 40M band. If you fed it with a 49:1 you'd probably get nice harmonics and such. It would be cool to try it with the top corner feed but that seems like too much of a hassle for portable setups to me. But as QTH antenna you'd probably have a good time with the half-square. It's not an overly long footprint for most residential lots so it might just be a winner winner chicken dinner! 

73 de VE5REV

![TheEnd](/assets/HalfSquare/HS06.webp)
