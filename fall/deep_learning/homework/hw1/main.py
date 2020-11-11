import numpy as np
import tensorflow as tf
import pandas as pd
import cv2
import os
import keras.preprocessing as preprocessing

from keras.preprocessing.image import load_img, img_to_array
from matplotlib.image import imread
from keras import backend as K 
from keras.layers import (Input , add,  Activation, Conv2D, BatchNormalization, LeakyReLU,
        Dense, GlobalAveragePooling2D)

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

# Model consists of many repeated structures, creates those blocks
# Conv2D, Batch, Activation
def _conv_unit(x, filters, kernel_size, strides=1):

    x = Conv2D(filters=filters,
                padding='same',
                kernel_size=kernel_size,
                strides=strides)(x)

    x = BatchNormalization()(x)
    x = LeakyReLU()(x)

    return x 

# Each conv_stack requires two conv blocks and an activation
def conv_block(model, filters):

    x = _conv_unit(model, filters=filters, kernel_size=1) 
    x = _conv_unit(x, filters=2*filters, kernel_size=3) 
    x = add([model, x])
    x = Activation('linear')(x)

    return x 

def conv_stack(x, filters, count, stride=1):

    for block in range(count):
        x = conv_block(x, filters)
    return x 

def create_model(size):
    input = Input(shape=size)

    # Layers 0 - 1
    x = _conv_unit(input, filters=32, kernel_size=3, strides=1)
    x = _conv_unit(x, filters=64, kernel_size=3, strides=2)
    
    # First conv stack
    x = conv_stack(x, filters=32, count=1)

    # Second conv unit and stack
    x = _conv_unit(x, filters=128, kernel_size=3, strides=2)
    x = conv_stack(x, filters=64, count=2)
    
    # Third conv unit and stack
    x = _conv_unit(x, filters=256, kernel_size=3)
    x = conv_stack(x, filters=128, count=8)

    # Fourth conv unit and stack
    x = _conv_unit(x, filters=512, kernel_size=3)
    x = conv_stack(x, filters=256, count=8)

    # Fifth section
    x = _conv_unit(x, filters=1024, kernel_size=3)
    x = conv_stack(x, filters=512, count=4)

    x = GlobalAveragePooling2D()(x)
    x = Dense(units=1000)(x)

    
    return x 

def main():
    datapath = 'data/training_data/training_data/'
    labels = pd.read_csv('data/training_labels.csv')['label'].unique()
   
    #print(labels) 
   # Load the data
    training_data = load_training_data(datapath, limit=100)
   
    preprocess_data(training_data)
    print(training_data[0].shape)
    create_model(training_data[0].shape)   
    print('Returned from making the network!')
if __name__=='__main__':
    main()
