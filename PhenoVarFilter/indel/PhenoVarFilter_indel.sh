#!/bin/bash

#######
echo "Welcome to PDVarFilter-PhenoVarFilter-indel";
#######

echo "working_dir: $1";
echo "pedigree: $2";
echo "bap: $3";
echo "map: $4";
echo "nap: $5";

#working_dir='/mnt/b2/home4/arc/rm975/softwares/PDVarFilter/PhenoVarFilter/indel'
#pedigree="GF18"
#bap="3"
#map="2"
#nap="2"

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

#indel
perl $1/scripts/1_indel_cases_merge.pl $2 $1

echo 1. Input files reading done.

perl $1/scripts/2_indel_damaging.pl $2 $1

perl $1/scripts/3_indel_damaging_count.pl $2 $1

echo 2. Damaging variants filtering done.

perl $1/scripts/4_indel_gene_var.pl $2 $1

perl $1/scripts/5_indel_pop.pl $2 $1

perl $1/scripts/6_indel_get_sample.pl $2 $1

echo 3. Control and rare population variants extraction done.

########################################################
# NAP
########################################################
perl $1/scripts/7_nap_control.pl $2 $1

perl $1/scripts/8_nap.pl $2 $1

#nap 2 samples
perl $1/scripts/9_nap_count.pl $2 $1 $5

perl $1/scripts/10_nap_get_lines.pl $2 $1

perl $1/scripts/11_nap_gene_ann.pl $2 $1

echo 4. NAP phenotype analysis done.

########################################################
# MAP
########################################################
perl $1/scripts/12_map_control.pl $2 $1

perl $1/scripts/13_map.pl $2 $1

#map 3 samples
perl $1/scripts/14_map_count.pl $2 $1 $4

perl $1/scripts/15_map_get_lines.pl $2 $1

perl $1/scripts/16_map_gene_ann.pl $2 $1

echo 5. MAP phenotype analysis done.

########################################################
# BAP
########################################################
perl $1/scripts/17_bap_control.pl $2 $1

perl $1/scripts/18_bap.pl $2 $1

#bap 4 samples
perl $1/scripts/19_bap_count.pl $2 $1 $3

perl $1/scripts/20_bap_get_lines.pl $2 $1

perl $1/scripts/21_bap_gene_ann.pl $2 $1

########################################################
#Print result files
########################################################

perl $1/scripts/22_res_files_merge.pl $2 $1

perl $1/scripts/24_res_var_count.pl $2 $1

paste -d'\t' $1/processed_files/res.$2.indel.het.dup.out $1/processed_files/res.$2.indel.het.out.count > $1/output_results_files/$2.indel.PhenoVarFilter.results.txt

echo 7. Results file generated. Please check $2.indel.PhenoVarFilter.results.txt file in folder output_results_files.
