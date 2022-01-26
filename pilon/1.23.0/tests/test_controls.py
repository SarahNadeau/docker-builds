import unittest

class TestPositiveControl(unittest.TestCase):

    def test_pilon_fasta_output(self):
        with open("/test_data/asm/SRR5481494_sub.fasta.checksum", 'r') as f:
            output_hash = f.readlines()[0].split(" ")[0]
        self.assertEqual(output_hash, "b0d4b4af22711729923131b2b0aa4644ed3b5cd0f7e46bb9ed6c5cd699fba0e4")

    def test_pilon_changes_output(self):
        with open("/test_data/asm/SRR5481494_sub.changes.checksum", 'r') as f:
            output_hash = f.readlines()[0].split(" ")[0]
        self.assertEqual(output_hash, "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")

if __name__ == '__main__':
    unittest.main()
