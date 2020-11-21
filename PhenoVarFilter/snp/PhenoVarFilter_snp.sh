#!/bin/bash

#######
echo "Welcome to PDVarFilter-PhenoVarFilter-snp";
#######

echo "working_dir: $1";
echo "pedigree: $2";
echo "bap: $3";
echo "map: $4";
echo "nap: $5";

#working_dir='/mnt/b2/home4/arc/rm975/softwares/PDVarFilter/PhenoVarFilter/snp'
#pedigree="GF18"
#bap="3"
#map="2"
#nap="2"

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

#snp

perl $1/scripts/1_snp_cases_merge.pl $2 $1
echo 1. Input files reading done.

perl $1/scripts/2_snp_damaging_var.pl $2 $1
echo 2. Damaging variants filtering done.

perl $1/scripts/3_snp_pop.pl $2 $1
echo 3. Control population variants extraction done.

perl $1/scripts/4_snp_get_var_sample.pl $2 $1

perl $1/scripts/5_stopgain_pop.pl $2 $1

perl $1/scripts/6_stoploss_pop.pl $2 $1

########################################################
#SNP NAP
########################################################
perl $1/scripts/7_nap_control.pl $2 $1

perl $1/scripts/8_nap.pl $2 $1

#nap 2 samples
perl $1/scripts/9_nap_count.pl $2 $1 $5

perl $1/scripts/10_nap_get_lines.pl $2 $1

perl $1/scripts/11_nap_gene_ann.pl $2 $1

######
#stopgain nap
######
perl $1/scripts/12_nap_stopgain_control.pl $2 $1

perl $1/scripts/13_nap_stopgain.pl $2 $1

#nap 2 samples
perl $1/scripts/14_nap_stopgain_count.pl $2 $1 $5

perl $1/scripts/15_nap_stopgain_get.pl $2 $1

perl $1/scripts/16_nap_stopgain_gene_ann.pl $2 $1

######
#stoploss nap
######
perl $1/scripts/17_nap_stoploss_control.pl $2 $1

#nap 2 samples
perl $1/scripts/18_nap_stoploss.pl $2 $1

perl $1/scripts/19_nap_stoploss_count.pl $2 $1 $5

perl $1/scripts/20_nap_stoploss_get.pl $2 $1

perl $1/scripts/21_nap_stoploss_gene_ann.pl $2 $1

echo 4. NAP phenotype analysis done.

########################################################
#SNP MAP
########################################################
perl $1/scripts/22_map_control.pl $2 $1

perl $1/scripts/23_map.pl $2 $1

#map 3 samples
perl $1/scripts/24_map_count.pl $2 $1 $4

perl $1/scripts/25_map_get_lines.pl $2 $1

perl $1/scripts/26_map_gene_ann.pl $2 $1

######
#stopgain map
######
perl $1/scripts/27_map_stopgain_control.pl $2 $1

perl $1/scripts/28_map_stopgain.pl $2 $1

#map 3 samples
perl $1/scripts/29_map_stopgain_count.pl $2 $1 $4

perl $1/scripts/30_map_stopgain_get.pl $2 $1

perl $1/scripts/31_map_stopgain_gene_ann.pl $2 $1

######
#stoploss map
######

perl $1/scripts/32_map_stoploss_control.pl $2 $1

perl $1/scripts/33_map_stoploss.pl $2 $1

#map 3 samples
perl $1/scripts/34_map_stoploss_count.pl $2 $1 $4

perl $1/scripts/35_map_stoploss_get.pl $2 $1

perl $1/scripts/36_map_stoploss_gene_ann.pl $2 $1

echo 5. MAP phenotype analysis done.

########################################################
#SNP BAP
########################################################

perl $1/scripts/37_bap_control.pl $2 $1

perl $1/scripts/38_bap.pl $2 $1

#BAP 4 samples
perl $1/scripts/39_bap_count.pl $2 $1 $3

perl $1/scripts/40_bap_get_lines.pl $2 $1

perl $1/scripts/41_bap_gene_ann.pl $2 $1

######
#stopgain BAP
######

perl $1/scripts/42_bap_stopgain_control.pl $2 $1

perl $1/scripts/43_bap_stopgain.pl $2 $1

#bap 4 samples
perl $1/scripts/44_bap_stopgain_count.pl $2 $1 $3

perl $1/scripts/45_bap_stopgain_get.pl $2 $1

perl $1/scripts/46_bap_stopgain_gene_ann.pl $2 $1

######
#stoploss BAP
######
perl $1/scripts/47_bap_stoploss_control.pl $2 $1

perl $1/scripts/48_bap_stoploss.pl $2 $1

#bap 4 samples
perl $1/scripts/49_bap_stoploss_count.pl $2 $1 $3

perl $1/scripts/50_bap_stoploss_get.pl $2 $1

perl $1/scripts/51_bap_stoploss_gene_ann.pl $2 $1

echo 6. BAP phenotype analysis done.

########################################################
#Print result files
########################################################
perl $1/scripts/52_res_files_merge.pl $2 $1

perl $1/scripts/54_res_var_count.pl $2 $1

paste -d'\t' $1/processed_files/res.$2.snp.list.out $1/processed_files/res.$2.snp.list.count > $1/output_results_files/$2.snp.PhenoVarFilter.results.txt

echo 7. Results file generated. Please check $2.snp.PhenoVarFilter.results.txt file in folder output_results_files.
