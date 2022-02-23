import unittest
import subprocess
from subprocess import PIPE
import re


class TestVersions(unittest.TestCase):

    def test_swga_version(self):
        bash_cmd = "swga count"
        result = subprocess.run(bash_cmd, shell=True, stderr=PIPE)
        assert re.search(b"swga version:      0.4.4", result.stderr)


if __name__ == '__main__':
    unittest.main()
