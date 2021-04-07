#!/bin/bash
#script to run transdecoder
#load the module

source /opt/asn/etc/asn-bash-profiles-special/modules.sh
module load transdecoder/5.5.0

# -t denotes number of threads(cores) to be used. Leave blank and it will take what you put into the queue

TransDecoder.LongOrfs -t /home/aublft/raw_data/Trinity_Files/TrinityB1/B1_trinity.Trinity.fasta
TransDecoder.Predict -t /home/aublft/raw_data/Trinity_Files/TrinityB1/B1_trinity.Trinity.fasta

#use same queue parameters as trinity


#Updated to run with S. griseus post-trinity files
#Hopefully this works the first time around
#Holy S*** that worked?

