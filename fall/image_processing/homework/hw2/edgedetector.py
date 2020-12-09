import numpy as np
import math
import cv2
# Quick check if the pixel is OOB
def is_valid(row, col, max_row, max_col):

    if(row < 0 or col < 0 or col >= max_col or row >= max_row):
        return False

    return True


class EdgeDetector:
    def __init__(self):
        pass
    # Check if a pixel location is out of bounds
       # Given a mask, apply that mask on the given pixel as center
    def get_greyscale(self, image):
        image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)       
        return image

    def apply_mask_3x3(self, image, mask, row, col, factor=1):
        max_row, max_col = image.shape[0], image.shape[1]

        sum_r, sum_g, sum_b = 0, 0, 0

        for row_offset in [-1, 0 ,1]:
            for col_offset in [-1, 0, 1]:
                new_row = row + row_offset
                new_col = col + col_offset

                # Skip if pixel is out of bounds
                if not is_valid(new_row, new_col, max_row, max_col):
                    continue

                sum_r += (image[new_row][new_col][0] * mask[row_offset+1][col_offset+1])
                sum_g += (image[new_row][new_col][1] * mask[row_offset+1][col_offset+1])
                sum_b += (image[new_row][new_col][2] * mask[row_offset+1][col_offset+1])

        return np.array([sum_r/ factor, sum_g / factor, sum_b / factor])

    # Apply a mask on a 1D image (probably greyscale), mask can be any size
    def apply_mask_greyscale(self, image, mask, row, col, factor=1):
        mask_row, mask_col = len(mask[0]), len(mask)
        rows, cols = image.shape[0], image.shape[1] 
        sum = 0
        row_offset, col_offset = math.floor(mask_row / 2), math.floor(mask_col / 2)
        currmask_x, currmask_y = 0, 0

        for x in range(row - row_offset, row_offset + 1):
            currmask_x = (currmask_x + 1) % mask_row
            for y in range(col - col_offset, col_offset + 1):
                sum += (image[x][y] * mask[currmask_x][currmask_y])
                currmask_y = (currmask_y +1 ) % mask_col
        return (sum * factor)

    # Get the average of the pixel values in the neighborhood
    def avg_filter(self, image):
        mask = np.array([[1, 1, 1],
                        [1, 1, 1],
                        [1, 1, 1]])
        #tmp = self.apply_mask(image, mask , 0, 0)
        
        for row in range(len(image)):
            for col in range(len(image[row])):
               tmp = self.apply_mask_3x3(image, mask, row, col)
               tmp[0] /= 9
               tmp[1] /= 9
               tmp[2] /= 9
               image[row][col] = tmp
        
        return image
        
    # Call the corresponding filter function
    def apply_filter(self, filter_name, image):
        filter_name = filter_name.lower()

        if filter_name == 'avg':
             return self.avg_filter(image)

        print('The filter did not match any. Please try again.') 
        return None

    # 
    def apply_rgb_mask(self, image, mask):
        max_rows = image.shape[0] 
        max_cols = image.shape[1]
        
        image2 = image.copy()
        print(image.shape)
        for row in range(image.shape[0]):
            for col in range(image.shape[1]):
                
                tmp = self.apply_mask_3x3(image, mask, row, col, factor=3) 
                image2[row][col] = tmp 

        return image 
    # Make a copy of the image and return the copy. Otherwise the image will just be dark all around
    def apply_greyscale_mask(self, image, mask): 
        max_rows = image.shape[0] 
        max_cols = image.shape[1]
        
        image2 = image.copy()
        print(image.shape)
        for row in range(image.shape[0]):
            for col in range(image.shape[1]):
                
                tmp = self.apply_mask_greyscale(image, mask, row, col, factor=(1/3)) 
                image2[row][col] = tmp 

        return image 
