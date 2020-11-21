#!/usr/bin/perl

#USAGE: perl 2_indel_damaging.pl GF15 $samplepath/input_annovar_annotated_txt_files/dignosis

my $famname = $ARGV[0]; #GF15

my $samplepath = $ARGV[1];# "$samplepath/input_annovar_annotated_txt_files/dignosis";

open (TXTFILE, "$samplepath/processed_files/fam_n_com.vpr") or die "fam_n_com.vpr";#search file

open(my $outfile1, ">","$samplepath/processed_files/fam.$famname.dam");

while (<TXTFILE>)
{
chomp;
#   my ($c1,$c2,$c3,$c4,$c5,$c6,$c7,$c8,$c9,$c10,$c11,$c12,$c13,$c14,$c15,$c16,$c17,$c18,$c19,$c20) = split /\t/, $_;
my (@rest)=split (/\t/);
print $outfile1 "$_\n" if ($_ =~ m/Chr\tStart/);

#set 1+ set 2 = all damaging
# set 1: all five algorithms predicted as damaging
if (($rest[8] eq 'frameshift insertion')||($rest[8] eq 'frameshift deletion')||($rest[8] eq stopgain)||($rest[8] eq stoploss)||($rest[8] eq 'nonframeshift deletion')||($rest[8] eq 'nonframeshift insertion'))
{
print $outfile1 "$_\n";
}

}
