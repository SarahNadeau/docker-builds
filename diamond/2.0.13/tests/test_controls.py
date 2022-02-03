import unittest

class TestPositiveControl(unittest.TestCase):

    def test_diamond_output_1(self):
        with open("/test_data/aln/diamond.SRR5481494_sub,GCF_001997265.1_ASM199726v1_protein.tab.checksum", 'r') as f:
            output_hash = f.readlines()[0].split(" ")[0]
        self.assertEqual(output_hash, "45ba86eacba984043b1f277282112c0a40027ca91300297f3a199b9b77e41128")

    def test_diamond_output_2(self):
        with open("/test_data/aln/diamond.SRR5481494_sub,GCF_001997265.1.tab.checksum", 'r') as f:
            output_hash = f.readlines()[0].split(" ")[0]
        self.assertEqual(output_hash, "d8ab72e17c30a4755b76201ad6bc127809c762a6d2fd3719e26022d8e0b0298d")

if __name__ == '__main__':
    unittest.main()
