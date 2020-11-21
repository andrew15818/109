import numpy as np

def is_valid(row, col, max_row, max_col):

    if(row < 0 or col < 0 or col >= max_col or row >= max_row):
        return False

    return True


class EdgeDetector:
    def __init__(self):
        pass
    # Check if a pixel location is out of bounds
       # Given a mask, apply that mask on the given pixel as center
    def apply_mask(self, image, mask, row, col):
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

        return [sum_r, sum_g, sum_b]

    # Get the average of the pixel values in the neighborhood
    def avg_filter(self, image):
        mask = np.array([[1, 1, 1],
                        [1, 1, 1],
                        [1, 1, 1]])
        #tmp = self.apply_mask(image, mask , 0, 0)
        
        for row in range(len(image)):
            for col in range(len(image[row])):
               tmp = self.apply_mask(image, mask, row, col)
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

    def first_derivative(self, image):
        mask = [[-1, 0, 1],
                [-2, 0, 2],
                [-1, 0, 1]]
        for row in range(len(image)):
            for col in range(len(image[row])):
                tmp = self.apply_mask(image, mask, row, col)
                image[row][col] = tmp
        return image
        pass
    def second_derivative(self, image):
        pass
