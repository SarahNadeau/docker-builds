import unittest
import subprocess
from subprocess import PIPE


class TestVersions(unittest.TestCase):

    def test_mlst_version(self):
        bash_cmd = "mlst --version"
        result = subprocess.run(bash_cmd, shell=True, stdout=PIPE)
        self.assertEqual(b"mlst 2.17.6\n", result.stdout)


if __name__ == '__main__':
    unittest.main()
