import unittest

class TestPositiveControl(unittest.TestCase):

    def test_merged_output(self):
        with open("/test_data/trim_reads/merge_checksums.txt", 'r') as f:
            merged_hash = f.readlines()[0].split(" ")[0]
        self.assertEqual(merged_hash, "269b436b695f00a32de92da6b50118ae47e9f6d54293cc9955006bd868dd9af2")

    def test_unmerged_r1_output(self):
        with open("/test_data/trim_reads/merge_checksums.txt", 'r') as f:
            unmerged_r1_hash = f.readlines()[1].split(" ")[0]
        self.assertEqual(unmerged_r1_hash, "e6e2a143eeb4161bc0f1eae87d7534cbd506beb37ed886b195858c1a95fea339")

    def test_unmerged_r2_output(self):
        with open("/test_data/trim_reads/merge_checksums.txt", 'r') as f:
            unmerged_r2_hash = f.readlines()[2].split(" ")[0]
        self.assertEqual(unmerged_r2_hash, "3e50344dade43a100d38f1393d1152677b381f621db02f81598cc5eab3da414e")

if __name__ == '__main__':
    unittest.main()
