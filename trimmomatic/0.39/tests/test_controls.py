import unittest

class TestPositiveControl(unittest.TestCase):

    def test_trimmed_r1_paired_output(self):
        with open("/test_data/trim_reads/trim_checksums.txt", 'r') as f:
            trimmed_r1_paired_hash = f.readlines()[0].split(" ")[0]
        self.assertEqual(trimmed_r1_paired_hash, "8bb01f36de2348708fb1b2324ca61a695e1d8f9965f7c76030c859138fe08b78")

    def test_trimmed_r1_unpaired_output(self):
        with open("/test_data/trim_reads/trim_checksums.txt", 'r') as f:
            trimmed_r1_unpaired_hash = f.readlines()[1].split(" ")[0]
        self.assertEqual(trimmed_r1_unpaired_hash, "bfac7ee5753ed3c19969694ceb69eba5b4b1e294ec90a94462bcb51c063104d3")

    def test_trimmed_r2_paired_output(self):
        with open("/test_data/trim_reads/trim_checksums.txt", 'r') as f:
            trimmed_r2_paired_hash = f.readlines()[2].split(" ")[0]
        self.assertEqual(trimmed_r2_paired_hash, "5ae4f9cb152641c258b6642b60fdc18ab7ce27909ba7fd40a079e85de7f53e7e")

    def test_trimmed_r2_unpaired_output(self):
        with open("/test_data/trim_reads/trim_checksums.txt", 'r') as f:
            trimmed_r2_unpaired_hash = f.readlines()[3].split(" ")[0]
        self.assertEqual(trimmed_r2_unpaired_hash, "f1ca3ae68cbc02ef0bc9d35e7973b55c9020236c4f340d19836d66059d781928")

if __name__ == '__main__':
    unittest.main()
