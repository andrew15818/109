import cv2
import math         #sqrt
import numpy as np

BLOCK_SIZE = 8
'''
TODO: 1. Choose a kernel to use for forward transformation.
    2. Choose a kernel to use for backward transformation.
    3. Write a function to divide the image into subregions.
'''
# Calculate constants here to save time
au_zero = math.sqrt((1 / BLOCK_SIZE))
au_non_zero = math.sqrt((2 / BLOCK_SIZE))
n2 = 2 * BLOCK_SIZE
factor = math.pi / n2

class DiscreteCosine:
    def __init__(self, imagename):
        self.image = cv2.imread(imagename)
        self.gray = cv2.cvtColor(self.image, cv2.COLOR_BGR2GRAY)
        print('Starting Block Based Transform.')
        print(f'\tImage shape: {self.image.shape}')

    def encode(self):
        rows, cols = self.gray.shape
        #transform_arr = []
        transform_arr = np.zeros(self.gray.shape, dtype=np.float32)

        # Loop over every pixel 
        for i in range(rows):
            tmp = []
            ci = (au_zero if i == 0 else au_non_zero)

            for j in range(cols):
                cj = (au_zero if j == 0 else au_non_zero)
                _sum = 0

                # Loop over neighborhood of each pixel
                for u in range(BLOCK_SIZE):
                    for v in range(BLOCK_SIZE):
                        _sum += self.gray[u][v] * ( math.cos(((2*u + 1) * i * math.pi) / (n2))*
                                math.cos(((2*v + 1) * j * math.pi) / n2 ))
                result = ci * cj * _sum
                result /= 4
                transform_arr[i][j] = result
        return transform_arr 

    def decode(self, encoded):
        rows, cols = encoded.shape

        decoded = np.empty(encoded.shape)
        # Loop for every pixel
        for i in range(rows):
            ci = (au_zero if i == 0 else au_non_zero)
            for j in range(cols):
               cj = (au_zero if i == 0 else au_non_zero)

               # The neighborhood of each pixel
               _sum = 0
               for u in range(BLOCK_SIZE):
                
                   for v in range(BLOCK_SIZE):
                       _sum += (encoded[u][v] * math.cos((2 * u + 1) * i * factor) * math.cos((2 * v + 1) * j * factor))
               decoded[i][j] = (ci * cj * _sum) / 4
        return decoded

    def debug(self):
        ret,thresholded = cv2.threshold(self.gray,200,255,cv2.THRESH_BINARY)
        gray = np.float32(thresholded)/255.0
        test = cv2.dct(gray)
        return test
