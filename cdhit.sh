#!/bin/bash

# default is the code below
# -i is the input file in fasta format
# -o is the output destination and file name (two output files: fasta sequences file and list of clusters file)
# -c is the sequence identity threshold (default is 0.9)
# -n is the word length paired to -c (check userguide for values, default is 10)
# -d length of description in cluster list file (default is 20)
# -M memory limit in mb for the program (0 for unlimited, use queue to assign memory limit)
# -T number of threads (0 means all CPUs will be used, set CPU limit using queue)

#  load the module
source /opt/asn/etc/asn-bash-profiles-special/modules.sh
module load anaconda/3-2020.02

cd-hit-est -i /home/aublft/raw_data/Transdecoder/B1_trinity.Trinity.fasta.transdecoder.cds -o /home/aublft/cdhit/B1_rmdup -c 0.95 -n 10 -d 0 -M 0 -T 0

#ran on dmc, medium queue, 10gb, 100:00:00, 8 cores

#this is currently adapted and updated from Adam's code. Theoretically this should work.
#updated file to be executed for run 3. Fingers f****** crossed.
#Script works. BE SURE that the output directory exists. Otherwise the script will fail.
