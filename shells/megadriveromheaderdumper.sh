#!/bin/sh
# Dump the rom header from a Sega MegaDrive rom file
# (c) Ben Sampson / github.com/billyrayvalentine
# sad mix of od and hexdump here. Hexdump will only not
# convert numbers to little-endian if a single byte is processed at a time
# which has been shown here for the checksum but i turned to od for the rest 
# where hex is required.
# All in just 27 commands! (-_Q)
#
# Example
# 
# ./megadriveromheaderdumper.sh xenocrisis_gold_v1_0_0.bin
# 
# SEGA MEGA DRIVE 
# (C)BMAP 2019.OCT
# XENO CRISIS                                     
# XENO CRISIS                                     
# GM BMAP-001-00
# 5E6A
# J64             
# 00000000
# 003fffff
# 00ff0000
# 00ffffff
#   
# 2020
# 20202020
# 20202020
#             
#                                         
# JUE
             
usage() {
    echo "megadriveromheaderdumper.sh  <FILENAME>";
}

if [[ $# -lt 1 ]]; then
    usage
    exit 1
fi

hexdump "$1" -s 0x100 -n16 -e '16 "%_p""\n"'  # System Name (ASCII)
hexdump "$1" -s 0x110 -n16 -e '16 "%_p""\n"'  # Copyright (ASCII)
hexdump "$1" -s 0x120 -n48 -e '48 "%_p""\n"'  # Domestic Title Name (ASCII)
hexdump "$1" -s 0x150 -n48 -e '48 "%_p""\n"'  # Overseas Title Name (ASCII)
hexdump "$1" -s 0x180 -n14 -e '14 "%_p""\n"'  # Serial (ASCII) 
hexdump "$1" -s 0x18E -n1  -e '1  "%X"'       # Checksum byte1 (HEX)
hexdump "$1" -s 0x18F -n1  -e '1  "%X\n"'     # Checksum byte2 (HEX)
hexdump "$1" -s 0x190 -n16 -e '16 "%_p""\n"'  # Device support (ASCII)

od "$1" -j 0x1A0 -N4 -An --endian=big -tx | sed "s/^ //" # ROM Address range start (HEX)
od "$1" -j 0x1A4 -N4 -An --endian=big -tx | sed "s/^ //" # ROM Address range end (HEX)
od "$1" -j 0x1A8 -N4 -An --endian=big -tx | sed "s/^ //" # RAM Address range start (HEX)
od "$1" -j 0x1AC -N4 -An --endian=big -tx | sed "s/^ //" # RAM Address range end (HEX) 

hexdump "$1" -s 0x1B0 -n2 -e '2 "%_p""\n"'  # External / Backup RAM "RA" for yes "  " for no (ASCII)

od "$1" -j 0x1B2 -N2 -An --endian=big -tx2 | sed "s/^ //" # Backup RAM type (HEX)
od "$1" -j 0x1B4 -N4 -An --endian=big -tx  | sed "s/^ //" # Backup RAM start address (HEX)
od "$1" -j 0x1B6 -N4 -An --endian=big -tx  | sed "s/^ //" # Backup RAM end address (HEX)

hexdump "$1" -s 0x1BC -n12 -e '12 "%_p""\n"' # Modem Support (ASCII)
hexdump "$1" -s 0x1C8 -n40 -e '40 "%_p""\n"' # Memo          (ASCII)
hexdump "$1" -s 0x1F0 -n3  -e '3  "%_p""\n"' # Region        (ASCII)
hexdump "$1" -s 0x1F3 -n13 -e '13 "%_p""\n"' # End of rom    (ASCII)
