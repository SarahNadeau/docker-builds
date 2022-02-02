import unittest
import subprocess
from subprocess import PIPE
import re

class TestValidCases(unittest.TestCase):

    def test_three(self):
        cmd = "pairwiseDistances.pl /tests/test_fastas/three.fasta | sort -k3,3n"
        result = subprocess.run(cmd, shell=True, stdout=PIPE)
        self.assertEqual(result.stdout, b"Seq1\tSeq2\t1\nSeq2\tSeq3\t1\nSeq1\tSeq3\t2\n")

    def test_ambiguous(self):
        cmd = "pairwiseDistances.pl /tests/test_fastas/ambiguous.fasta | sort -k3,3n"
        result = subprocess.run(cmd, shell=True, stdout=PIPE)
        self.assertEqual(result.stdout, b"Seq1\tSeq2\t1\n")

    def test_gapped(self):
        cmd = "pairwiseDistances.pl /tests/test_fastas/gapped.fasta | sort -k3,3n"
        result = subprocess.run(cmd, shell=True, stdout=PIPE)
        self.assertEqual(result.stdout, b"Seq1\tSeq2\t1\n")

    def test_nondna(self):
        cmd = "pairwiseDistances.pl /tests/test_fastas/nondna.fasta | sort -k3,3n"
        result = subprocess.run(cmd, shell=True, stdout=PIPE)
        self.assertEqual(result.stdout, b'Seq1\tSeq2\t0\n')


class TestInvalidCases(unittest.TestCase):

    def test_unaligned(self):
        cmd = "pairwiseDistances.pl /tests/test_fastas/unaligned.fasta"
        result = subprocess.run(cmd, shell=True, stdout=PIPE, stderr=PIPE)
        self.assertEqual(result.stdout, b'Seq1\tSeq2\t0\n')

    def test_nonfasta(self):
        cmd = "pairwiseDistances.pl /tests/test_fastas/nonfasta.fasta"
        result = subprocess.run(cmd, shell=True, stdout=PIPE, stderr=PIPE)
        self.assertEqual(result.stdout, b'')
        assert re.search(b"Failed validation of sequence", result.stderr)


if __name__ == '__main__':
    unittest.main()
