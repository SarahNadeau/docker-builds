import unittest
import Bio


class TestVersions(unittest.TestCase):

    def test_biopython_version(self):
        self.assertEqual("1.79", Bio.__version__)


if __name__ == '__main__':
    unittest.main()
