#!/usr/bin/env bash
# Simple script to backup any dvd to an ISO encrypted not
# Requires css-auth (https://www.cs.cmu.edu/~dst/DeCSS/)
# (c) BillyRayValentine 
DVD_DRIVE=/dev/cdrom
INSTALL_PATH=/usr/local/bin

usage() {
    echo "dvdbackeruper.sh <isoname.iso> [dvd device (default=/dev/cdrom)]"
}

if [[ $# -lt 1 ]]; then
    usage
    exit 1
fi

if [[ $# -eq 2 ]]; then
    DVD_DRIVE=$2
fi

# Internal globals
_DVD_ENCRYPTED=nothing

dvd_encrypted() {
# Determine if the DVD is encrypted by seeing if dvdinfo returns CPST=1

    # Always reset the drive
    ${INSTALL_PATH}/reset ${DVD_DRIVE}
    if [[ $? -ne 0 ]]; then
        echo "reset failed"
        exit 1;
    fi

    ${INSTALL_PATH}/dvdinfo ${DVD_DRIVE} | grep -q 'Copyright: CPST=1'
    
    # Catch the return codes of the pipe
    RC=("${PIPESTATUS[@]}")
    #echo ${RC[@]}
    # if dvdinfo fails exit now
    if [[ ${RC[0]} -ne 0 ]]; then
        echo "dvdinfo failed"
        exit 1;
    fi

    # set the return code from grep
    if [[ ${RC[1]} -eq 0 ]]; then
        _DVD_ENCRYPTED=1
    else
        _DVD_ENCRYPTED=0
   fi
}

unlock_drive() {
    ${INSTALL_PATH}/tstdvd ${DVD_DRIVE}
    if [[ $? -ne 0 ]]; then
        echo "unlock dvd drive failed"
        exit 1;
    fi
}

# do it
dvd_encrypted

if [[ _DVD_ENCRYPTED -eq 1 ]]; then
    echo "DVD is encrypted"
    echo "Unlocking drive"
    unlock_drive
    echo "done"
else
    echo "DVD is not encrypted"
fi

echo "Running dd"
# All should be well. Run dd
dd if=${DVD_DRIVE} of=$1 bs=2048 status=progress
