import unittest

class TestPositiveControl(unittest.TestCase):

    def test_muscle_output(self):
        with open("/tests/muscle_output/test.fas.aln.checksum", 'r') as f:
            output_hash = f.readlines()[0].split(" ")[0]
        self.assertEqual(output_hash, "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")

if __name__ == '__main__':
    unittest.main()
