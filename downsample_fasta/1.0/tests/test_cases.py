import filecmp
import re
import subprocess
from subprocess import PIPE
import unittest


class TestValidCases(unittest.TestCase):

    def test_single_entry(self):
        cmd = "downsample_fasta.py --fasta /tests/files/single_entry_oneline.fasta --chunk-size 5  --n-chunks 5 --seed 5280 > tmp1.fasta"
        subprocess.run(cmd, shell=True)
        assert filecmp.cmp("tmp1.fasta", "/tests/files/single_entry_5_5_test_result.fasta")

    def test_single_entry_multiline(self):
        cmd = "downsample_fasta.py --fasta /tests/files/single_entry_multiline.fasta --chunk-size 5  --n-chunks 5 --seed 5280 > tmp2.fasta"
        subprocess.run(cmd, shell=True)
        assert filecmp.cmp("tmp2.fasta", "/tests/files/single_entry_5_5_test_result.fasta")

    def test_two_entry(self):
        cmd = "downsample_fasta.py --fasta /tests/files/two_entry_oneline.fasta --chunk-size 5  --n-chunks 7 --seed 14617 > tmp3.fasta"
        subprocess.run(cmd, shell=True)
        assert filecmp.cmp("tmp3.fasta", "/tests/files/two_entry_5_7_test_result.fasta")

    def test_two_entry_multiline(self):
        cmd = "downsample_fasta.py --fasta /tests/files/two_entry_multiline.fasta --chunk-size 5  --n-chunks 7 --seed 14617 > tmp4.fasta"
        subprocess.run(cmd, shell=True)
        assert filecmp.cmp("tmp4.fasta", "/tests/files/two_entry_5_7_test_result.fasta")

    def test_no_concatenate(self):
        cmd = "downsample_fasta.py --fasta /tests/files/two_entry_multiline.fasta --chunk-size 5  --n-chunks 7 --no-concatenate --seed 14617 > tmp4_no_concatenate.fasta"
        subprocess.run(cmd, shell=True)
        assert filecmp.cmp("tmp4_no_concatenate.fasta", "/tests/files/two_entry_5_7_no_concatenate_test_result.fasta")


class TestWarnCases(unittest.TestCase):

    def test_short_sequence(self):
        cmd = "downsample_fasta.py --fasta /tests/files/short_seq.fasta --chunk-size 5  --n-chunks 2 > tmp5.fasta"
        result = subprocess.run(cmd, shell=True, stderr=PIPE)
        assert re.search(b"Chunk size is greater than sequence", result.stderr)

    def test_too_few_chunks(self):
        cmd = "downsample_fasta.py --fasta /tests/files/single_entry_multiline.fasta --chunk-size 5  --n-chunks 500 --seed 5280 > tmp6.fasta"
        result = subprocess.run(cmd, shell=True, stderr=PIPE)
        assert re.search(b"\nFewer than specified number chunks in file", result.stderr)
        outfile = open('tmp6.fasta', 'r').read().replace("\n", "")  # strip new line characters
        infile = open('/tests/files/single_entry_multiline.fasta', 'r').read().replace("\n", "")
        assert outfile == infile


if __name__ == '__main__':
    unittest.main()
