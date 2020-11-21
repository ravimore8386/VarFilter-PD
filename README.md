# PDVarFilter - Version 0.1
## Phenotype and Diagnosis level VARiant FILTERing tool for WGS/WES sequencing data.
### Introduction
#### PDVarFilter is a Phenotype and Diagnosis level VARiant FILTERing tool, which filter SNP/INDEL variants based on its presense in individulas of pedigree. This tool filter SNP/INDEL variants by referring Annovar tool text file, there are four three core criteria used for filtering: 1) Variants based on in silico predictions algorithms (SIFT or PolyPhene) of damaging variants. 1) Rare variants (<=1%) in non finnish population (NFE) as per GnomAD database. 3) Variants absent in control individulas of pedigree.

This tool has two main modules and variants filtered further based on Phenotype and Diagnosis level:
1) PhenoVarFilter
2) DiagnoVarFilter

PDVarFilter is developed as part of the Multiplex Autism Families study at ARC, University of Cambridge, UK. Please read the README file before using this tool.

### Requirements
PDVarFilter tool is developed and tested on following platform, which is requirement to run the tool.
OS Ubuntu v16.04.5 LTS
Perl 5, version 22, subversion 1 (v5.22.1)

Some basic Git commands are:
```
git status
git add
git commit
```
