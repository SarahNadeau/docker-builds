import filecmp
import re
import subprocess
from subprocess import PIPE
import unittest


class TestValidCases(unittest.TestCase):

    def test_gubbins(self):
        cmd = "mask_recombination.py --alignment /tests/files/aligned.fasta --format 'gubbins' --rec_positions /tests/files/all_affected_gubbins.gff --tree /tests/files/test.newick > /tests/files/all_affected_gubbins_test_result.fasta"
        subprocess.run(cmd, shell=True)
        assert filecmp.cmp("/tests/files/all_affected_gubbins_test_result.fasta", "/tests/files/all_affected_gubbins_result.fasta")

    def test_cfml(self):
        cmd = "mask_recombination.py --alignment /tests/files/aligned.fasta --format 'clonalframeml' --rec_positions /tests/files/all_affected_cfml.txt --tree /tests/files/test.newick > /tests/files/all_affected_cfml_test_result.fasta"
        subprocess.run(cmd, shell=True)
        assert filecmp.cmp("/tests/files/all_affected_cfml_test_result.fasta", "/tests/files/all_affected_cfml_result.fasta")

    def test_cfml_some_unaffected(self):
        cmd = "mask_recombination.py --alignment /tests/files/aligned.fasta --format 'clonalframeml' --rec_positions /tests/files/some_unaffected_cfml.txt --tree /tests/files/test.newick > /tests/files/some_unaffected_cfml_test_result.fasta"
        subprocess.run(cmd, shell=True)
        assert filecmp.cmp("/tests/files/some_unaffected_cfml_test_result.fasta", "/tests/files/some_unaffected_cfml_result.fasta")


class TestInvalidCases(unittest.TestCase):

    def test_unaligned(self):
        cmd = "mask_recombination.py --alignment /tests/files/unaligned.fasta --format 'clonalframeml' --rec_positions /tests/files/some_unaffected_cfml.txt --tree /tests/files/test.newick"
        result = subprocess.run(cmd, shell=True, stderr=PIPE)
        assert re.search(b"Some sequences appear un-aligned!", result.stderr)

    def test_cfml_some_nonexistent_position(self):
        cmd = "mask_recombination.py --alignment /tests/files/aligned.fasta --format 'clonalframeml' --rec_positions /tests/files/nonexistant_position_cfml.txt --tree /tests/files/test.newick"
        result = subprocess.run(cmd, shell=True, stderr=PIPE)
        assert re.search(b"A recombination event spans the end of the alignment", result.stderr)

    def test_cfml_extra_node(self):
        cmd = "mask_recombination.py --alignment /tests/files/aligned.fasta --format 'clonalframeml' --rec_positions /tests/files/extra_node_cfml.txt --tree /tests/files/test.newick"
        result = subprocess.run(cmd, shell=True, stderr=PIPE)
        assert re.search(b"Some nodes in the recombination file do not appear in the phylogeny", result.stderr)


if __name__ == '__main__':
    unittest.main()
