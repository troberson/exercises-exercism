def to_rna(dna_strand: str) -> str:
    return dna_strand.translate(str.maketrans('GCTA', 'CGAU'))
