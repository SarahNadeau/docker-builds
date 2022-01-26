import unittest

class TestPositiveControl(unittest.TestCase):

    def test_coverage_output(self):
        with open("/test_data/qa/Summary.Illumina.CleanedReads-AlnStats.tab.checksum", 'r') as f:
            output_hash = f.readlines()[0].split(" ")[0]
        self.assertEqual(output_hash, "eff8590d3159c9f58aa7b455b99cc1e5652c0cb29010404b5b97af53d31b8e20")

if __name__ == '__main__':
    unittest.main()
