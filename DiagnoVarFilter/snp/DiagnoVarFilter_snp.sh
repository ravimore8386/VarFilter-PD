#!/bin/bash

#######
echo "Welcome to PDVarFilter-DiagnoVarFilter-snp";
#######

export LC_CTYPE=en_US.UTF-8

export LC_ALL=en_US.UTF-8

echo "working_dir: $1";
echo "pedigree: $2";
echo "cases: $3";

#working_dir='/mnt/b2/home4/arc/rm975/softwares/PDVarFilter/DiagnoVarFilter/snp'
#pedigree="GF18"
#cases="3"

perl $1/scripts/1_snp_cases_merge.pl $2 $1

echo 1. Input files reading done.

perl $1/scripts/2_snp_damaging_var.pl $2 $1

echo 2. Damaging variants filtering done.

perl $1/scripts/5_snp_pop.pl $2 $1

perl $1/scripts/6_snp_get_var_sample.pl $2 $1

perl $1/scripts/7_stopgain_pop.pl $2 $1

perl $1/scripts/8_stoploss_pop.pl $2 $1

echo 3. Control and rare population variants extraction done.

######
#SNP NAP
######
perl $1/scripts/9_nap_snp_control.pl $2 $1

perl $1/scripts/10_nap.pl $2 $1

#nap 2 samples
perl $1/scripts/11_nap_count.pl $2 $1 $3

perl $1/scripts/12_nap_get_lines.pl $2 $1

perl $1/scripts/13_nap_gene_ann.pl $2 $1

######
#stopgain nap
######
perl $1/scripts/24_stopgain_control_nap.pl $2 $1

perl $1/scripts/25_stopgain_nap.pl $2 $1

#nap samples
perl $1/scripts/26_stopgain_count_nap.pl $2 $1 $3

perl $1/scripts/27_stopgain_get_nap.pl $2 $1

perl $1/scripts/28_stopgain_gene_ann_nap.pl $2 $1

######
#stoploss nap
######
perl $1/scripts/29_stoploss_control_nap.pl $2 $1

#nap 2 samples
perl $1/scripts/30_stoploss_nap.pl $2 $1

perl $1/scripts/31_stoploss_count_nap.pl $2 $1 $3

perl $1/scripts/32_stoploss_get_nap.pl $2 $1

perl $1/scripts/33_stoploss_gene_ann_nap.pl $2 $1

echo 4. Cases analysis done.

perl $1/scripts/54_res_files_merge.pl $2 $1

perl $1/scripts/56_var_count.pl $2 $1

paste -d'\t' $1/processed_files/res.$2.dup.out $1/processed_files/res.$2.out.count > $1/output_results_files/$2.snp.DiagnoVarFilter.results.txt

echo 5. Results file generated. Please check $2.snp.DiagnoVarFilter.results.txt file in folder output_results_files.


