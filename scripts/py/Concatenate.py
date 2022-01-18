from Bio.Nexus import Nexus
file_list = ['../data/processed/mol/COI.nex', '../data/processed/mol/H3.nex', '../data/processed/mol/PMTR.nex','../data/processed/mol/16S.nex','../data/processed/mol/D7.nex']
nexi =  [(fname, Nexus.Nexus(fname)) for fname in file_list]
combined = Nexus.combine(nexi)
combined.write_nexus_data(filename=open('../data/processed/mol/Coen.mol.nex', 'w'))
