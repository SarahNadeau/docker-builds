import unittest
import subprocess
from subprocess import PIPE
import re


class TestVersions(unittest.TestCase):

    def test_version(self):
        bash_cmd = "figtree --version"
        result = subprocess.run(bash_cmd, shell=True, stdout=PIPE)
        assert re.search(b"FigTree v1.4.4", result.stdout)


if __name__ == '__main__':
    unittest.main()
