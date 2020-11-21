#!/usr/bin/perl
my $pedigree = $ARGV[0];

my $working_dir = $ARGV[1];

open(my $outfile, ">","$working_dir/processed_files/fam_n_com.vpr") or die "Cannot open the file $!";  #output

my @cases=();
open TXTFILE, "$working_dir/input_samples_details/input_cases.txt" or die "Cannot open the file $!"; #input
while (my $line1=<TXTFILE>) {
     chomp($line1);
        my($a1,$a2) = split /\t/, $line1;
        push @cases, "$line1";
      #  print {$outfile}"$sample\tDiagnoVarFilter\t$line\n"if ($line =~ m/exonic/);
}
chomp($cases);

foreach $sample (@cases) {
open FILE, "$working_dir/input_annovar_annotated_txt_files/$sample.snp.txt" or die "Cannot open the file $!"; #input
        while (my $line=<FILE>) {
         chomp($line);
                if ($line !~ m/^Chr/){
            #    print {$outfile}"$line\t$pedigree\t$sample\n";
                my $temp = "$line\t$pedigree\t$sample";
                push @allcases, "$temp";
                }
         }
}

chomp(@allcases);

# sort array alphabet
my @sorted_allcases = sort { lc($a) cmp lc($b) } @allcases;

foreach my $item (@sorted_allcases) {
print {$outfile} "$item\n";
}
