#!bin/bash/

# D7
# align
time muscle -in ../data/raw/D7_allspp_unaligned.fst -out ../data/processed/mol/D7_allspp.fst

# visual verification of secondary structure here
# file saved to D7_allspp_corrected.fst

# clip primer, high AT content and longer seqs from NCBI
# selectSite.pl script by Naoki Takebayashi (GPL) 
perl ./perl/selectSite.pl -s '2312-2507, 2576-2970' ../data/processed/mol/D7_allspp_corrected.fst > ../data/processed/mol/D7_allspp_trim.fst

# remove identifier to concatenate
cat ../data/processed/mol/D7_allspp_trim.fst | sed -E 's/_BEA[0-9]{3}//' \
                                              | sed -E 's/_[A-Z]{2}[0-9]{6}.[0-9]//' \
                                              | sed -E 's/_DIJ[0-9]*//' \
                                              | sed -E 's/_RMNH.INS.[0-9]{6}//' > ../data/processed/mol/D7_spp.fst

# sort for clarity
perl ./perl/fastaSortByName.pl ../data/processed/mol/D7_spp.fst > ../data/processed/mol/D7_spp_sorted.fst

# 16S
# align
time muscle -in ../data/raw/16S_allspp_unaligned.fst -out ../data/processed/mol/16S_allspp.fst

# sort for clarity
perl ./perl/fastaSortByName.pl ../data/processed/mol/16S_allspp.fst > ../data/processed/mol/16S_allspp_sorted.fst

# visual verification of secondary structure here
# file saved to 16S_allspp_corrected.fst

# clip primer and longer seqs from NCBI
# selectSite.pl script by Naoki Takebayashi (GPL) 
perl ./perl/selectSite.pl -s '21-30,41-64,77-179, 198-265,329-440' ../data/processed/mol/16S_allspp_corrected.fst > ../data/processed/mol/16S_allspp_trim.fst

# remove identifier to concatenate
cat ../data/processed/mol/16S_allspp_trim.fst | sed -E 's/_BEA[0-9]{3}//' \
                                              | sed -E 's/_[A-Z]{2}[0-9]{6}.[0-9]//' \
                                              | sed -E 's/_DIJ[0-9]*//' \
                                              | sed -E 's/_RMNH.INS.[0-9]{6}//' > ../data/processed/mol/16S_spp.fst
# sort for clarity
perl ./perl/fastaSortByName.pl ../data/processed/mol/16S_spp.fst > ../data/processed/mol/16S_spp_sorted.fst
