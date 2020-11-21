#!/usr/bin/perl

#USAGE: perl 6_snp_get_var_sample.pl GF18 /mnt/b2/home4/arc/rm975/wgs/pedigree/GF18/variant_prio/snp/het

my $pedigree = $ARGV[0]; #GF18

my $working_dir = $ARGV[1];# "/mnt/b2/home4/arc/rm975/wgs/pedigree/GF18/variant_prio/snp/het";

open FILE1, "$working_dir/processed_files/ped.$pedigree.dam.nfe" or die "cannot open file fam.$pedigree.dam.nfe";

my %hash={};
while (my $line=<FILE1>) {
   chomp($line);
   my ($b1,$b2,$b3) = split /\t/, $line;
   $hash{"$b1:$b2"} = "";
}


open(my $outfile, ">","$working_dir/processed_files/ped.$pedigree.dam.nfe.sam");


open (TXTFILE, "$working_dir/processed_files/ped.$pedigree.dam") or die "cannot open file fam_n_com.vpr.dam";  #search file

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


