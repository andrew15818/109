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
class DiscreteCosine:
    def __init__(self, imagename):
        self.image = cv2.imread(imagename)
        self.gray = cv2.cvtColor(self.image, cv2.COLOR_BGR2GRAY)
        print('Starting Block Based Transform.')
        print(f'\tImage shape: {self.image.shape}')

    def apply_transform(self):
        rows, cols = self.gray.shape

        transform_arr = np.array(self.gray.shape)
        # Loop over every pixel 
        for i in range(rows):
            ci = (math.sqrt((1 / BLOCK_SIZE)) if i == 0 
                    else math.sqrt(( 2 / BLOCK_SIZE)))
            for j in range(cols):
                cj = (math.sqrt( 1 / BLOCK_SIZE) if j == 0
                        else math.sqrt(2 / BLOCK_SIZE)) 
                _sum = 0

                # Loop over neighborhood of each pixel
                for u in range(BLOCK_SIZE):
                    for v in range(BLOCK_SIZE):
                        _sum += (ci * cj * math.cos(((2*u + 1) * i * math.pi) / (2 * BLOCK_SIZE))*
                                math.cos((2*v + 1) * j * math.pi / (2 * BLOCK_SIZE)))
                transform_arr[i][j] = _sum
        return transform_arr 
