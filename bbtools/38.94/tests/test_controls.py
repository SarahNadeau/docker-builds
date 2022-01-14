import unittest

class TestPositiveControl(unittest.TestCase):

    def test_filtered_output(self):
        with open("/test_data/trim_reads/SRR5481494_sub-noPhiX-R1.fsq.sorted.checksum", 'r') as f:
            filtered_r1_hash = f.readlines()[0].split(" ")[0]
        self.assertEqual(filtered_r1_hash, "0ba36472f1bb86ecc6665a96bd1994e16f6f5d66e9df09da5854171f32da6475")

if __name__ == '__main__':
    unittest.main()
