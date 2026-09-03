#!/bin/sh
########################################################################################
#    Linux installation script of the MCD kernel tgz
########################################################################################

SRCDIR=${PWD}
TGZ=$( basename $0 | sed s/.install.sh/.tgz/ )
echo "$(basename $0): tgz=${TGZ}"

if [ "$(id -u -n)" != "root" ]
then
    echo "The installation of the MCD kernel must be done as user root!"
    echo "Running $0 as root now ..."
    su -c "$0"
    exit 1
fi 

# check whether the tgz file exists
if [ ! -f ${TGZ} ]
then
    echo "File ${TGZ} missing in current directory!"
    exit 1
fi

# untar the mcd binaries
tar -C / -xzvf ${TGZ}

if [ 0 != $? ]
then
    echo "Failed to extract archive ${TGZ}"
    exit 1
fi

# call ldconfig for adjusting library path 
ldconfig

echo "Please reboot and ensure VW_MCD_HOME=${VW_MCD_HOME} and VW_MCD_CONFIG=${VW_MCD_CONFIG} are correctly set before using MCD."
echo "Thanks for the installation of MCD!"


########################################################################################
#      END  OF  FILE
########################################################################################
