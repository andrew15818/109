import cv2 
import numpy as np
import matplotlib.pyplot as plt

from edgedetector import EdgeDetector

first_derivative_mask =  [[-1, 0, 1],
                        [-1, 0, 1],
                        [-1, 0, 1]] 
second_derivative_mask = [[0, 1, 0],
                        [1, -4, 1],
                        [0, 1, 0]]

def main():
    name  = 'img/p1im3.png'
    image = cv2.imread(name)
    print(type(image))
    detector = EdgeDetector()
    image1 = detector.avg_filter(image)
    image1 = detector.apply_rgb_mask(image, first_derivative_mask) 
    #image2 = detector.apply_rgb_mask(image, second_derivative_mask) 
    #fig = plt.figure(figsize=(8,8))
   
    plt.imshow(image1)
    #plt.imshow(image2)
    plt.savefig('img/p1im3_result.png')
    plt.show()
if __name__=='__main__':  
    main()
