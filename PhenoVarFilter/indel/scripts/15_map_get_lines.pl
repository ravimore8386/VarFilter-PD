#!/usr/bin/perl

#USAGE: perl 17_map_get_lines.pl GF18 /mnt/b2/home4/arc/rm975/wgs/pedigree/GF18/variant_prio/indel/het2

my $famname = $ARGV[0]; #GF18

my $samplepath = $ARGV[1];# "/mnt/b2/home4/arc/rm975/wgs/pedigree/GF18/variant_prio/indel/het2";

open FILE1, "$samplepath/processed_files/fam.$famname.map.cnt" or die "cannot open file";

my %hash={};
while (my $line=<FILE1>) {
   chomp($line);
   my ($b1,$b2,$b3) = split /:/, $line;
   $hash{"$b1:$b2"} = "";
}

open(my $outfile, ">","$samplepath/processed_files/fam.$famname.map.out");

	print {$outfile}"#Chr\tStart\tEnd\tRef\tAlt\tFunc.refGene\tGene.refGene\tGeneDetail.refGene\tExonicFunc.refGene\tAAChange.refGene\tcytoBand\tgenomicSuperDups\tesp6500siv2_ea\t1000g2015aug_all\t1000g2015aug_afr\t1000g2015aug_amr\t1000g2015aug_eas\t1000g2015aug_eur\t1000g2015aug_sas\tExAC_ALL\tExAC_AFR\tExAC_AMR\tExAC_EAS\tExAC_FIN\tExAC_NFE\tExAC_OTH\tExAC_SAS\tavindel150\tCLNALLELEID\tCLNDN\tCLNDISDB\tCLNREVSTAT\tCLNSIG\tAF\tAF_popmax\tAF_male\tAF_female\tAF_raw\tAF_afr\tAF_sas\tAF_amr\tAF_eas\tAF_nfe\tAF_fin\tAF_asj\tAF_oth\tnon_topmed_AF_popmax\tnon_neuro_AF_popmax\tnon_cancer_AF_popmax\tcontrols_AF_popmax\tREVEL\tSIFT_score\tSIFT_converted_rankscore\tSIFT_pred\tPolyphen2_HDIV_score\tPolyphen2_HDIV_rankscore\tPolyphen2_HDIV_pred\tPolyphen2_HVAR_score\tPolyphen2_HVAR_rankscore\tPolyphen2_HVAR_pred\tLRT_score\tLRT_converted_rankscore\tLRT_pred\tMutationTaster_score\tMutationTaster_converted_rankscore\tMutationTaster_pred\tMutationAssessor_score\tMutationAssessor_score_rankscore\tMutationAssessor_pred\tFATHMM_score\tFATHMM_converted_rankscore\tFATHMM_pred\tPROVEAN_score\tPROVEAN_converted_rankscore\tPROVEAN_pred\tVEST3_score\tVEST3_rankscore\tMetaSVM_score\tMetaSVM_rankscore\tMetaSVM_pred\tMetaLR_score\tMetaLR_rankscore\tMetaLR_pred\tM-CAP_score\tM-CAP_rankscore\tM-CAP_pred\tCADD_raw\tCADD_raw_rankscore\tCADD_phred\tDANN_score\tDANN_rankscore\tfathmm-MKL_coding_score\tfathmm-MKL_coding_rankscore\tfathmm-MKL_coding_pred\tEigen_coding_or_noncoding\tEigen-raw\tEigen-PC-raw\tGenoCanyon_score\tGenoCanyon_score_rankscore\tintegrated_fitCons_score\tintegrated_fitCons_score_rankscore\tintegrated_confidence_value\tGERP++_RS\tGERP++_RS_rankscore\tphyloP100way_vertebrate\tphyloP100way_vertebrate_rankscore\tphyloP20way_mammalian\tphyloP20way_mammalian_rankscore\tphastCons100way_vertebrate\tphastCons100way_vertebrate_rankscore\tphastCons20way_mammalian\tphastCons20way_mammalian_rankscore\tSiPhy_29way_logOdds\tSiPhy_29way_logOdds_rankscore\tInterpro_domain\tGTEx_V6_gene\tGTEx_V6_tissue\tOtherinfo\tOtherinfo2\tOtherinfo3\tOtherinfo4\tOtherinfo5\tOtherinfo6\tOtherinfo7\tOtherinfo8\tOtherinfo9\tOtherinfo10\tOtherinfo11\tOtherinfo12\tOtherinfo13\tref_depth\talt_depth\tper_33_ad\tHet_Hom\tfamily_number\tsample_number\n";


open (TXTFILE, "$samplepath/processed_files/fam.$famname.map") or die "cannot open file ";  #search file

#print {$outfile} "#chr\tpos\t$filename\n";
while (<TXTFILE>)
{
chomp;
   my (@var)=split (/\t/);
#    my ($c1,$c2,$c3,$c4,$c5,$c6,$c7,$c8,$c9,$c10,$c11,$c12,$c13,$c14,$c15,$c16,$c17,$c18,$c19,$c20) = split /\t/, $_;
    my $chrpos="$var[0]:$var[1]";

   if (exists($hash{$chrpos})){
       print {$outfile} "$_\n";
#              print {$outfile1} "\t$var[132]";
   }

}


