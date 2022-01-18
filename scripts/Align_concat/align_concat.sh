#!/bin/bash

# Align sequences
bash ./Align_concat/muscle_align.sh
bash ./Align_concat/ribosomal_align.sh
bash ./Align_concat/pmtr_align.sh

# Make nexus
perl ./perl/convertfasta2nex.pl ../data/processed/mol/COI_spp_sorted.fst > ../data/processed/mol/COI.nex
perl ./perl/convertfasta2nex.pl ../data/processed/mol/H3_spp_sorted.fst > ../data/processed/mol/H3.nex
perl ./perl/convertfasta2nex.pl ../data/processed/mol/PMTR_spp_sorted.fst > ../data/processed/mol/PMTR.nex
perl ./perl/convertfasta2nex.pl ../data/processed/mol/16S_spp_sorted.fst > ../data/processed/mol/16S.nex
perl ./perl/convertfasta2nex.pl ../data/processed/mol/D7_spp_sorted.fst > ../data/processed/mol/D7.nex

# Concatenate
python2.7 ./py/Concatenate.py

# Update taxon names
cat ../data/processed/mol/Coen.mol.nex | sed -E 's/Elattoneura_tropicalis/Elattoneura_cellularis/' | \
                                         sed -E 's/Prodasineura_humeralis/Prodasineura_verticalis/' | \
                                         sed -E 's/Copera_tokyoensis/Pseudocopera_rubripes/' | \
                                         sed -E 's/Copera_annulata/Pseudocopera_annulata/' | \
                                         sed -E 's/Chlorocnemis_marshalli/Allocnemis_marshalli/' | \
                                         sed -E 's/Chlorocnemis_abbotti/Allocnemis_abbotti/' | \
                                         sed -E 's/Teinobasis_filamentum/Teinobasis_filamenta/' | \
                                         sed -E 's/Mecistogaster_asticta/Platystigma_astictum/' | \
                                         sed -E 's/Mecistogaster_jocaste/Platystigma_jocaste/' | \
                                         sed -E 's/Mecistogaster_martinezi/Platystigma_martinezi/' | \
                                         sed -E 's/Metaleptobasis_mauritia/Metaleptobasis_bicornis/' | \
                                         sed -E 's/Coenagriocnemis_insulare/Coenagriocnemis_insularis/' | \
                                         sed -E 's/Aciagrion_tillyardi/Aciagrion_approximans/' | \
                                         sed -E 's/Mesoleptobasis_centralli/Mesoleptobasis_cantralli/' > ../data/processed/mol/Coen.mol.final.nex
