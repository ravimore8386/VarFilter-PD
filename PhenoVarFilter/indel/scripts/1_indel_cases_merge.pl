#!/usr/bin/perl
my $famname = $ARGV[0];

my $samplepath = $ARGV[1];

open(my $outfile, ">","$samplepath/processed_files/fam_n_com.vpr") or die "Cannot open the file $!";

my @cases=();
open TXTFILE, "$samplepath/input_samples_details/input_all_cases.txt" or die "Cannot open the file $!"; #search contorl file
while (my $line1=<TXTFILE>) {
     chomp($line1);
        my($a1,$a2) = split /\t/, $line1;
        push @cases, "$a2";
      #  print {$outfile}"$sample\thet\t$line\n"if ($line =~ m/exonic/);
}
chomp($cases);

foreach $sample (@cases) {
open FILE, "$samplepath/input_annovar_annotated_txt_files/$sample.indel.txt" or die "Cannot open the file $!"; #search contorl file
        while (my $line=<FILE>) {
         chomp($line);
                if ($line !~ m/^Chr/){
            #    print {$outfile}"$line\t$famname\t$sample\n";
                my $temp = "$line\t$famname\t$sample";
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
