#!/bin/bash

# To prepare the KP data, we need to generage the payload from the
# logs files, the payload from the new files and the size of all files
# (both from the MirrorBrain database).

# Generate the payload form remote logs using the last 40 days
./payload.sh 40

# Get the sizes of all files, and consider new files all that are 7 or
# less days old
./disk_size.sh 7

# Mergue the payloads
PREFIX=/mounts/users-space/aplanas/knapsack
python merge_payload.py $PREFIX/payload.txt payload_new.txt > payload_final.txt
