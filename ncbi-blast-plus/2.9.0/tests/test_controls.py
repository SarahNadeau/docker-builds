import unittest

class TestPositiveControl(unittest.TestCase):

    def test_blastn_top_hit(self):
        with open("/test_data/ssu/SRR5481494_sub.blast.tsv", 'r') as f:
            top_hit = f.readline().split("\t")[13].strip()
        self.assertEqual(top_hit, "Moraxella catarrhalis")

if __name__ == '__main__':
    unittest.main()
