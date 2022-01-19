import unittest

class TestPositiveControl(unittest.TestCase):

    def test_contigs_output(self):
        with open("/test_data/asm/contigs_checksum.txt", 'r') as f:
            merged_hash = f.readlines()[0].split(" ")[0]
        self.assertEqual(merged_hash, "80218c2b0a002f400d667087be74d663a68eb33c6053aa6dc72fe1a22f26662c")

if __name__ == '__main__':
    unittest.main()
