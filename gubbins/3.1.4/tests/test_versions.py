import unittest
import subprocess
from subprocess import PIPE

class TestVersions(unittest.TestCase):

    def test_gubbins_version(self):
        bash_cmd = "run_gubbins.py --version"
        result = subprocess.run(bash_cmd, shell=True, stdout=PIPE)
        self.assertEqual(b"3.1.4\n", result.stdout)


if __name__ == '__main__':
    unittest.main()
