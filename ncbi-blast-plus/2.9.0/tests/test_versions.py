import unittest
import subprocess
from subprocess import PIPE
import re

class TestVersions(unittest.TestCase):

    def test_blastx_version(self):
        bash_cmd = "blastx -version"
        result = subprocess.run(bash_cmd, shell=True, stdout=PIPE)
        assert re.search(b"blastx: 2.9.0+", result.stdout)


if __name__ == '__main__':
    unittest.main()
