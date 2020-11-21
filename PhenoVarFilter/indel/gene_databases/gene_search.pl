#!/usr/bin/perl

my @array = qw( Axon_guidance Epilepsy input mapk mRNA_splicing Postsynaptic_Density Presynaptic Presynaptic_ActiveZone QuickGO Regulation Rubeis Satterstrom Sfari Spark Synaptic_Vesicles wnt Allen Atlas autismKB );
open(my $outfile, ">","/mnt/b2/home4/arc/rm975/softwares/gene_search/input.out");

foreach $file (@array) {
 print {$outfile} "\n#$file\n\n";
open FILE1, "/mnt/b2/home4/arc/rm975/softwares/gene_search/$file.txt" or die;

my %hash = {};
while (my $line=<FILE1>) {
   chomp($line);
    my ($a1,$a2) = split /\t/, $line;
    #my $temp= "$a2\t$a3\t$a4\t$a5\t$a6";
   $hash{$line} = "";
}
#close (FILE1);

open (TXTFILE, "/mnt/b2/home4/arc/rm975/softwares/gene_search/input.txt") or die;  #search file

while (<TXTFILE>)
{
chomp;
 my ($a1,$a2,$a3,$a4,$a5,$a6,$a7,$a8) = split /\t/, $_;

 if (exists($hash{$_})){
           print {$outfile} "1\n";
           } else {  print {$outfile} "0\n";
                 }
 }


 }
