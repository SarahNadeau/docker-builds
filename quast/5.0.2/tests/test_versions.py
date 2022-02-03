import unittest
import subprocess
from subprocess import PIPE


class TestVersions(unittest.TestCase):

    def test_version(self):
        bash_cmd = "quast.py --version"
        result = subprocess.run(bash_cmd, shell=True, stdout=PIPE)
        self.assertEqual(result.stdout, b"QUAST v5.0.2\n")


if __name__ == '__main__':
    unittest.main()
