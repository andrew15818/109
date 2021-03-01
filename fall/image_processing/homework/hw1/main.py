import numpy as np
import cv2
import matplotlib.pyplot as plt
from argparse import ArgumentParser
from image_processing import ImageProcessor
from PIL import Image

filename = 'p1im2.png'

def main():

    # Open the image
    imgProc = ImageProcessor()
    image = imgProc.process(filename)

    Histogram = imgProc.histogram(image)


    
    
    tmp = [i for i in range(Histogram.shape[0])] 
   
    normalized = imgProc.normalize_histogram(Histogram)
    HSL = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)
    plt.imshow(HSL)
    #cv2.imshow(HSL)
    
    #plt.bar(tmp, normalized[:,0], color='red')
    #plt.bar(tmp, normalized[:,1], color='green')
    #plt.bar(tmp, normalized[:,2], color='blue')
    
    #RGB = imgProc.HSL_to_RGB(HSL)
    print(RGB)
    #plt.imshow(RGB)
    plt.show()
    
    


if __name__=='__main__':
    main()
