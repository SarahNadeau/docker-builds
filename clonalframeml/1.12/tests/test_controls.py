import unittest

class TestPositiveControl(unittest.TestCase):

    def test_pdf_output(self):
        with open("/test_data/recombination/parsnp.cfml.pdf.checksum", 'r') as f:
            output_hash = f.readlines()[0].split(" ")[0]
        self.assertEqual(output_hash, "00e3895688fb29f2e97656aad199a3411aa5d5b2f3cbbd5efd8f141ade04c420")

if __name__ == '__main__':
    unittest.main()
