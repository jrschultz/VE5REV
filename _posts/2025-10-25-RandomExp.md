---
title: Random UnUn Experiments
date: 2025-10-25 06:00:00 -0600
categories: [hamradio]
tags: [Baluns, Chokes, Dipole, Antennas]
---

+ Field Notes on Experiments with 9:1 UnUn configurations.

+ The goal is to get as many bands as possible closest to 3:1 SWR to be tunable with an internal rig tuner.


## Type 43 Cores

**Notes:**

+ 17' of counterpoise wire was deployed in all of these readings.

+ "Hybrid" - 9 Trifilar Turns. Size: 1.4” (35.55mm) OD. Core: 5943002701. Choke - Size: 1.142” (29.01mm)OD. Core: 2631801202 

![Hybrid](/assets/RandomExp/Hybrid.webp)

+ "Fatty" - 6 Trifilar Turns. Size: 1.540” Dia (39.12mm) OD. Core: 2643251002

![Fatty](/assets/RandomExp/Fatty.webp)


### 29' Vertical

![29](/assets/RandomExp/29_RAND_FATTY.webp)

![29](/assets/RandomExp/29_RAND-HYBRID.webp)

-----

### 41' Inverted V

![41](/assets/RandomExp/41_RAND-FATTY.webp)

![41](/assets/RandomExp/41_RAND_HYBRID.webp)

-----

### 71' Inverted V

![71](/assets/RandomExp/71_RAND_FATTY.webp)

![71](/assets/RandomExp/71_RAND-HYBRID.webp)

**Analysis:**

+ This is not an apples to apples comparison. The Hybrid has the advantage of coax isolation. The Fatty is using the coax and the counterpoise together. A 1:1 choke should have been installed beside the Fatty UnUn for parity.

+ Dispite the disadvantage, the Fatty actually came out on top for lower SWR values, though it's a rather mixed bag. 

+ Neither of these designs was able to reach the 3:1 goal. A dedicated 10:1 tuner would still be required for either design to work all the bands.

![Values](/assets/RandomExp/Table.webp)

-----

## Type 61 Cores

**Notes:**

### FT140-61

+ "Type 61" - 9 Trifilar Turns. Size: 1.400” (35.56mm) OD. Core: 5961002701

+ Counterpoise wire was ~50' 18AWG wire. It was grounded to the tower and left separate (not grounded) for these readings.

![Type61](/assets/RandomExp/Type61.webp)

![148](/assets/RandomExp/DAVE_T61_RAND.webp)

![148](/assets/RandomExp/DAVE_T61_RAND_NOGR.webp)

**Analysis:**

+ The non-grounded deployment did substantially better. The only bands the internal rig tuner on the IC-7300 couldn't tune were 160M (9:1 {not shown}) and 30M (4.3:1). 

+ I would like to try the Type 43 core with the 148' wire length for a further comparison.

-----

### FT240-61 

**Notes:**

+ "Type 61" - 9 Trifilar Turns. Size: 2.401” (61mm) OD. Core: 5961003801

+ Wire: 14AWG Solid Copper

![240](/assets/RandomExp/FT24061.webp)

It's fascinating to see how the core size doesn't really change the response to the 450Ω load.

![240](/assets/RandomExp/FT240-61-450.webp)

![140](/assets/RandomExp/FT140-61-450.webp)

73 de VE5REV



