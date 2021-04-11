#!/bin/bash

#this is the script to run Busco on your transcriptome files

#let's load the module

source /opt/asn/etc/asn-bash-profiles-special/modules.sh
module load busco/4.1.2

#need to add these lines. This documentation comes from HPCdocs
export BUSCO_CONFIG_FILE="/home/aublft/cdhit/config.ini
export AUGUSTUS_CONFIG_PATH="~/augustus/config


#actual BUSCO command
# -l denotes what reference you will be using.
# for this transcriptome I have inlcuded actinopterygii, the default they use is eukaryota, but you can play around depending what kind of organism you are working with.
# --config denotes the path to where your config file is located.
# The config file is what does the brunt of the work.
busco -l actinopterygii_odb10 --config /home/aublft/cdhit/config.ini


#The  HPC authority says to put this only at  the end, but it wouldn't run.
#The script runs when these export commands before and after the busco  so I've kept them both.
export BUSCO_CONFIG_FILE="/home/aublft/cdhit/config.ini
export AUGUSTUS_CONFIG_PATH="~/augustus/config

