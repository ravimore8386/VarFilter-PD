#!/usr/bin/perl

#USAGE: perl 51_stoploss_count_bap.pl GF18 /mnt/b2/home4/arc/rm975/wgs/pedigree/GF18/variant_prio/snp/het 4

my $pedigree = $ARGV[0]; #GF18

my $working_dir = $ARGV[1];# "/mnt/b2/home4/arc/rm975/wgs/pedigree/GF18/variant_prio/snp/het";

my $total_samples = $ARGV[2]; # 4 (nap+bap+bap) samples 

my @cases;
my @chrposcases;

open(my $outfile, ">","$working_dir/processed_files/ped.$pedigree.stoploss.bap.cnt") or die "Cannot open the file $!";

#bap file
open FR,"$working_dir/processed_files/ped.$pedigree.stoploss.bap" || die("Cannot open the file $!");

while (my $line =<FR>){
chomp ($line);   # Remove end space of line
my (@cols) = split /\t/, $line;
my $chrpos= "$cols[0]:$cols[1]:$cols[6]";
#print "$chrpos\n";
  push(@chrposcases, "$chrpos");
}

chomp(@chrposcases);

 my %count;
$count{$_}++ foreach @chrposcases;

while (my ($key, $value) = each(%count))
{
    if ($value == 1)
  {
  }

   #  print "$key\t$value\n";     # #output the counts
   print {$outfile}"$key\t$value\n"  if ($value >= $total_samples);   # #output the counts in outfile

  }