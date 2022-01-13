import unittest
import subprocess
from subprocess import PIPE
from os.path import exists

class TestPositiveControl(unittest.TestCase):

    def test_output_downloaded(self):
        assert exists("pos_control/input_dir")

    def test_filtered_output(self):
        with open("pos_control/output_dir/trim_reads/SRR1509643-noPhiX-R1.fsq.sorted.checksum", 'r') as f:
            filtered_r1_hash = f.readlines()[0].split(" ")[0]
        self.assertEqual(filtered_r1_hash, "a2544ea729d955cc39460372fe4c2471f3c5bb1476515c1c4e6a0f2f601b90da")

if __name__ == '__main__':
    unittest.main()
