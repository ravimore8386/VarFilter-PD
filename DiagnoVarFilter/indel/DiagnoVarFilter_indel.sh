#!/bin/bash

#######
echo "Welcome to PDVarFilter-DiagnoVarFilter-indel";
#######

export LC_CTYPE=en_US.UTF-8

export LC_ALL=en_US.UTF-8

echo "working_dir: $1";
echo "pedigree: $2";
echo "cases: $3";

#working_dir='/mnt/b2/home4/arc/rm975/softwares/PDVarFilter/DiagnoVarFilter/indel'
#pedigree="GF18"
#cases="3"

#indels
perl $1/scripts/1_indel_cases_merge.pl $2 $1

echo 1. Input files reading done.

perl $1/scripts/2_indel_damaging.pl $2 $1

perl $1/scripts/3_indel_damaging_count.pl $2 $1

perl $1/scripts/4_indel_gene_var.pl $2 $1

echo 2. Damaging variants filtering done.

perl $1/scripts/5_indel_pop.pl $2 $1

perl $1/scripts/6_get_sample.pl $2 $1

######
#indel cases
######
perl $1/scripts/9_nap_indel_control.pl $2 $1

echo 3. Control and rare population variants extraction done.

perl $1/scripts/10_nap.pl $2 $1

#case samples
perl $1/scripts/11_nap_count.pl $2 $1 $3

perl $1/scripts/12_nap_get_lines.pl $2 $1

perl $1/scripts/13_nap_gene_ann.pl $2 $1

echo 4. Cases phenotype analysis done.

perl $1/scripts/54_res_files_merge.pl $2 $1

perl $1/scripts/56_var_count.pl $2 $1

paste -d'\t' $1/processed_files/res.$2.indel.DignoVarFilter.dup.out $1/processed_files/res.$2.indel.DignoVarFilter.out.count > $1/output_results_files/$2.indel.DignoVarFilter.results.txt

echo 7. Results file generated. Please check $2.indel.DignoVarFilter.results.txt file in folder output_results_files.
