import unittest
import subprocess
from subprocess import PIPE
import re


class TestVersions(unittest.TestCase):

    def test_version(self):
        bash_cmd = "muscle -version"
        result = subprocess.run(bash_cmd, shell=True, stdout=PIPE)
        self.assertEqual(result.stdout, b"MUSCLE v3.8.425 by Robert C. Edgar\n")


if __name__ == '__main__':
    unittest.main()
