import unittest

class TestPositiveControl(unittest.TestCase):

    def test_prokka_output(self):
        with open("/test_data/annot/SRR5481494_sub/SRR5481494_sub.gff.checksum", 'r') as f:
            output_hash = f.readlines()[0].split(" ")[0]
        self.assertEqual(output_hash, "e44dc6460963647f5f60d2b4a9bd1d3aa66c52c4309c0536506788ead57f9273")

if __name__ == '__main__':
    unittest.main()
