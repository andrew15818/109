import numpy as np
import tensorflow as tf
import pandas as pd
import cv2
import os
import keras.preprocessing as preprocessing

from keras.preprocessing.image import load_img, img_to_array
from matplotlib.image import imread
from keras import backend as K 
from keras.layers import (Input , Lambda, Conv2D, BatchNormalization, LeakyReLU,
        ZeroPadding2D, UpSampling2D)

# Return numpy arrays with image, can limit for memory/time constraints
def load_training_data(training_path, limit=None):
    training_data = []
    count = 0 
    # Loop through all the files in the directory
    for file in os.listdir(training_path):

        # Load the image in PIL then turn to NumPy
        image = load_img(training_path + file, target_size=(416, 416))
        image = img_to_array(image)
        training_data.append(image)

        if count == limit:
            break
        count = count + 1
    return training_data
    
def preprocess_data(data):
    # Rescale the image
    data = tf.keras.layers.experimental.preprocessing.Rescaling(1.0 / 255)(data) 
    return  

def create_model():
    pass

def conv_block():
    pass

def main():
    datapath = 'data/training_data/training_data/'
    labels = pd.read_csv('data/training_labels.csv')['label'].unique()

    print(labels) 
   # Load the data
    training_data = load_training_data(datapath, limit=100)
    preprocess_data(training_data)

if __name__=='__main__':
    main()
