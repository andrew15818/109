import cv2
from PIL import Image
from methods.Huffman import Huffman
class Compressor:
    def __init__(self):
        self.image = None
        self.method = ""
        
    def open(self, filename):
        self.filename = filename
        self.image = Image.open(filename)
        
    def use_method(self, method):
        method = method.lower()
        if method == "huffman":
            huff = Huffman(self.filename)
            compressed = huff.encode()
            decompressed = huff.decode(compressed)
            print(decompressed.size)
            cv2.imshow('decom', decompressed)
            cv2.waitKey(0)