import unittest
import subprocess
from subprocess import PIPE
import re


class TestVersions(unittest.TestCase):

    def test_bwa_version(self):
        bash_cmd = "samtools"
        result = subprocess.run(bash_cmd, shell=True, stderr=PIPE)
        assert re.search(b"Version: 1.9", result.stderr)


if __name__ == '__main__':
    unittest.main()
