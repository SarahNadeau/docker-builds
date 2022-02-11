import unittest

class TestPositiveControl(unittest.TestCase):

    def test_fasta_output(self):
        with open("/test_data/aln/parsnp.fasta.checksum", 'r') as f:
            output_hash = f.readlines()[0].split(" ")[0]
        self.assertEqual(output_hash, "31d4d7db1979c231e981ee4b5d00e7597248d7912e16bc487639f4684db8b14a")


if __name__ == '__main__':
    unittest.main()
