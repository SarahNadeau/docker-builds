import unittest

class TestPositiveControl(unittest.TestCase):

    def test_swga_output(self):
        with open("/test_data/swga_results/primers_top_100_gini.txt.checksum", 'r') as f:
            output_hash = f.readlines()[0].split(" ")[0]
        self.assertEqual(output_hash, "dc1defacf325e170eeb6b62d77f3e1f3878c9b6da1b451fb6774d0169367d935")


if __name__ == '__main__':
    unittest.main()
