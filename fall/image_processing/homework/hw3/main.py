from compressor import Compressor
import argparse
filename = "img/p1im4.png"

def make_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("-i", "--input", help="input image in jpg format")
    parser.parse_args()
    return parser

def main():
    comp = Compressor()
    comp.open(filename)
    comp.use_method("Huffman")
if __name__ == "__main__":
    main()
