#!/usr/bin/perl

#USAGE: perl 11_nap_count.pl GF18 /mnt/b2/home4/arc/rm975/wgs/pedigree/GF18/variant_prio/snp/het 2

my $pedigree = $ARGV[0]; #GF18

my $working_dir = $ARGV[1];# "/mnt/b2/home4/arc/rm975/wgs/pedigree/GF18/variant_prio/snp/het";

my $total_samples = $ARGV[2]; # 2 (nap) samples 

my @cases;
my @chrposcases;

open(my $outfile, ">","$working_dir/processed_files/ped.$pedigree.nap.cnt") or die "Cannot open the file $!";

#nap file
open FR,"$working_dir/processed_files/ped.$pedigree.nap" || die("Cannot open the file $!");

while (my $line =<FR>){
chomp ($line);   # Remove end space of line
my (@cols) = split /\t/, $line;
my $chrpos= "$cols[0]:$cols[1]:$cols[6]";
#print "$chrpos\n";
  push(@chrposcases, "$chrpos");
}


 # my @array = <FILE>;
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