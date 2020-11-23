# PDVarFilter - Version 0.1
## Phenotype and Diagnosis level VARiant FILTERing tool for WGS/WES sequencing data.
### Introduction
#### PDVarFilter is a Phenotype and Diagnosis level VARiant FILTERing tool, which filters SNP/INDEL variants based on its presence in individuals of pedigree. This tool filters SNP/INDEL variants by referring Annovar tool text file, there are four three core criteria used for filtering: 1) Damaging variants based on in silico predictions algorithms (SIFT or PolyPhene) for SNP and Frameshift/Nonfremeshift/Stopgain/Stoploss variants for INDEL. 1) Rare variants (<=1%) in the non-Finnish population (NFE) as per GnomAD database, and 3) Variants absent in control individuals of pedigree.

This tool has two main modules and variants filtered further based on Phenotype and Diagnosis level:
1) PhenoVarFilter - this identifies variants present in individuals in Broad Autism Phenotype (BAP), Mild Autism Phenotype (MAP), and Narrow Autism Phenotype (NAP) categories of pedigree.
2) DiagnoVarFilter - this identifies variants present in all cases and absence in controls individuals of pedigree.

PDVarFilter is developed as part of the Multiplex Autism Families study at ARC, University of Cambridge, UK. Please read the README file before using this tool.

### Requirements
PDVarFilter tool is tested on the following platform:
1. OS Ubuntu v16.04.5 LTS
2. Perl 5, version 22, subversion 1 (v5.22.1)
3. ANNOVAR tab-delimted annotated output file (Wang K, Li M, Hakonarson H. ANNOVAR: Functional annotation of genetic variants from next-generation sequencing data, Nucleic Acids Research, 38:e164, 2010).

### Usage
1) PhenoVarFilter:
```
Input files for SNP and INDEL: (Please note that input files and edit in samples details are mandatory before running the tool)

1. Paste all samples annovar annotated text file in the folder 'input_annovar_annotated_txt_files' for snp and indel.
(Please check the coloum order carefully in your sample annotated file before run the analysis, it should be in same order which is given in example text file.)

2. Edit files in the folder 'input_samples_details' for snp and indel.

File 'input_all_cases.txt' - Add tab-delimited information of pedigree name, sample name, and full path of annotated annovar text files of cases in pedigree.

File 'input_bap.txt' - Add BAP samples name in the list.

File 'input_map.txt' - Add MAP samples name in the list.

File 'input_nap.txt' - Add NAP samples name in the list.

File 'input_control.txt' - Add control samples name in the list.

Output file: 

GF18.snp/indel.PhenoVarFilter.results - This output file contains the filtered snp/indel variants in BAP, MAP and NAP cateogory in pedigree.

Command syntax for SNP:
usage: PhenoVarFilter_snp.sh WORKING_DIRECTORY_PATH PEDIGREE_NAME TOTAL_BAP_SAMPLES TOTAL_MAP_SAMPLES TOTAL_NAP_SAMPLES

arguments:
  WORKING_DIRECTORY_PATH        Path to the working directory where files are stored.
  PEDIGREE_NAME        Pedigree name of samples.
  TOTAL_BAP_SAMPLES        Total number of BAP individuals in the pedigree
  TOTAL_MAP_SAMPLES        Total number of MAP individuals in the pedigree
  TOTAL_NAP_SAMPLES        Total number of NAP individuals in the pedigree

Example command: 
cd /usr/ravi/PDVarFilter/PhenoVarFilter/snp
/usr/ravi/PDVarFilter/PhenoVarFilter/snp/PhenoVarFilter_snp.sh /usr/ravi/PDVarFilter/PhenoVarFilter/snp GF18 3 2 2

For INDEL:

usage: PhenoVarFilter_indel.sh WORKING_DIRECTORY_PATH PEDIGREE_NAME TOTAL_BAP_SAMPLES TOTAL_MAP_SAMPLES TOTAL_NAP_SAMPLES

arguments: same as snp

Example command: 
cd /usr/ravi/PDVarFilter/PhenoVarFilter/indel
/usr/ravi/PDVarFilter/PhenoVarFilter/indel/PhenoVarFilter_indel.sh /usr/ravi/PDVarFilter/PhenoVarFilter/indel GF18 3 2 2

```

2) DiagnoVarFilter:

```
Input files for snp and indel: (Please note that input files and edit in samples details are mandatory before running the tool)

1. Paste all samples annovar annotated text file in the folder 'input_annovar_annotated_txt_files' for snp and indel.

2. Edit files in the folder 'input_samples_details' for snp and indel.

File 'input_cases.txt' - Add cases samples name in the list.

File 'input_control.txt' - Add control samples name in the list.

Output file: 

GF18.snp/indel.DiagnoVarFilter.results - This output file contains the filtered snp/indel variants present in all cases.

Command syntax for SNP:
usage: DiagnoVarFilter_indel.sh WORKING_DIRECTORY_PATH PEDIGREE_NAME TOTAL_CASES_SAMPLES

arguments:
  WORKING_DIRECTORY_PATH        Path to the working directory where files are stored.
  PEDIGREE_NAME        Pedigree name of samples.
  TOTAL_CASES_SAMPLES        Total number of cases individuals in the pedigree
  
Example command: 
cd /usr/ravi/PDVarFilter/DiagnoVarFilter/snp
/usr/ravi/PDVarFilter/DiagnoVarFilter/snp/DiagnoVarFilter_snp.sh /usr/ravi/PDVarFilter/DiagnoVarFilter/snp GF18 3

For INDEL:

usage: DiagnoVarFilter_indel.sh WORKING_DIRECTORY_PATH PEDIGREE_NAME TOTAL_CASES_SAMPLES

arguments: same as snp

Example command: 
cd /usr/ravi/PDVarFilter/DiagnoVarFilter/indel
/usr/ravi/PDVarFilter/DiagnoVarFilter/indel/DiagnoVarFilter_indel.sh /usr/ravi/PDVarFilter/DiagnoVarFilter/indel GF18 3
```
## Citation
Manuscript is under process.

## Contact
For technical queries, please write to Dr. Ravi Prabhakar More on email rm975@medschl.cam.ac.uk, ravipmore7@gmail.com

## Contributors
Developed by: Dr. Ravi Prabhakar More

Conceptualized by: Dr. Ravi Prabhakar More (ARC, University of Cambridge), Dr. Varun Warrier (ARC, University of Cambridge), Charles Bradshaw (The Gurdon Institute, University of Cambridge), Prof. Simon Baron-Cohen (ARC, University of Cambridge)
