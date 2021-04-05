#!/bin/sh
#load the module
source /opt/asn/etc/asn-bash-profiles-special/modules.sh
#find what module you need to load by searching for the program name on hpcdocs$
module load anaconda/3-2020.02

#-o first output and -p is paired output. Don't forget it, or the next person you help will have the same problem as you. Dumba**.
#runs cutadapt on sample files. 
#you will need to make sure you have the correct adapters for your organism. This script is currently set up for the adapters of Lutjanus griseus.

cutadapt -g AATGATACGGCGACCACCGAGATCTACACTCTTTCCCTACACGACGCTCTTCCGATCT -a GATCGGAAGAGCACACGTCTGAACTCCAGTCACATCACGATCTCGTATGCCGTCTTCTGCTTG --trim-n -m 50 -q 30 --pair-filter=any --cores=0 -o /home/aublft/raw_data/B1/B1_1_cutadapted.fq.gz -p /home/aublft/raw_data/B1/B1_2cutadapted.fq.gz /home/aublft/raw_data/B1/B1_1.fq.gz /home/aublft/raw_data/B1/B1_2.fq.gz

