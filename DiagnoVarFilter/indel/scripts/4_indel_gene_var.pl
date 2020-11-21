#!/usr/bin/perl

#USAGE: perl 4_indel_gene_var.pl GF15 $samplepath/input_annovar_annotated_txt_files/dignosis

my $famname = $ARGV[0]; #GF15


my $samplepath = $ARGV[1];# "$samplepath/input_annovar_annotated_txt_files/dignosis";


open(my $infile, "$samplepath/processed_files/fam.$famname.dam") or die "cannot open file fam.$famname.dam";

open(my $outfile1, ">","$samplepath/processed_files/fam.$famname.dam.var");

open(my $outfile2, ">","$samplepath/processed_files/fam.$famname.dam.var.gcnt");

my %seen; my @genes=();

while (<$infile>) {
    chomp;
    my ($c1, $c2, $c3, $c4, $c5, $c6, $c7) = split(/\t/);
    unless (defined $seen{"$c1\t$c2"}) {
        print $outfile1 "$_\n";  push @genes, "$c7";
        $seen{"$c1\t$c2"} = 1;
#        
    }
}

#close ($infile);


#my @genes_uniqe = uniq(@genes);   my $size_genes = @genes_uniqe;
#print $outfile "######\n";
my $size=@genes;
#print $outfile2 "#Total_Variants=$size\n";

print $outfile2 "$_ $_{$_}\n" for grep !$_{$_}++, @genes;



#sub uniq {
 #   my %seen;
  #  grep !$seen{$_}++, @_;



