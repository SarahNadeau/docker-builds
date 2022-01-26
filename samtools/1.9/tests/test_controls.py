import unittest

class TestPositiveControl(unittest.TestCase):

    def test_samtools_sort_paired_output(self):
        with open("/test_data/asm/SRR5481494_sub.paired.bam.checksum", 'r') as f:
            output_hash = f.readlines()[0].split(" ")[0]
        self.assertEqual(output_hash, "92c628406de11f1a48e53ad0475a181097fa4718264f127f250449486343da92")

    def test_samtools_index_paired_output(self):
        with open("/test_data/asm/SRR5481494_sub.paired.bam.bai.checksum", 'r') as f:
            output_hash = f.readlines()[0].split(" ")[0]
        self.assertEqual(output_hash, "176702228f807ad9f391182e632c4b8021c12b63f6a7674ef2643d025aed170f")

    def test_samtools_sort_singles_output(self):
        with open("/test_data/asm/SRR5481494_sub.single.bam.checksum", 'r') as f:
            output_hash = f.readlines()[0].split(" ")[0]
        self.assertEqual(output_hash, "a54dfcdf22311468ee7b8de629d801b0ff82ae423c2734d9626f5346ef464de2")

    def test_samtools_index_singles_output(self):
        with open("/test_data/asm/SRR5481494_sub.single.bam.bai.checksum", 'r') as f:
            output_hash = f.readlines()[0].split(" ")[0]
        self.assertEqual(output_hash, "013cab5fbcb8f148e529fa838ad678a75e544fc841263864af01dd0028fb5e7a")

if __name__ == '__main__':
    unittest.main()
