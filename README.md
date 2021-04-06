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

Trinity needs to run from a scratch folder in the super computer, so you will need to create a directory within the scratch folder. This can be done using the following command:
    
    $ mkdir /scratch/Trinity
    
Note: double check to make sure that the name of the directory you have created is unique. You will be restricted access to the scratch folder if it has been created by another user. 

Trinity works by running threee seperate software packages together in order to construct and assemble the transcriptome from your RNA-seq reads. 


# Transdecoder

We use transdecoder in order to map out potential coding regions withing our newly assembled transcriptome. 

# cd-hit 

This will remove redundant sequences from our assemblies. cd-hit will also produce a list of protein-families from a given fasta database.


# BUSCO

I will be using the software BUSCO in order to asses both quality and annotation completeness of our newly assembled transcriptome. 










# References

Andrews, S. (2010). FastQC:  A Quality Control Tool for High Throughput Sequence Data [Online]. Available online at: http://www.bioinformatics.babraham.ac.uk/projects/fastqc/

MARTIN, Marcel. Cutadapt removes adapter sequences from high-throughput sequencing reads. EMBnet.journal, [S.l.], v. 17, n. 1, p. pp. 10-12, may 2011. ISSN 2226-6089. Available at: <http://journal.embnet.org/index.php/embnetjournal/article/view/200>.

Grabherr MG, Haas BJ, Yassour M, Levin JZ, Thompson DA, Amit I, Adiconis X, Fan L, Raychowdhury R, Zeng Q, Chen Z, Mauceli E, Hacohen N, Gnirke A, Rhind N, di Palma F, Birren BW, Nusbaum C, Lindblad-Toh K, Friedman N, Regev A. Full-length transcriptome assembly from RNA-seq data without a reference genome. Nat Biotechnol. 2011 May 15;29(7):644-52. doi: 10.1038/nbt.1883. PubMed PMID: 21572440.

https://github.com/TransDecoder/TransDecoder/wiki

Limin Fu, Beifang Niu, Zhengwei Zhu, Sitao Wu and Weizhong Li, CD-HIT: accelerated for clustering the next generation sequencing data. Bioinformatics, (2012), 28 (23): 3150-3152. doi: 10.1093/bioinformatics/bts565. PDF, pubmed. 
 
 "Cd-hit: a fast program for clustering and comparing large sets of protein or nucleotide sequences", Weizhong Li & Adam Godzik Bioinformatics, (2006) 22:1658-9. Open access PDF Pubmed Citations
 
Felipe A. Simão, Robert M. Waterhouse, Panagiotis Ioannidis, Evgenia V. Kriventseva, Evgeny M. Zdobnov, BUSCO: assessing genome assembly and annotation completeness with single-copy orthologs, Bioinformatics, Volume 31, Issue 19, 1 October 2015, Pages 3210–3212, https://doi.org/10.1093/bioinformatics/btv351
