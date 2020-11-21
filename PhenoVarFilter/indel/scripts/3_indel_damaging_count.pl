#!/usr/bin/perl

#USAGE: perl 3_indel_damaging_count.pl GF18 /mnt/b2/home4/arc/rm975/wgs/pedigree/GF18/variant_prio/indel/het2

my $famname = $ARGV[0]; #GF18


my $samplepath = $ARGV[1];# "/mnt/b2/home4/arc/rm975/wgs/pedigree/GF18/variant_prio/indel/het2";


open FILE1, "$samplepath/processed_files/fam.$famname.dam" or die "can not open file fam.$famname.dam";

my @chr=(); my @genes=(); my @chr_uniqe=();  my @genes_uniqe=();

while (my $line=<FILE1>) {
   chomp($line);
        if ($line =~ m/Start/){next;}
   my (@lines) = split /\t/, $line;

   my $chrpos= "$lines[0]:$lines[1]";
   push @chr, "$chrpos";
   push @genes, "$lines[6]";
}

open(my $outfile, ">","$samplepath/processed_files/fam.$famname.dam.cnt");

#print $outfile "damaging\n";


@chr_uniqe = uniq(@chr);   my $size_chr = @chr_uniqe;
@genes_uniqe = uniq(@genes);   my $size_genes = @genes_uniqe;

foreach my $ch (@chr_uniqe) {  print $outfile "$ch,"; }
print $outfile "\t$size_chr\n";

foreach my $gen (@genes_uniqe) {  print $outfile "$gen,"; }
print $outfile "\t$size_genes\n";

#print $outfile "$_ $_{$_}\n" for grep !$_{$_}++, @genes_uniqe;

close (FILE1);


sub uniq {
    my %seen;
    grep !$seen{$_}++, @_;
}



