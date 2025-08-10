---
title: Delta Loop
date: 2025-04-22 06:00:00 -0600
categories: [hamradio,antennas]
tags: [Delta, Loop]
---

Loop antennas are lot of fun to play around with and have lots of advantages for Ham Radio. I made a 20M Delta Loop a couple of years ago. Recently, I built a new 4:1 hybrid balun for it.

**UPDATE:** Since this post I have moved to using a 2:1 balun and it's better. See [the updated post here](https://jrschultz.github.io/VE5REV/posts/DLoopRevisited/).

![Delta](./assets/DeltaLoop/DeltaLoop.webp)

## Advantages

When I first built this and set it up, what struck me right away was how nice and quiet this antenna is compared to my QTH Random Wire. It's a quiet antenna, giving it huge advantage in a noisy, urban environment. It also offers Polarization Flexibility. A Delta Loop can be configured for horizontal, vertical, or mixed polarization by adjusting feed point and orientation, offering versatility for different propagation conditions. When vertically oriented, Delta Loops produce a lower angle of radiation, which is beneficial for long-distance (DX) communication. They also generally have a broader bandwidth than dipoles, allowing effective operation over a wider frequency range.

For negatives, they are also honkin' big and kind of a pain to deploy. You need lots of space to accommodate the full wave wire length. And, depending on how you feed them, they will require some impedance matching. I've heard 2:1 or 4:1 ratios being the most common. But you can adjust this if you *squish* the antenna. The more elongated you make the antenna the closer it gets to ~200 ohms of impedance. There is already [a great article on Delta Loop Theory](https://practicalantennas.com/theory/loop/full-wave/) by Dale, WB6BYU that you should check out.

## Hybrid Balun

I made a cutting board test setup and it's rather ugly. But it works! The transformer core is a Type 61 {Size: 1.400” (35.56mm) OD. Core: 5961002701} with 8 bifiliar turns of wire. The choke is 12 turns of RG-316 coax on a Type 31 {Size: 1.142” (29.01mm)OD. Core: 2631801202}. This is the same hybrid balun used in the [OCFD](https://jrschultz.github.io/VE5REV/posts/ROCFD-Consolidated/). 

![Diagram](./assets/ROCFDCon/ROCFD2-Diagram.webp)

![Balun](./assets/DeltaLoop/DeltaLoop-Balun.webp)

## The Setup

As I mentioned already, the setup is kind of a pain. I used the DX Commander expedition mast for the apex mount. This requires some guying to keep the mast up. I manufactured a guying disk from plastic puck board that slips over the mast from the top. It gives tying points for paracord down to ground stakes. I use a simple [taught-line hitch](https://youtu.be/69wcDwD6gNU?si=a84ReL61fiqjMfko) for tension. I also used 2 plastic electric fence posts to hold out the corners of the antenna. It's quite stable with the little bit of guying. I laid the whole thing out on the grass first to get the apex height set correctly with the electric fence posts. Then I stood up the posts and then the mast. 

![Setup](./assets/DeltaLoop/DeltaLoop01.webp)

![Setup](./assets/DeltaLoop/DeltaLoop02.webp)

## Field Test Results

The NanoVNA sweeps are reasonable, but I think there's too much impedance transformation. It's roughly 30 ohms. So I could probably squish the antenna and deploy it in a bit wider shape. I will have to try this next time round. The 10M harmonic also cooperated with this loop deployment.

![SWR](./assets/DeltaLoop/DELTA-SWR.webp)

![Smith](./assets/DeltaLoop/DELTA-SMITH.webp)

![R](./assets/DeltaLoop/DELTA-R.webp)

There was a minor solar storm going on during the setup so I didn't really bother trying to make any contacts. I listened for a few POTA CW stations but conditions were rather abysmal. I am curious about trying this with a 2:1 balun to see if that might be a better match too. 

![Setup](./assets/DeltaLoop/DeltaLoop03.webp)

73 de VE5REV



