# TURNER_Scripting_Project
Repo for Scripting for Biologists class

For this project I will write a script to run all of the necessary steps to trim, analyze, and assemble reads into a transcriptome for the gray snapper Lutjanus griseus. I am currently already working on this project in my lab, but for this class I will assemble all of the necessary code into a script that can be executed once. The script will be written in bash and will be run remotely on the Alabama supercomputer. If I have the time I will also run this script for another species (lane snapper Lutjanus synagris) that another member of my lab is working on to show that the script works for multiple species. 

All of the programs will be run on the Alabama Super Computer. 


# The Players: 

# FastQC

Provides great quality assessment of your reads. The program creates an HTML file with accompanying graphics to assess quality across your reads. We will run this program twice, once in the beginning and once after cutting the adapters from sequences. 


# CutAdapt

CutAdapt allows us to "trim" or "cut" the adapters from our reads. 

For my alignment, these are the adapter sequences used:

5' Adapter:

5'-AATGATACGGCGACCACCGAGATCTACACTCTTTCCCTACACGACGCTCTTCCGATCT-3'

3' Adapter:

5'-GATCGGAAGAGCACACGTCTGAACTCCAGTCACATCACGATCTCGTATGCCGTCTTCTGCTTG-3'

Following CutAdapt, FastQC will be run again. From this, a second FastQC file will be created. You can use the information from these files to compare how your reads changed following CutAdapt. Things like number of reads, length of reads, per-base quality scores, percent GC content, etc. 

*MAKE SURE FOR THIS STEP YOU ARE RUNNING FASTQC ON YOUR CUTADAPTED FILES* 


# Trinity

Trinity works by running threee seperate software packages together in orger to construct and assemble the transcriptome from your RNA-seq reads. 


# Transdecoder

We use transdecoder in order to map out potential coding regions withing our newly assembled transcriptome. 

# cd-hit 

This will remove redundant sequences from our assemblies. cd-hit will also produce a list of protein-families from a given fasta database.


# BUSCO

I will be using the software BUSCO in order to asses both quality and annotation completeness of our newly assembled transcriptome. 


