#!/usr/bin/perl

#USAGE: perl 11_nap_count.pl GF15 $samplepath/input_annovar_annotated_txt_files/dignosis 2

my $famname = $ARGV[0]; #GF15

my $samplepath = $ARGV[1];# "$samplepath/input_annovar_annotated_txt_files/dignosis";

my $total_samples = $ARGV[2]; # 2 (nap) samples 

my @cases;
my @chrposcases;


open(my $outfile, ">","$samplepath/processed_files/fam.$famname.nap.cnt") or die "Cannot open the file $!";

#nap file
open FR,"$samplepath/processed_files/fam.$famname.nap" || die("Cannot open the file $!");

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