import cv2
from PIL import Image
from methods.Huffman import Huffman
from methods.DCT import DiscreteCosine 
from methods.Predictive import Predictive
from methods.RunLength import RLCoding
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
            print(compressed)
            decompressed = huff.decode(compressed)
            cv2.imshow('try', decompressed/255)
            cv2.waitKey(0)

        elif method == "dct": 
            dct = DiscreteCosine(self.filename)
            transform = dct.encode()
            decoded = dct.decode(transform)
            print(f'transform: {transform}')
            print(f'decoded: {decoded}')
            cv2.waitKey(0)

        elif method == "predictive":
            pred = Predictive(self.filename)
            encoded = pred.encode()
            decoded = pred.decode()

        elif method == "runlength":
            pred = RLCoding(self.filename)
            encoded = pred.encode()
            decoded = pred.decode(encoded)
