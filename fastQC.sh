
#!/bin/sh

#Simple script to run quality scores of reads from the Illumina reads
#make sure that your reads are in a .fq.gz format. The file location is just in the directories that I created for my own files
#MAKE SURE that the path to your files is correct for your directory!!!!
#run through the Alabama Super Computer

source /opt/asn/etc/asn-bash-profiles-special/modules.sh
module load fastqc/0.10.1
fastqc /home/aublft/raw_data/B1/*fq.gz 
