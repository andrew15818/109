import cv2 
import numpy as np
import matplotlib.pyplot as plt

from edgedetector import EdgeDetector

def main():
    name  = 'img/p1im1.png'
    image = cv2.imread(name)
    print(type(image))
    detector = EdgeDetector()
    image = detector.apply_filter('avg', image)
    plt.imshow(image)
    plt.show()
if __name__=='__main__':  
    main()
