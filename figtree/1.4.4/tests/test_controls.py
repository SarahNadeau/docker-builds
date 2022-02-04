import unittest
from os import path

class TestPositiveControl(unittest.TestCase):

    def test_figtree_png_output(self):
        with open("/tests/test.png.checksum", 'r') as f:
            output_hash = f.readlines()[0].split(" ")[0]
        self.assertEqual(output_hash, "128d5825273c2c307c956e3f155ddb58fa47119b2eda7c1a3d6e707b67b3ce87")

    def test_figtree_pdf_output_exists(self):
        assert path.isfile("/tests/test.pdf")

if __name__ == '__main__':
    unittest.main()
