import unittest
import subprocess
from subprocess import PIPE
import re


class TestVersions(unittest.TestCase):

    def test_spades_version(self):
        bash_cmd = "spades.py -v"
        result = subprocess.run(bash_cmd, shell=True, stderr=PIPE)
        self.assertEqual(b"SPAdes genome assembler v3.15.3\n", result.stderr)


if __name__ == '__main__':
    unittest.main()
