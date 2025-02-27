import filecmp
import re
import subprocess
from subprocess import PIPE
import unittest


class TestValidCases(unittest.TestCase):

    def test_xmfa(self):
        cmd = "convert_xmfa_to_fasta.py --xmfa /tests/files/test.xmfa > /tests/files/test_result.fasta"
        subprocess.run(cmd, shell=True)
        assert filecmp.cmp("/tests/files/test_result.fasta", "/tests/files/result.fasta")

    def test_blank_line_header(self):
        cmd = "convert_xmfa_to_fasta.py --xmfa /tests/files/blank_line_header.xmfa > /tests/files/blank_line_header_result.fasta"
        subprocess.run(cmd, shell=True)
        assert filecmp.cmp("/tests/files/blank_line_header_result.fasta", "/tests/files/result.fasta")

    def test_index_headers(self):
        cmd = "convert_xmfa_to_fasta.py --xmfa /tests/files/index_headers.xmfa > /tests/files/index_headers_result.fasta"
        subprocess.run(cmd, shell=True)
        assert filecmp.cmp("/tests/files/index_headers_result.fasta", "/tests/files/result.fasta")


class TestInvalidCases(unittest.TestCase):

    def test_wrong_length(self):
        cmd = "convert_xmfa_to_fasta.py --xmfa /tests/files/wrong_length.xmfa"
        result = subprocess.run(cmd, shell=True, stderr=PIPE, stdout=PIPE)
        self.assertEqual(result.stdout, b"")
        assert re.search(b"characters instead of expected", result.stderr)

    def test_extra_cluster(self):
        cmd = "convert_xmfa_to_fasta.py --xmfa /tests/files/extra_cluster.xmfa"
        result = subprocess.run(cmd, shell=True, stderr=PIPE, stdout=PIPE)
        self.assertEqual(result.stdout, b"")
        assert re.search(b"missing or unexpected cluster", result.stderr)


if __name__ == '__main__':
    unittest.main()
