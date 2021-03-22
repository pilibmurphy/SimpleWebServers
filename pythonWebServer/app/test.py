import unittest
import multiply

class TestMultiply(unittest.TestCase):
    def test_mply(self):
        self.assertEqual(multiply.mply(5,5), 25)

if __name__ == "main":
    unittest.main()
