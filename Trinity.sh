#!/bin/bash

#Script to run Trinity 

##########################################################################

#IMPORTANT#

#Trinity and its files need to be run from a scrath folder in the super computer.
#Look at the current scratch folder directories. If you use the same directory name that another user created you will be denied access. 

#########################################################################



export OMP_NUM_THREADS=10 #OMP_NUM_THREADS should be set to same number as --CPU parameter
source /opt/asn/etc/asn-bash-profiles-special/modules.sh
module load trinity/2.9.1

# --seqType type of read (fa for .fasta, or fq for .fq.gz), --left and --right are the file inputs so --left would be the fileinpair_1.ext and --right would be fileinpair_2.ext, --SS_lib_type read orientation FR is Reads_1 5'-->3' and Reads 2 3'<--5' , --CPU number of CPUs to use (default is 2), --min_contig_length is the min segment lengths that trinity will keep after assembly, output will be a .fasta file
# like with the other scripts so far, make sure the path to YOUR files is correct.
Trinity --seqType fq --max_memory 50G --left /scratch/TrinityB1/B1_trinity/B1_1_cutadapted.fq.gz --right /scratch/TrinityB1/B1_trinity/B1_2cutadapted.fq.gz --SS_lib_type FR --CPU 10 --min_contig_length 200 --full_cleanup --verbose --output /scratch/TrinityB1/B1_trinity

#Parameters for running this script will change with what data is being worked on. This took multiple trials before it finally worked, so don't give up!
# ran on dmc, 150:00:00, large queue, 100gb, 32 cores

#dear god I hope this works
#It did
