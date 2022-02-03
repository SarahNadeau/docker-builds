import unittest

class TestPositiveControl(unittest.TestCase):

    def test_report_output(self):
        with open("/test_data/qa/report.txt.checksum", 'r') as f:
            output_hash = f.readlines()[0].split(" ")[0]
        self.assertEqual(output_hash, "4bfeed7cbed15ea3aeed4c8a430abcdab44c700aaba49f4f8a48030d0dbb823f")

if __name__ == '__main__':
    unittest.main()
