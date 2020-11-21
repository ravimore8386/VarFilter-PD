#!/usr/bin/perl

#USAGE: perl 5_indel_pop.pl GF15 $samplepath/input_annovar_annotated_txt_files/dignosis

my $famname = $ARGV[0]; #GF15


my $samplepath = $ARGV[1];# "$samplepath/input_annovar_annotated_txt_files/dignosis";


open (TXTFILE, "$samplepath/processed_files/fam.$famname.dam") or die "can not open file fam.$famname.dam";#search file

open(my $outfile1, ">","$samplepath/processed_files/fam.$famname.dam.nfe");
open(my $outfile2, ">","$samplepath/processed_files/fam.$famname.dam.nfe.cnt");

print $outfile1 "#NFE <= 0.01\nChr\tStart\tEnd\tRef\tAlt\tFunc.refGenes\tGene.refGene\tGeneDetail.refGene\tExonicFunc.refGene\tAAChange.refGene\tcytoBand\tgenomicSuperDups\tesp6500siv2_ea\t1000g2015aug_all\t1000g2015aug_afr\t1000g2015aug_amr\t1000g2015aug_eas\t1000g2015aug_eur\t1000g2015aug_sas\tExAC_ALL\tExAC_AFR\tExAC_AMR\tExAC_EAS\tExAC_FIN\tExAC_NFE\tExAC_OTH\tExAC_SAS\tavsnp150\tCLNALLELEID\tCLNDN\tCLNDISDB\tCLNREVSTAT\tCLNSIG\tAF\tAF_popmax\tAF_male\tAF_female\tAF_raw\tAF_afr\tAF_sas\tAF_amr\tAF_eas\tAF_nfe\tAF_fin\tAF_asj\tAF_oth\tnon_topmed_AF_popmax\tnon_neuro_AF_popmax\tnon_cancer_AF_popmax\tcontrols_AF_popmax\tREVEL\tSIFT_score\tSIFT_converted_rankscore\tSIFT_pred\tPolyphen2_HDIV_score\tPolyphen2_HDIV_rankscore\tPolyphen2_HDIV_pred\tPolyphen2_HVAR_score\tPolyphen2_HVAR_rankscore\tPolyphen2_HVAR_pred\tLRT_score\tLRT_converted_rankscore\tLRT_pred\tMutationTaster_score\tMutationTaster_converted_rankscore\tMutationTaster_pred\tMutationAssessor_score\tMutationAssessor_score_rankscore\tMutationAssessor_pred\tFATHMM_score\tFATHMM_converted_rankscore\tFATHMM_pred\tPROVEAN_score\tPROVEAN_converted_rankscore\tPROVEAN_pred\tVEST3_score\tVEST3_rankscore\tMetaSVM_score\tMetaSVM_rankscore\tMetaSVM_pred\tMetaLR_score\tMetaLR_rankscore\tMetaLR_pred\tM-CAP_score\tM-CAP_rankscore\tM-CAP_pred\tCADD_raw\tCADD_raw_rankscore\tCADD_phred\tDANN_score\tDANN_rankscore\tfathmm-MKL_coding_score\tfathmm-MKL_coding_rankscore\tfathmm-MKL_coding_pred\tEigen_coding_or_noncoding\tEigen-raw\tEigen-PC-raw\tGenoCanyon_score\tGenoCanyon_score_rankscore\tintegrated_fitCons_score\tintegrated_fitCons_score_rankscore\tintegrated_confidence_value\tGERP++_RS\tGERP++_RS_rankscore\tphyloP100way_vertebrate\tphyloP100way_vertebrate_rankscore\tphyloP20way_mammalian\tphyloP20way_mammalian_rankscore\tphastCons100way_vertebrate\tphastCons100way_vertebrate_rankscore\tphastCons20way_mammalian\tphastCons20way_mammalian_rankscore\tSiPhy_29way_logOdds\tSiPhy_29way_logOdds_rankscore\tInterpro_domain\tGTEx_V6_gene\tGTEx_V6_tissue\tOtherinfo\t-\t-\t-\t-\t-\t-\t-\t-\t-\t-\t-\t-\tTotal no. of samples\tSample_info\n";
my @genes=();
while (<TXTFILE>)
{
chomp;
#   my ($c1,$c2,$c3,$c4,$c5,$c6,$c7,$c8,$c9,$c10,$c11,$c12,$c13,$c14,$c15,$c16,$c17,$c18,$c19,$c20) = split /\t/, $_;
my (@rest)=split (/\t/);
print $outfile1 "$_\n" if ($_ =~ m/Chr\tStart/);

if ($rest[42] <= 0.01)  #nfe non finish europeun pop
{
print $outfile1 "$_\n";
# get genes into array for count
push @genes, "$rest[6]";
}

}
my $size = @genes;
#count array
print $outfile2 "$_ $_{$_}\n" for grep !$_{$_}++, @genes;

print $outfile2 "Total no. of variants=$size\n";


