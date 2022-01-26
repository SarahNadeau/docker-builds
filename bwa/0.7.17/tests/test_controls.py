import unittest

class TestPositiveControl(unittest.TestCase):

    def test_pairs_alignment_output(self):
        with open("/test_data/asm/SRR5481494_sub.paired.sam.checksum", 'r') as f:
            output_hash = f.readlines()[0].split(" ")[0]
        self.assertEqual(output_hash, "d1c3354d24923822a0067a1ca832119e969e7ea116042bfb57035ed8a0722645")

    def test_singles_alignment_output(self):
        with open("/test_data/asm/SRR5481494_sub.single.sam.checksum", 'r') as f:
            output_hash = f.readlines()[0].split(" ")[0]
        self.assertEqual(output_hash, "e0fda225c55e188a949440ae5d6ff045fe96507e93002ac85eaa684de8f08a0d")

if __name__ == '__main__':
    unittest.main()
