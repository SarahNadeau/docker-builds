import unittest

class TestPositiveControl(unittest.TestCase):

    def test_from_fasta_output(self):
        with open("/test_data/recombination/parsnp_fa.importation_status.txt.checksum", 'r') as f:
            output_hash = f.readlines()[0].split(" ")[0]
        self.assertEqual(output_hash, "3b0cb8f13aee32c7d0a30350402ef0ace2e3c84f132d4213763960fc887a9870")

    def test_from_xmfa_output(self):
        with open("/test_data/recombination/parsnp.importation_status.txt.checksum", 'r') as f:
            output_hash = f.readlines()[0].split(" ")[0]
        self.assertEqual(output_hash, "72e347dbad07eefb53fd8d4659da90715c5e1efc90ed0fe2efd56866325824bd")

if __name__ == '__main__':
    unittest.main()
