#!/bin/bash

# Remove partition block
cat ../data/processed/mol/Coen.mol.final.nex | head -677 > ../data/processed/nxs/Coen.mol.no_parts.nex

# only genes and exon/intron as partitions
cat ../data/processed/nxs/Coen.mol.no_parts.nex ../data/processed/nxs/M1.partitions.nex > ../data/processed/nxs/M1.mol.nex

# codons 1/2, 3
cat ../data/processed/nxs/Coen.mol.no_parts.nex ../data/processed/nxs/M2.partitions.nex > ../data/processed/nxs/M2.mol.nex 

# codons 1,2,3 for COI; 1/2, 3 for H3 and PMTR
cat ../data/processed/nxs/Coen.mol.no_parts.nex ../data/processed/nxs/M3.partitions.nex > ../data/processed/nxs/M3.mol.nex 

# codons 1,2,3 for COI and H3; 1/2, 3 for PMTR
cat ../data/processed/nxs/Coen.mol.no_parts.nex ../data/processed/nxs/M4.partitions.nex > ../data/processed/nxs/M4.mol.nex 

# codons 1,2,3 for COI and PMTR; 1/2, 3 for H3
cat ../data/processed/nxs/Coen.mol.no_parts.nex ../data/processed/nxs/M5.partitions.nex > ../data/processed/nxs/M5.mol.nex 

# codons 1,2,3
cat ../data/processed/nxs/Coen.mol.no_parts.nex ../data/processed/nxs/M6.partitions.nex > ../data/processed/nxs/M6.mol.nex 
