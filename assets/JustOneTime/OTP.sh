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

