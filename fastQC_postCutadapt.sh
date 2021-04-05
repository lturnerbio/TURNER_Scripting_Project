
#!/bin/sh


source /opt/asn/etc/asn-bash-profiles-special/modules.sh

#load the module
module load fastqc/0.10.1

#Double check to make sure that your files after cutadapt match what you put in this script.
#for my data I added "_cutadapted" to my files to denote they have been run through cutadapt.

fastqc /home/aublft/raw_data/B1/*cutadapted.fq.gz

#as a test, you can compare the HTML output files to see if the reads have been trimmed and if cutadapt had any major effects on overall quality. 

