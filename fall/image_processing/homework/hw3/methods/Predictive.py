import cv2
import numpy as np
class Predictive:
    def __init__(self, imagename):
        self.image = cv2.imread(imagename)
        # Maybe try on the full color image
        self.gray = cv2.cvtColor(self.image, cv2.COLOR_BGR2GRAY)
        self.estimator = None
    '''
    TODO: Find the difference between the left to right, top-down 
    Encode the resulting e(n)
    '''
    def encode(self):
        rows, cols, channels = self.image.shape
        self.estimator = np.empty(self.gray.shape)

        for row in range(1, rows):
            for col in range(1, rows):
                # Sum of vertical and horizontal until current point
                sum_hor = np.sum(self.gray[row, :col])
                sum_vert = np.sum(self.gray[:row, col])

                # Rounded difference bw current pixel and previous samples?
                self.estimator[row][col] = (int(round(2*self.gray[row][col] 
                    - self.gray[row-1][col] - self.gray[row][col-1])))
                #print(self.estimator[row][col])
        return self.estimator

    def decode(self):
        rows, cols= self.gray.shape
        self.decoded = np.empty(self.gray.shape)
        for row in range(1, rows):
            for col in range(1, cols):
                self.decoded[row][col] = (self.estimator[row][col] + 
                        self.gray[row-1][col] + self.gray[row][col-1]) * 0.5
        return self.decoded
