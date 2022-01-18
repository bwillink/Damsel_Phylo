#!bin/bash/

# PMTR
# align
prank -d=PMTR_allspp.fst -o=PMTR_allspp -iterate=20 -scalebranches=2

# clip primer and longer seqs from NCBI
# selectSite.pl script by Naoki Takebayashi (GPL)
# positions can be different in other PRANK alignments as ties are resolved randomly
perl ./perl/selectSite.pl -s '250-999' ../data/processed/mol/PMTR_allspp.best.fas > ../data/processed/mol/PMTR_allspp_trim.fst

# remove identifier to concatenate
cat ../data/processed/mol/PMTR_allspp_trim.fst | sed -E 's/_BEA[0-9]{3}//' \
                                              | sed -E 's/_[A-Z]{2}[0-9]{6}.[0-9]//' \
                                              | sed -E 's/_DIJ[0-9]{3}//' \
                                              | sed -E 's/_RMNH.INS.[0-9]{6}//' > ../data/processed/mol/PMTR_spp.fst
# sort for clarity
perl ./perl/fastaSortByName.pl ../data/processed/mol/PMTR_spp.fst > ../data/processed/mol/PMTR_spp_sorted.fst

# get exon only fasta for codon saturation
perl ./perl/selectSite.pl -s '2-105,321-476,667-750' ../data/processed/mol/PMTR_spp.fst > ../data/processed/mol/PMTR_exon_pruned.fst
