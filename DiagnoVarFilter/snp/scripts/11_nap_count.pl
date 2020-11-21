#!/usr/bin/perl

#USAGE: perl 11_cases_count.pl GF11 /mnt/b2/home4/arc/rm975/wgs/pedigree/GF18/variant_prio/snp/DiagnoVarFilter/dignosis 2

my $famname = $ARGV[0]; #GF11

my $samplepath = $ARGV[1];# "/mnt/b2/home4/arc/rm975/wgs/pedigree/GF18/variant_prio/snp/DiagnoVarFilter/dignosis";

my $total_samples = $ARGV[2]; # 2 (cases) samples 

my @cases;
my @chrposcases;


open(my $outfile, ">","$samplepath/processed_files/fam.$famname.cases.cnt") or die "Cannot open the file $!";

#cases file
open FR,"$samplepath/processed_files/fam.$famname.cases" || die("Cannot open the file $!");

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