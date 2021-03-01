import numpy as np
import math
import cv2
from PIL import Image

class ImageProcessor:
    def __init__(self):
        pass

    def process(self, filename):
        image = cv2.imread(filename) 

        self.num_pixels = image.shape[0] * image.shape[1]
        return image

    def histogram(self, image, bins=256):
        num_channels = image.shape[2]
        hist = np.zeros((bins, num_channels)) 

        for row in range(len(image)):
            for col in range(len(image[row])):

                r = image[row][col][0]
                g = image[row][col][1]
                b = image[row][col][2]

                hist[r][0] += 1
                hist[g][1] += 1
                hist[b][2] += 1

        return hist

    def normalize_histogram(self, histogram): 
        colors = histogram.shape[1]
        normalized = np.zeros((1, colors)) 
        
        for col in range(colors):
            normalized[0][col] = ((255 / self.num_pixels) 
                * np.sum(histogram[:,col]))
        
        return normalized 

    # Turn the RGB image to Hue, 
    def RGB_to_HSL(self, image):
        # I should probably change this to only three color channels
        hsl = np.zeros(image.shape, 'float64')
        print(f'HSL shape: {hsl.shape}')
        for row in range(len(image)):
            for col in range(len(image[row])):
                # color channels
                R = image[row][col][0] / 255
                G = image[row][col][1] / 255
                B = image[row][col][2] / 255
                #print(f'RGB: {R},{G},{B}') 

                MIN = min(R, G, B)
                MAX = max(R, G, B)
                L = (MAX + MIN) / 2

                if (MAX - MIN) == 0:
                    S = 0
                else:
                    S = (MAX - MIN) / (1 - abs(2*L - 1))
                
                # Getting the Hue
                if MAX == MIN:
                    H = 0 
                elif MAX == R and G >= B:
                    H = 60 * ((G - B) / (MAX - MIN))
                elif MAX == R and G < B:
                    H = 60 * ((G - B) / (MAX - MIN)) + 360
                elif MAX == G:
                    H = 60 * ((B - R) / (MAX - MIN)) + 120 
                elif MAX == B:
                    H = 60 * ((R - G) / (MAX - MIN)) + 240
            
                #print(f'HSL: {H}, {S}, {L}')
                hsl[row][col] = np.array([H, S, L])

        return hsl 

    def HSL_to_RGB(self, image):
        rgb = np.zeros((600, 800, 3), 'uint8')
        for row in range(len(image)):
            for col in range(len(image[row])):
                H = image[row][col][0]
                S = image[row][col][1]
                L = image[row][col][2]

                C = (1 - abs(2 * L - 1) * S)
                X = C * (1 - abs((H / 60) % 2 - 1))
                m = L - (C / 2)

                Rp, Gp, Bp = 0, 0, 0

                if H >=0 and H < 60:
                    Rp, Gp, Bp = C, X, 0
                elif H >=0 and H < 120:
                    Rp, Gp, Bp = X, C, 0
                elif H >=120 and H < 180:
                    Rp, Gp, Bp = 0, C, X
                elif H >= 180 and H < 240:
                    Rp, Gp, Bp =  0, X, C
                elif H >= 240 and H < 300:
                    Rp, Gp, Bp = X, 0, C
                elif H >= 300 and H < 360:
                    Rp, Gp, Bp = C, 0, X
            
            R = (Rp + m) * 255
            G = (Gp + m) * 255
            B = (Bp + m) * 255
            #print(f'RGB: {R}, {G}, {B}')
            rgb[row, col] = np.array([R, G, B])

        return rgb 

    def contrast_adjustment(self):
        pass

    def noise_reduction(self):
        pass

    def color_correction(self):
        pass
