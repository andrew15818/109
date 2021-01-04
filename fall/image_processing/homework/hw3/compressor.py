import cv2
from PIL import Image
from methods.Huffman import Huffman
from methods.DCT import DiscreteCosine 

class Compressor:
    def __init__(self):
        self.image = None
        self.method = ""
        
    def open(self, filename):
        self.filename = filename
        self.image = Image.open(filename)
        
    def use_method(self, method):
        method = method.lower()
        # TODO: Figure out how to use 3d color images with Huffman
        if method == "huffman":
            huff = Huffman(self.filename)
            compressed = huff.encode()
            decompressed = huff.decode(compressed)
            cv2.imshow('try', decompressed/255)
            cv2.waitKey(0)

        elif method == "dct": 
            dct = DiscreteCosine(self.filename)
            dct.apply_transform()
