#!/usr/bin/perl

#USAGE: perl 53_stoploss_gene_ann_bap.pl GF18 /mnt/b2/home4/arc/rm975/wgs/pedigree/GF18/variant_prio/snp/het

my $pedigree = $ARGV[0]; #GF18

my $working_dir = $ARGV[1];# "/mnt/b2/home4/arc/rm975/wgs/pedigree/GF18/variant_prio/snp/het";

#Sfari.txt
open FILE1, "$working_dir/gene_databases/Sfari.txt" or die "cannot open file";
my %sfari; while (my $line1=<FILE1>) { chomp($line1); $sfari{$line1} = ''; }

#Spark.txt
open FILE2, "$working_dir/gene_databases/Spark.txt" or die "cannot open file";
my %spark; while (my $line2=<FILE2>) { chomp($line2); $spark{$line2} = ''; }

#Satterstrom.txt
open FILE3, "$working_dir/gene_databases/Satterstrom.txt" or die "cannot open file";
my %Satterstrom; while (my $line3=<FILE3>) { chomp($line3); $Satterstrom{$line3} = ''; }

#Rubeis.txt
open FILE4, "$working_dir/gene_databases/Rubeis.txt" or die "cannot open file";
my %Rubeis; while (my $line4=<FILE4>) { chomp($line4); $Rubeis{$line4} = ''; }

#autismKB.txt
open FILE5, "$working_dir/gene_databases/autismKB.txt" or die "cannot open file";
my %autismKB; while (my $line5=<FILE5>) { chomp($line5); $autismKB{$line5} = ''; }

#Epilepsy.txt
open FILE6, "$working_dir/gene_databases/Epilepsy.txt" or die "cannot open file";
my %Epilepsy; while (my $line6=<FILE6>) { chomp($line6); $Epilepsy{$line6} = ''; }

#Allen.txt
open FILE7, "$working_dir/gene_databases/Allen.txt" or die "cannot open file";
my %Allen; while (my $line7=<FILE7>) { chomp($line7); $Allen{$line7} = ''; }

#Atlas.txt
open FILE8, "$working_dir/gene_databases/Atlas.txt" or die "cannot open file";
my %Atlas; while (my $line8=<FILE8>) { chomp($line8); $Atlas{$line8} = ''; }

#QuickGO.txt
open FILE9, "$working_dir/gene_databases/QuickGO.txt" or die "cannot open file";
my %QuickGO; while (my $line9=<FILE9>) { chomp($line9); $QuickGO{$line9} = ''; }

#mapk.txt
open FILE10, "$working_dir/gene_databases/mapk.txt" or die "cannot open file";
my %mapk; while (my $line10=<FILE10>) { chomp($line10); $mapk{$line10} = ''; }

#Axon_guidance.txt
open FILE11, "$working_dir/gene_databases/Axon_guidance.txt" or die "cannot open file";
my %Axon_guidance; while (my $line11=<FILE11>) { chomp($line11); $Axon_guidance{$line11} = ''; }

#wnt.txt
open FILE12, "$working_dir/gene_databases/wnt.txt" or die "cannot open file";
my %wnt; while (my $line12=<FILE12>) { chomp($line12); $wnt{$line12} = ''; }

#mRNA_splicing.txt
open FILE13, "$working_dir/gene_databases/mRNA_splicing.txt" or die "cannot open file";
my %mRNA_splicing; while (my $line13=<FILE13>) { chomp($line13); $mRNA_splicing{$line13} = ''; }

#Regulation.txt
open FILE14, "$working_dir/gene_databases/Regulation.txt" or die "cannot open file";
my %Regulation; while (my $line14=<FILE14>) { chomp($line14); $Regulation{$line14} = ''; }

#Postsynaptic_Density.txt
open FILE15, "$working_dir/gene_databases/Postsynaptic_Density.txt" or die "cannot open file";
my %Postsynaptic_Density; while (my $line15=<FILE15>) { chomp($line15); $Postsynaptic_Density{$line15} = ''; }

#Presynaptic_ActiveZone.txt
open FILE16, "$working_dir/gene_databases/Presynaptic_ActiveZone.txt" or die "cannot open file";
my %Presynaptic_ActiveZone; while (my $line16=<FILE16>) { chomp($line16); $Presynaptic_ActiveZone{$line16} = ''; }

#Presynaptic.txt
open FILE17, "$working_dir/gene_databases/Presynaptic.txt" or die "cannot open file";
my %Presynaptic; while (my $line17=<FILE17>) { chomp($line17); $Presynaptic{$line17} = ''; }

#Synaptic_Vesicles.txt
open FILE18, "$working_dir/gene_databases/Synaptic_Vesicles.txt" or die "cannot open file";
my %Synaptic_Vesicles; while (my $line18=<FILE18>) { chomp($line18); $Synaptic_Vesicles{$line18} = ''; }


#CHD8.txt
open FILE19, "$working_dir/gene_databases/CHD8.txt" or die "cannot open file";
my %CHD8; while (my $line19=<FILE19>) { chomp($line19); $CHD8{$line19} = ''; }

#LOUEF.txt
open FILE20, "$working_dir/gene_databases/LOUEF.txt" or die "cannot open file";
my %LOUEF; while (my $line20=<FILE20>) { chomp($line20); $LOUEF{$line20} = ''; }

#pLI.txt
open FILE21, "$working_dir/gene_databases/pLI.txt" or die "cannot open file";
my %pLI; while (my $line21=<FILE21>) { chomp($line21); $pLI{$line21} = ''; }


open(my $outfile, ">","$working_dir/processed_files/ped.$pedigree.stoploss.bap.gene.res") or die "cannot open file";

print {$outfile}"#Chr\tStart\tEnd\tRef\tAlt\tFunc.refGene\tGene.refGene\tGeneDetail.refGene\tExonicFunc.refGene\tAAChange.refGene\tcytoBand\tgenomicSuperDups\tesp6500siv2_ea\t1000g2015aug_all\t1000g2015aug_afr\t1000g2015aug_amr\t1000g2015aug_eas\t1000g2015aug_eur\t1000g2015aug_sas\tExAC_ALL\tExAC_AFR\tExAC_AMR\tExAC_EAS\tExAC_FIN\tExAC_NFE\tExAC_OTH\tExAC_SAS\tavsnp150\tCLNALLELEID\tCLNDN\tCLNDISDB\tCLNREVSTAT\tCLNSIG\tAF\tAF_popmax\tAF_male\tAF_female\tAF_raw\tAF_afr\tAF_sas\tAF_amr\tAF_eas\tAF_nfe\tAF_fin\tAF_asj\tAF_oth\tnon_topmed_AF_popmax\tnon_neuro_AF_popmax\tnon_cancer_AF_popmax\tcontrols_AF_popmax\tREVEL\tSIFT_score\tSIFT_converted_rankscore\tSIFT_pred\tPolyphen2_HDIV_score\tPolyphen2_HDIV_rankscore\tPolyphen2_HDIV_pred\tPolyphen2_HVAR_score\tPolyphen2_HVAR_rankscore\tPolyphen2_HVAR_pred\tLRT_score\tLRT_converted_rankscore\tLRT_pred\tMutationTaster_score\tMutationTaster_converted_rankscore\tMutationTaster_pred\tMutationAssessor_score\tMutationAssessor_score_rankscore\tMutationAssessor_pred\tFATHMM_score\tFATHMM_converted_rankscore\tFATHMM_pred\tPROVEAN_score\tPROVEAN_converted_rankscore\tPROVEAN_pred\tVEST3_score\tVEST3_rankscore\tMetaSVM_score\tMetaSVM_rankscore\tMetaSVM_pred\tMetaLR_score\tMetaLR_rankscore\tMetaLR_pred\tM-CAP_score\tM-CAP_rankscore\tM-CAP_pred\tCADD_raw\tCADD_raw_rankscore\tCADD_phred\tDANN_score\tDANN_rankscore\tfathmm-MKL_coding_score\tfathmm-MKL_coding_rankscore\tfathmm-MKL_coding_pred\tEigen_coding_or_noncoding\tEigen-raw\tEigen-PC-raw\tGenoCanyon_score\tGenoCanyon_score_rankscore\tintegrated_fitCons_score\tintegrated_fitCons_score_rankscore\tintegrated_confidence_value\tGERP++_RS\tGERP++_RS_rankscore\tphyloP100way_vertebrate\tphyloP100way_vertebrate_rankscore\tphyloP20way_mammalian\tphyloP20way_mammalian_rankscore\tphastCons100way_vertebrate\tphastCons100way_vertebrate_rankscore\tphastCons20way_mammalian\tphastCons20way_mammalian_rankscore\tSiPhy_29way_logOdds\tSiPhy_29way_logOdds_rankscore\tInterpro_domain\tGTEx_V6_gene\tGTEx_V6_tissue\tOtherinfo\tOtherinfo2\tOtherinfo3\tOtherinfo4\tOtherinfo5\tOtherinfo6\tOtherinfo7\tOtherinfo8\tOtherinfo9\tOtherinfo10\tOtherinfo11\tOtherinfo12\tOtherinfo13\tref_depth\talt_depth\tper_33_ad\tHet_Hom\tfamily_number\tsample_number\tSfari\tSpark\tCHD8\tLOUEF\tpLI\tSatterstrom\tRubeis\tautismKB\tEpilepsy\tAllen\tAtlas\tQuickGO\tmapk\tAxon_guidance\twnt\tmRNA_splicing\tRegulation\tPostsynaptic_Density\tPresynaptic_ActiveZone\tPresynaptic\tSynaptic_Vesicles\n";

open FILE99, "$working_dir/processed_files/ped.$pedigree.stoploss.bap.out" or die;

 while (my $line99=<FILE99>){
      chomp($line99);
      if ($line99 =~ m/^#Chr/){next;}

      my($b1,$b2,$b3,$b4,$b5,$b6,$gene) = split /\t/, $line99;
 			print {$outfile}"\n$line99";

        if(exists ($sfari{$gene})){ print {$outfile}"\tYes"; }else { print {$outfile}"\tNo" }
				 
			 	if(exists ($spark{$gene})) { print {$outfile}"\tYes";}else { print {$outfile}"\tNo";}
			
			 	if(exists ($CHD8{$gene})) { print {$outfile}"\tYes";}else { print {$outfile}"\tNo";}
				
			 	if(exists ($LOUEF{$gene})) { print {$outfile}"\tYes";}else { print {$outfile}"\tNo";}
				
			 	if(exists ($pLI{$gene})) { print {$outfile}"\tYes";}else { print {$outfile}"\tNo";}
				
					
				if(exists ($Satterstrom{$gene})){ print {$outfile}"\tYes";}else { print {$outfile}"\tNo"; } 
				
				if(exists ($Rubeis{$gene})){ print {$outfile}"\tYes";}else { print {$outfile}"\tNo"; } 
					
				if(exists ($autismKB{$gene})){ print {$outfile}"\tYes";}else { print {$outfile}"\tNo"; } 
						
				if(exists ($Epilepsy{$gene})){ print {$outfile}"\tYes";}else { print {$outfile}"\tNo"; } 
						
				if(exists ($Allen{$gene})){ print {$outfile}"\tYes";}else { print {$outfile}"\tNo"; } 
				
				if(exists ($Atlas{$gene})){ print {$outfile}"\tYes";}else { print {$outfile}"\tNo"; } 
				
				if(exists ($QuickGO{$gene})){ print {$outfile}"\tYes";}else { print {$outfile}"\tNo"; } 
				
				if(exists ($mapk{$gene})){ print {$outfile}"\tYes";}else { print {$outfile}"\tNo"; } 
				
				if(exists ($Axon_guidance{$gene})){ print {$outfile}"\tYes";}else { print {$outfile}"\tNo"; } 
				
				if(exists ($wnt{$gene})){ print {$outfile}"\tYes";}else { print {$outfile}"\tNo"; } 
				
			  if(exists ($mRNA_splicing{$gene})){ print {$outfile}"\tYes";}else { print {$outfile}"\tNo"; } 
			  
			  if(exists ($Regulation{$gene})){ print {$outfile}"\tYes";}else { print {$outfile}"\tNo"; } 
			  
				if(exists ($Postsynaptic_Density{$gene})){ print {$outfile}"\tYes";}else { print {$outfile}"\tNo"; } 
				
				if(exists ($Presynaptic_ActiveZone{$gene})){ print {$outfile}"\tYes";}else { print {$outfile}"\tNo"; } 
				
				if(exists ($Presynaptic{$gene})){ print {$outfile}"\tYes";}else { print {$outfile}"\tNo"; } 
				
				if(exists ($Synaptic_Vesicles{$gene})){ print {$outfile}"\tYes";}else { print {$outfile}"\tNo"; } 
				
		 }
      
