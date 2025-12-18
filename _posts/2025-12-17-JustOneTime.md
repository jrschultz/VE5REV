---
title: Just One Time
date: 2025-12-17 06:00:00 -0600
categories: [hamradio]
tags: [OPSEC, Prepper, Encryption]
---

![JOT](/assets/JustOneTime/JustOneTime-00.webp)

I have always had an interest in Cryptography, ever since reading Simon Singh's [The Code Book](https://www.amazon.ca/Code-Book-Science-Secrecy-Cryptography/dp/0385495323). Truly, it is a fascinating area of study and very necessary for secure communications, should the need arise. Public Key encryption with GPG/PGP is already a great option. But I always come back to the One Time Pad. It's the only uncrackable code, providing you use it correctly (*once*).

For ultimate security, no compromise one-time pads, you should generate the numbers manually by hand with dice in a dark room with no electronic devices around. Or you can use the following script. This will run on any Linux distribution from the terminal. Ideally, you would run this code on an offline, air-gapped computer that has never connected to the internet. 

## The Code

```bash
#!/bin/bash
#
key=$(printf "%05d" $RANDOM)
echo "-----------------------------"
echo "| ONE TIME PAD - KEY: $key |"
echo "-----------------------------"
#
for i in {1..10}; do
    # For the first line, reuse the stored number so it's identical
    if (( i == 1 )); then
        printf "%s %05d %05d %05d %05d\n" "$key" $RANDOM $RANDOM $RANDOM $RANDOM
    else
        printf "%05d %05d %05d %05d %05d\n" $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM
    fi
done
# Without A Repeated Key
#for i in {1..10}; do
#    printf "%s %05d %05d %05d %05d\n" $key $((RANDOM % 100000)) $((RANDOM % 100000)) $((RANDOM % 100000)) $((RANDOM % 100000))
#done
echo
echo ".:EN- | DE+ | TEXT/KEY:."
echo
echo "=========================="
echo "|  CONVERSION TABLE #1   |"
echo "=========================="
echo "A-1   B-70   P-80   FIG-90"
echo "E-2   C-71   Q-81   (.)-91"
echo "I-3   D-72   R-82   (:)-92"
echo "N-4   F-73   S-83   (')-93"
echo "O-5   G-74   U-84   (,)-94"
echo "T-6   H-75   V-85   (+)-95"
echo "      J-76   W-86   (-)-96"
echo "      K-77   X-87   (=)-97"
echo "      L-78   Y-88   (?)-98"
echo "      M-79   Z-89   SPC-99"
echo "=========================="
echo
# Generate Several OTPs at once
#for i in {1..5}; do
#./OTP.sh >> OTPs.txt
# done
```
You can copy & paste this code into a file. Then save it as with a script extension, something like OTP.sh then just make it executable in the shell.

```bash
chmod + x OTP.sh
```

To run the script and generate the pad, you just run the script in the shell.

```bash
./OTP.sh
```

## The Tutorial

Here is how to use the One-Time Pad to encrypt and decrypt a message.

### 1. Run the script to generate a One Time Pad

![JOT](/assets/JustOneTime/JustOneTime-01.webp)

It spits out a 5 digit key and 5 Columns of 5 digit numbers with 10 rows.

![JOT](/assets/JustOneTime/JustOneTime-02.webp)

It also generates the usage hint and a conversion table.

The hint tells you to **EN**crypt you subtract **(-)**. To **DE**crypt, you add **(+)**. And, your **message text** goes over (/) the **key.**

The conversion table allows you to transcode your plain text message into numbers.

### 2. Transcode Your Plain Text Message

+ Using the conversion table, convert your message into numbers.
+ Do not use the key as part of the encryption. Start with the numbers to the right of the key.
+ If you get a negative number in the encryption process, just add 10 to the top number

### 3. Example

#### Plain Text

"Meet me at the old place"

#### Transcoded

| Meet| |me| |at| |the| |old| |place |
|-----|-|--|--|--|-----|-----|-------|
|79226|99|792|99|16|99|6752|99|57872|99|80781712|
|31482|13|100|09|77|70|9318|25|02710|64|10096910|

+ **The One Time Pad Numbers Starting After The Key**

|31482|13|100|09|77|70|9318|25|02710|64|10096910|

#### Encrypted Message (Subtracted)

|48844|86|692|90|49|29|7444|74|55162|35|70795802|

+ **Encrypted Message:** 4884486692904929744474551623570795802

+ You can present the encrypted text in groups of 5 to make it easier to work with.

**48844 86692 90492 97444 74551 62357 07958 02**

#### Decrypt the Cipher Text

To Decrypt, you just do the process in reverse, adding the numbers from the One Time Pad.

48844 86692 90492 97444 74551 62357 07958 02

31482 13100 09777 09318 25027 10641 00969 10

79226 99792 99169 96752 99578 72998 07817 12

|79|2|2|6|99|79|2|99|1|6|99|6|75|2|99|5|78|72|99|80|78|1|71|2|
|M|E|E|T|   |M|E|   |A|T|  |T|H|E|   |O|L|D|    |P |L |A|C |E|

**"Meet me at the old place"**

## Generate a Few at a Time

Tucked at the bottom of the main script is some code to generate 5 of these at one time and append them to a text file. This is good for generating a few Pads at once that could be easily shared among Mutual Assistance Group and such.

```bash
#Generate Several OTPs at once
for i in {1..5}; do
./OTP.sh >> OTPs.txt
done
```

73 de VE5REV



