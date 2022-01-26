import unittest
import subprocess
from subprocess import PIPE


class TestVersions(unittest.TestCase):

    def test_bedtools_version(self):
        bash_cmd = "bedtools --version"
        result = subprocess.run(bash_cmd, shell=True, stdout=PIPE)
        self.assertEqual(b"bedtools v2.29.2\n", result.stdout)


if __name__ == '__main__':
    unittest.main()
