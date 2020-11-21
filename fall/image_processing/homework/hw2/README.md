# Image Processing Second Homework Assignment

## Edge Detection
This homework assignment involves performing edge detection on sample images.

Things to try:
- Gradient filter
Use the edge detection and boundary filters. Use first and second derivative? 
- Thresholding gradient magnitudes.

To perform the edge detection.

## Task 1: Edge Detection
TODO:
- Try gradient filters on the image, and Laplacian of Gaussian method
- Threshold the gradient magnitudes
- Compare the results, to see how meaningful edge points are.
- Play around with image preprocessing to see the effects on edge detection (avg. filter, 
contrast adjustment, ...)

How to do:
1. Take in the image.
2. Optionally, preprocess the image using averaging filter and contrast adjustment
3. Can implement LoG and first-order derivative edge detection
4. Thresholding the values with less than 33% max intensity value, and set them to 1, 0 otherwise.
5. LoG 
