import numpy as np

class EdgeDetector:
    def __init__(self):
        pass

    # Given a mask, apply that mask on the given pixel as center
    def apply_mask(self, image, mask, row, col):
        sum_r, sum_g, sum_b = 0, 0, 0
        for x in range(-1, 1, 1):
            for y in range(-1, 1, 1):
                row_offset, col_offset = row + x, col + y

                # Skip pixels that lie outside of image
                if (row_offset < 0 or row_offset >= image.shape[0] or
                        col_offset < 0 or col_offset >= image.shape[1]):
                    continue
                sum_r += image[row_offset][col_offset][0] * mask[x + 1][y + 1] 
                sum_g += image[row_offset][col_offset][1] * mask[x + 1][y + 1]
                sum_b += image[row_offset][col_offset][2] * mask[x + 1][y + 1]
        #sum_r /= 9
        #sum_g /= 9
        #sum_b /= 9
        return np.array([sum_r, sum_g, sum_b])
                
        pass

    # Get the average of the pixel values in the neighborhood
    def avg_filter(self, image):
        mask = np.array([[1, 1, 1],
                        [1, 1, 1],
                        [1, 1, 1]])
        for row in range(len(image)):
            for col in range(row):
               tmp = self.apply_mask(image, mask, row, col)
               image[row][col] = tmp

        return image
        
    # Call the corresponding filter function
    def apply_filter(self, filter_name, image):
        filter_name = filter_name.lower()
        if filter_name == 'avg':
             return self.avg_filter(image)


        print('The filter did not match any. Please try again.') 
        return None
