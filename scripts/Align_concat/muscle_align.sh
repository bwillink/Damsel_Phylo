#!bin/bash/

# COI
# align
time muscle -in ../data/raw/COI_allspp_unaligned.fst -out ../data/processed/mol/COI_allspp.fst

# clip primer and longer seqs from NCBI
# selectSite.pl script by Naoki Takebayashi (GPL) 
perl ./perl/selectSite.pl -s '207-687' ../data/processed/mol/COI_allspp.fst > ../data/processed/mol/COI_allspp_trim.fst

# remove identifier to concatenate
cat ../data/processed/mol/COI_allspp_trim.fst | sed -E 's/_BEA[0-9]{3}//' \
                                              | sed -E 's/_[A-Z]{2}[0-9]{6}.[0-9]//' \
                                              | sed -E 's/_DIJ[0-9]*//' \
                                              | sed -E 's/_RMNH.INS.[0-9]{6}//' > ../data/processed/mol/COI_spp.fst
# sort for clarity
perl ./perl/fastaSortByName.pl ../data/processed/mol/COI_spp.fst > ../data/processed/mol/COI_spp_sorted.fst

# H3
# align
time muscle -in ../data/raw/H3_allspp_unaligned.fst -out ../data/processed/mol/H3_allspp.fst

# clip primer and longer seqs from NCBI
# selectSite.pl script by Naoki Takebayashi (GPL) 
perl ./perl/selectSite.pl -s '24-351' ../data/processed/mol/H3_allspp.fst > ../data/processed/mol/H3_allspp_trim.fst

# remove identifier to concatenate
cat ../data/processed/mol/H3_allspp_trim.fst | sed -E 's/_BEA[0-9]{3}//' \
                                              | sed -E 's/_[A-Z]{2}[0-9]{6}.[0-9]//' \
                                              | sed -E 's/_DIJ[0-9]*//' \
                                              | sed -E 's/_RMNH.INS.[0-9]{6}//' > ../data/processed/mol/H3_spp.fst
# sort for clarity
perl ./perl/fastaSortByName.pl ../data/processed/mol/H3_spp.fst > ../data/processed/mol/H3_spp_sorted.fst
