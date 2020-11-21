#!/usr/bin/perl

#USAGE: perl 2_snp_damaging_var.pl GF18 /mnt/b2/home4/arc/rm975/wgs/pedigree/GF18/variant_prio/snp/het

my $pedigree = $ARGV[0]; #GF18

my $working_dir = $ARGV[1];# "/mnt/b2/home4/arc/rm975/wgs/pedigree/GF18/variant_prio/snp/het";

open (TXTFILE, "$working_dir/processed_files/ped_n_com.vpr") or die "fam_n_com.vpr";#search file

open(my $outfile1, ">","$working_dir/processed_files/ped.$pedigree.dam");

open(my $outfile2, ">","$working_dir/processed_files/ped.$pedigree.siftpoly.dam");

open(my $outfile3, ">","$working_dir/processed_files/ped.$pedigree.stopgain");

open(my $outfile4, ">","$working_dir/processed_files/ped.$pedigree.stoploss");

  while (<TXTFILE>)
  { chomp;
  #   my ($c1,$c2,$c3,$c4,$c5,$c6,$c7,$c8,$c9,$c10,$c11,$c12,$c13,$c14,$c15,$c16,$c17,$c18,$c19,$c20) = split /\t/, $_;
  my (@rest)=split (/\t/);
  print $outfile1 "$_\n" if ($_ =~ m/Chr\tStart/);
  #print $outfile2 "$_\n" if ($_ =~ m/Chr\tStart/);

  #set 1+ set 2 = all damaging
  # set 1: all five algorithms predicted as damaging
    
	if (($rest[8] eq 'nonsynonymous SNV')&&($rest[53] eq D)||($rest[56] eq D)||($rest[56] eq P))
	{
	print $outfile1 "$_\n";
	} 
	
		if (($rest[8] eq 'nonsynonymous SNV')&&($rest[53] eq D)&&($rest[56] eq D)||($rest[56] eq P))
	{
	print $outfile2 "$_\n";
	} 
	
	else {
    print $outfile3 "$_\n" if ($rest[8] eq stopgain);
        print $outfile4 "$_\n" if ($rest[8] eq stoploss);
    }
	
  }
#}
