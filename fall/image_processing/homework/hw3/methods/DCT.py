import cv2
import math         #sqrt
import numpy as np

BLOCK_SIZE = 8
'''
TODO:
    1. Choose a kernel to use for forward transformation.
    2. Choose a kernel to use for backward transformation.
    3. Write a function to divide the image into subregions.
'''
au_zero = math.sqrt((1 / BLOCK_SIZE))
au_non_zero = math.sqrt((2 / BLOCK_SIZE))
class DiscreteCosine:
    def __init__(self, imagename):
        self.image = cv2.imread(imagename)
        self.gray = cv2.cvtColor(self.image, cv2.COLOR_BGR2GRAY)
        print('Starting Block Based Transform.')
        print(f'\tImage shape: {self.image.shape}')

    def apply_transform(self):
        rows, cols = self.gray.shape
        #transform_arr = []
        transform_arr = np.empty(self.gray.shape, dtype=np.float32)

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
                        _sum += ( math.cos(((2*u + 1) * i * math.pi) / (2 * BLOCK_SIZE))*
                                math.cos((2*v + 1) * j * math.pi / (2 * BLOCK_SIZE)))
                result = ci * cj * _sum
                transform_arr[i][j] = result
        return transform_arr 
