import unittest
import subprocess
from subprocess import PIPE
import re

class TestVersions(unittest.TestCase):

    def test_clonalframeml_version(self):
        bash_cmd = "ClonalFrameML -version"
        result = subprocess.run(bash_cmd, shell=True, stdout=PIPE)
        self.assertEqual(result.stdout, b"ClonalFrameML v1.12\n")

    def test_r_version(self):
        bash_cmd = "R --version"
        result = subprocess.run(bash_cmd, shell=True, stdout=PIPE)
        assert re.search(b"4\.[0-9]\.[0-9]", result.stdout)


if __name__ == '__main__':
    unittest.main()
