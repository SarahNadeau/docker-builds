import unittest

class TestPositiveControl(unittest.TestCase):

    def test_mlst(self):
        with open("/test_data/qa/Summary.MLST.tab", 'r') as f:
            line = f.readlines()[0]
            mlst_scheme_name = line.split("\t")[1]
            seq_type = line.split("\t")[2]
        self.assertEqual(mlst_scheme_name, "mcatarrhalis")
        self.assertEqual(seq_type, "98")

    def test_mlst_output(self):
        with open("/test_data/qa/Summary.MLST.tab.checksum", 'r') as f:
            output_hash = f.readlines()[0].split(" ")[0]
        self.assertEqual(output_hash, "6c66607adafbb1ccb00c889c5890ab82aa1c80f597a4021ab67f58ccfbccbbfc")

if __name__ == '__main__':
    unittest.main()
