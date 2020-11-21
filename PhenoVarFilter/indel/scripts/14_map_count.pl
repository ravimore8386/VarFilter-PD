#!/usr/bin/perl

#USAGE: perl 16_map_count.pl GF18 /mnt/b2/home4/arc/rm975/wgs/pedigree/GF18/variant_prio/indel/het2 3

my $famname = $ARGV[0]; #GF18

my $samplepath = $ARGV[1];# "/mnt/b2/home4/arc/rm975/wgs/pedigree/GF18/variant_prio/indel/het2";

my $total_samples = $ARGV[2]; # 3 (nap+map) samples 

my @cases;
my @chrposcases;

open(my $outfile, ">","$samplepath/processed_files/fam.$famname.map.cnt") or die "Cannot open the file $!";

#nap file
open FR,"$samplepath/processed_files/fam.$famname.map" || die("Cannot open the file $!");

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