import unittest

class TestPositiveControl(unittest.TestCase):

    def test_tree_output(self):
        with open("/test_data/recombination/parsnp.node_labelled.final_tree.tre.checksum", 'r') as f:
            output_hash = f.readlines()[0].split(" ")[0]
        self.assertEqual(output_hash, "c159c01e0ae92c17bdb9bc270c0f4f12bc439b62d5996bbde6aa8c938cac080b")

    def test_recombination_output(self):
        with open("/test_data/recombination/parsnp.recombination_predictions.gff.checksum", 'r') as f:
            output_hash = f.readlines()[0].split(" ")[0]
        self.assertEqual(output_hash, "ce5e3e0461745e9f0ebf4cd1a495e78480336bbe41a713e0b16629bcb4dc6f36")

if __name__ == '__main__':
    unittest.main()
