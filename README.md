# TURNER_Scripting_Project
Repo for Scripting for Biologists class

For this project I will write a script to run all of the necessary steps to trim, analyze, and assemble reads into a transcriptome for the gray snapper Lutjanus griseus. I am currently already working on this project in my lab, but for this class I will assemble all of the necessary code into a pipeline of scripts. The scripts will be written in bash and will be run remotely on the Alabama supercomputer. If I have the time I will also run these scripts for another species (lane snapper Lutjanus synagris) that another member of my lab is working on to show that the script works for multiple species. 

All of the programs will be run on the Alabama Super Computer.

Connecting to the supercomputer can be done using the following command, granted you have an accoutn set up:

    $ ssh userID@dmc.asc.edu
    
Running a script on the supercomputer can be done as follows:

    $ run_script /path_to_your_script_file

or

    $ run_script your_scripting_file
    

Queue, time limits, memory limits, and processing cores will be listed on this readme as I have used them. They will vary based on the size of your data.
All scripts were run on DMC. 


# The Players: 

# FastQC

Provides great quality assessment of your reads. The program creates an HTML file with accompanying graphics to assess quality across your reads. We will run this program twice, once in the beginning and once after cutting the adapters from sequences. 

Ran using small queue, 4 cores, 4:00:00, 4gb memory limit. 

Following your FastQC run, you can download the output files from the super computer using the following command:

    $ scp userID@dmc.asc.edu /c/User/Path_to_desired_directory
    
Once downloaded, you should have everything you need to view your fast results in the HTML format. 

# CutAdapt

CutAdapt allows us to "trim" or "cut" the adapters from our reads. 

For my alignment, these are the adapter sequences used:

5' Adapter:

5'-AATGATACGGCGACCACCGAGATCTACACTCTTTCCCTACACGACGCTCTTCCGATCT-3'

3' Adapter:

5'-GATCGGAAGAGCACACGTCTGAACTCCAGTCACATCACGATCTCGTATGCCGTCTTCTGCTTG-3'

Ran using medium queue, 16 cores, 4:00:00, 16 gb memory limit. 


# FastQC (again)

Following CutAdapt, FastQC will be run again. From this, a second FastQC file will be created. You can use the information from these files to compare how your reads changed following CutAdapt. Things like number of reads, length of reads, per-base quality scores, percent GC content, etc. 

*MAKE SURE FOR THIS STEP YOU ARE RUNNING FASTQC ON YOUR CUTADAPTED FILES* 

Ran using medium queue, 16 cores, 4:00:00, 16gb memory limit. 

You can dowload these files to your computer using the same ``scp`` command as the first FastQC run. Make sure your path is on the correct files!!

# Trinity

Trinity needs to run from a scratch folder in the super computer, so you will need to create a directory within the scratch folder. This can be done using the following command:
    
    $ mkdir /scratch/Trinity
    
Note: double check to make sure that the name of the directory you have created is unique. You will be restricted access to the scratch folder if it has been created by another user. 

Trinity works by running threee seperate software packages together in order to construct and assemble the transcriptome from your RNA-seq reads. 

Ran using the large queue, 32 cores, 150:00:00, 100gb memory limit. 

NOTE: Your submitted script may sit pending in the queue for a day or more. This is okay! The large queue, if you can believe it, is used to run large files or scripts that use a lot of power/memory. Once running, periodically check to make sure the script is still running. For my dataset the script needed to run for ~120 hours. 

##############################################################################

ALSO VERY IMPORTANT: 

The Alabama Super Computer will periodically delete their scratch folder. It is good practice to copy your completed files from the scratch folder back to your main directory. This can be accomplished using the following command. 

    $ cp -r /scratch/YourScratch_Folder /home/userID/Directory_You_Want_To_Save_Your_Files_In
    
NOTE: you can do this command individually for each file. However it is easier (in my opinion) to transfer the whole folder itself. MAKE SURE that you include the option -r. This allows the cp command to copy a whole directory (or directory of directories).     

##############################################################################

# Transdecoder

Transdecoder is used to map out potential coding regions within our newly assembled transcriptome. 

This script is relatively straightforward. The -t in each line of code denotes how many cores it will use to run. Leave a numerical out and the script will run using the number of cores requested through the supercomputer. 


Ran using the large queue, 32 cores, 150:00:00, 100gb memory limit. 
*This only took a few hours to run

# cd-hit 

cd-hit removes redundant sequences from our assemblies. cd-hit will also produce a list of protein-families from a given fasta database.

Breakdown of option included in script:

#-i is the input file in fasta format

#-o is the output destination and file name (two output files: fasta sequences file and list of clusters file)

#-c is the sequence identity threshold (default is 0.9)

#-n is the word length paired to -c (check userguide for values, default is 10)

#-d length of description in cluster list file (default is 20)

#-M memory limit in mb for the program (0 for unlimited, use queue to assign memory limit)

#-T number of threads (0 means all CPUs will be used, set CPU limit using queue)

VERY IMPORTANT:

The output directory indicated in this script must already be created before running, otherwise the script will abort. This can be created using the ``mkdir`` command.

Ran on medium queue, 8 cores, 100:00:00, 10gb memory limit.  

# BUSCO

BUSCO is used to asses both quality and annotation completeness of our newly assembled transcriptome. The supercomputing authority has a great reference explaining BUSCO here: https://hpcdocs.asc.edu/content/busco

Before running BUSCO, you will need to set up an "Augustus" directory. This can be done with the following code:

    $ cd
    $ mkdir augustus
    $ cd augustus
    $ cp -r /opt/asn/apps/anaconda_3-4.2.0_cent/pkgs/augustus-3.2.3-boost1.60_0/config .
    
You will also need to create a config.ini that will give the script its parameters. A raw file can be found at the bottom of the supercomputing authority's page on BUSCO. 

The main things you need to manipulate within this config file are: Input file, Run name, out_path, and mode. All other variables can be left with the ``;`` in front so the script will ignore them. For input file give the path to the file you want to run through BUSCO. For run name, or ``out``, simply provide the name of the directory you would like your output to be named. My filename is something to the tune of "BUSCO_v4.1.2_22feb21". I.e., you have the software that was run, the version it ran on, and the date it was run. THIS NEEDS TO BE CHANGED FOR EACH RUN OF BUSCO. Out_path is just that, give the path to where you want your output directory to be located. Mode is important. This is where you specify if your data is for a genome, transcriptome, or proteome. For this analysis I have setmy config file to transcriptome. 

BUSCO creates a summary text file in your output directory that will tell you how how "complete" your assembled transcriptome is.  

Ran on the small queue, 8 cores 24:00:00, 4gb memory limit. 
# Congratulations! 

You should now have an assembled transcriptome! Note: this transcriptome is assembled but not annotated. To understand which genes are being expressed here, you will need to run through an annotation process. There are a handful of ways to achieve this:

# References

Andrews, S. (2010). FastQC:  A Quality Control Tool for High Throughput Sequence Data [Online]. Available online at: http://www.bioinformatics.babraham.ac.uk/projects/fastqc/

MARTIN, Marcel. Cutadapt removes adapter sequences from high-throughput sequencing reads. EMBnet.journal, [S.l.], v. 17, n. 1, p. pp. 10-12, may 2011. ISSN 2226-6089. Available at: <http://journal.embnet.org/index.php/embnetjournal/article/view/200>.

Grabherr MG, Haas BJ, Yassour M, Levin JZ, Thompson DA, Amit I, Adiconis X, Fan L, Raychowdhury R, Zeng Q, Chen Z, Mauceli E, Hacohen N, Gnirke A, Rhind N, di Palma F, Birren BW, Nusbaum C, Lindblad-Toh K, Friedman N, Regev A. Full-length transcriptome assembly from RNA-seq data without a reference genome. Nat Biotechnol. 2011 May 15;29(7):644-52. doi: 10.1038/nbt.1883. PubMed PMID: 21572440.

https://github.com/TransDecoder/TransDecoder/wiki

Limin Fu, Beifang Niu, Zhengwei Zhu, Sitao Wu and Weizhong Li, CD-HIT: accelerated for clustering the next generation sequencing data. Bioinformatics, (2012), 28 (23): 3150-3152. doi: 10.1093/bioinformatics/bts565. PDF, pubmed. 
 
 "Cd-hit: a fast program for clustering and comparing large sets of protein or nucleotide sequences", Weizhong Li & Adam Godzik Bioinformatics, (2006) 22:1658-9. Open access PDF Pubmed Citations
 
Felipe A. Simão, Robert M. Waterhouse, Panagiotis Ioannidis, Evgenia V. Kriventseva, Evgeny M. Zdobnov, BUSCO: assessing genome assembly and annotation completeness with single-copy orthologs, Bioinformatics, Volume 31, Issue 19, 1 October 2015, Pages 3210–3212, https://doi.org/10.1093/bioinformatics/btv351
