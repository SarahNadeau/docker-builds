# Thanks: http://etutorials.org/Programming/perl+bioinformatics/Part+II+Perl+and+Bioinformatics/Chapter+9.+Introduction+to+Bioperl/9.3+Testing+Bioperl/

use Bio::Perl;

$seq_object = get_sequence('swiss',"ROA1_HUMAN");

write_sequence(">roa1.fasta",'fasta',$seq_object);