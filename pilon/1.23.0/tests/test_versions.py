import unittest
import subprocess
from subprocess import PIPE


class TestVersions(unittest.TestCase):

    def test_pilon_version(self):
        bash_cmd = "pilon --version"
        result = subprocess.run(bash_cmd, shell=True, stdout=PIPE)
        self.assertEqual(b"Pilon version 1.23 Mon Nov 26 16:04:05 2018 -0500\n", result.stdout)


if __name__ == '__main__':
    unittest.main()
