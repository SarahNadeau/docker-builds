import unittest
import subprocess
from subprocess import PIPE
import re


class TestVersions(unittest.TestCase):

    def test_bioperl_version(self):
        bash_cmd = "perl -le 'eval \"require $ARGV[0]\" and print $ARGV[0]->VERSION' Bio::Perl"
        result = subprocess.run(bash_cmd, shell=True, stdout=PIPE)
        self.assertEqual(b"1.006924\n", result.stdout)


if __name__ == '__main__':
    unittest.main()
