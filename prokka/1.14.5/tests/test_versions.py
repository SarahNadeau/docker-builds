import unittest
import subprocess
from subprocess import PIPE


class TestVersions(unittest.TestCase):

    def test_prokka_version(self):
        bash_cmd = "prokka --version"
        result = subprocess.run(bash_cmd, shell=True, stdout=PIPE)
        print(result.stdout)
        self.assertEqual("prokka 1.14.5", result.stdout)


if __name__ == '__main__':
    unittest.main()
