#!/usr/bin/perl

my $famname = $ARGV[0]; 

my $samplepath = $ARGV[1];

open (TXTFILE, "$samplepath/processed_files/res.$famname.indel.DignoVarFilter.out") or die "Cannot open the file $!";

open(my $outfile1, ">","$samplepath/processed_files/res.$famname.indel.DignoVarFilter.dup.out");

my @line=(); @strings=();
while (<TXTFILE>)
{ chomp;
  my ($c1,$c2,$c3,$c4,$c5,$c6,$c7,$c8,$c9,$c10,$c11,$c12,$c13,$c14,$c15,$c16,$c17,$c18,$c19,$c20) = split /\t/, $_;
my @col = split /\t/, $_;

my $string = "$col[8]\t$col[0]\t$col[1]\t$col[2]\t$col[3]\t$col[4]\t$col[5]\t$col[6]\t$col[7]\t$col[8]\t$col[10]\t$col[11]\t$col[12]\t$col[29]\t$col[44]\t$col[55]\t$col[58]\t$col[136]\t$col[138]\t$col[139]\t$col[140]\t$col[141]\t$col[142]\t$col[143]\t$col[144]\t$col[145]\t$col[146]\t$col[147]\t$col[148]\t$col[149]\t$col[150]\t$col[151]\t$col[152]\t$col[153]\t$col[154]\t$col[155]\t$col[156]\t$col[157]\t$col[158]";
push @strings, "$string"if ("$col[7]" eq 'exonic');

my $temp = "$c9;$c3;$c4;$c1" if ($c8 eq 'exonic');
push @array, "$temp";
}

open(my $outfile, ">","$samplepath/processed_files/res.$famname.indel.DignoVarFilter.out.count");

chomp(@array);

my %count;
$count{$_}++ foreach @array;

foreach my $key (sort(keys %count)) {
       print {$outfile} "$key\t$count{$key}\n"; #$key, '=', $count{$key}, "\n";
   }

chomp(@strings);

# remove dup
#my @test_array = qw/ 1 2 3 3 4 5 /;
my %temp_hash = map { $_, 0 } @strings;
my @uniq_array = keys %temp_hash;
#print "@uniq_array\n";

# sort array alphabet
my @sorted_uniq_array = sort { lc($a) cmp lc($b) } @uniq_array;
print {$outfile1} "SNV's\tGene\tPhenotype\tHet/Hom\tChr\tStart\tEnd\tRef\tAlt\tFunc.refGene\tGene.refGene\tExonicFunc.refGene\tAAChange.refGene\tcytoBand\tavindel150\tAF_nfe\tSIFT_pred\tPolyphen2_HDIV_pred\tfamily_number\tSfari\tSpark\tCHD8\tLOUEF\tpLI\tSatterstrom\tRubeis\tautismKB\tEpilepsy\tAllen\tAtlas\tQuickGO\tmapk\tAxon_guidance\twnt\tmRNA_splicing\tRegulation\tPostsynaptic_Density\tPresynaptic_ActiveZone\tPresynaptic\tSynaptic_Vesicles\tGene;Chr;Pos\tFrequencies\n";
# print array string
foreach my $item (@sorted_uniq_array) {
print {$outfile1} "INDEL\t$item\n";
}




