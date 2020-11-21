import cv2 
import numpy as np
import matplotlib.pyplot as plt

from edgedetector import EdgeDetector

def main():
    name  = 'img/p1im3.png'
    image = cv2.imread(name)
    print(type(image))
    detector = EdgeDetector()

    image = detector.first_derivative(image)
    plt.imshow(image)
    plt.savefig('img/p1im3_result.png')
    plt.show()
if __name__=='__main__':  
    main()
