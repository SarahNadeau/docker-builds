import unittest
import subprocess
from subprocess import PIPE
import re

class TestVersions(unittest.TestCase):

    def test_barrnap_version(self):
        bash_cmd = "barrnap --version"
        result = subprocess.run(bash_cmd, shell=True, stderr=PIPE)
        self.assertEqual(b"barrnap 0.8\n", result.stderr)


if __name__ == '__main__':
    unittest.main()
