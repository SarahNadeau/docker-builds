import unittest
import subprocess
from subprocess import PIPE
import re


class TestVersions(unittest.TestCase):

    def test_bbtools_version(self):
        bash_cmd = "bbduk.sh --version"
        result = subprocess.run(bash_cmd, shell=True, stderr=PIPE)
        assert re.search(b"BBMap version 38.94\n", result.stderr)


if __name__ == '__main__':
    unittest.main()
