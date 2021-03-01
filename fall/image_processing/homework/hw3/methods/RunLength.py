import cv2
import numpy as np

class RLCoding:
    def __init__(self, imagename):
        self.image = cv2.imread(imagename)
        self.gray = cv2.cvtColor(self.image, cv2.COLOR_BGR2GRAY)
        self.rows, self.cols = self.gray.shape 
    def encode(self):
        row, col = 0, 0
        decoded = []
        while row < self.rows:
            comp_row = []
            while col < self.cols:
                count = 0
                value = self.gray[row][col]
               
                while(self.gray[row][col] == value):
                    col += 1
                    count += 1

                    if col == self.cols:
                        break
                comp_row.append(tuple((value, count)))
                decoded.append(comp_row)
                if col == self.cols:
                    break
            row += 1
        return decoded 

    def decode(self, encoded):

        decoded = np.empty(self.gray.shape)
        for ridx, row in enumerate(encoded):
            if ridx >= self.rows:
                break
            col_count = 0
            for pair in row:
                value = pair[0]
                length = pair[1]
                print(f'setting {value} in {length} spots.')
                for i in range(length):
                    decoded[ridx][col_count] = value
                    col_count += 1
        print(self.gray == decoded)
        #cv2.imshow('hola', decoded/255)
        #cv2.waitKey(0)
        return decoded
