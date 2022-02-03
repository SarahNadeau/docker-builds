import unittest
import subprocess
from subprocess import PIPE


class TestVersions(unittest.TestCase):

    def test_version(self):
        bash_cmd = "diamond --version"
        result = subprocess.run(bash_cmd, shell=True, stdout=PIPE)
        self.assertEqual(result.stdout, b"diamond version 2.0.13\n")


if __name__ == '__main__':
    unittest.main()
