# Image Compression
## Introduction
If we were to store all the raw data of a single image, say (1920x1080x24) bits
per frame, then storing a single 2 hour movie at 30 fps would be prohibitively 
costly. **Compression** allows us to reduce the space an image takes on a disk.
We have a reduction ratio *C* which can allow us to reduce the space an image takes.

There are a couple of redundancies that we can make sure we use:
1. **Coding redundancy**: We assign a code to a piece of information or events.
If we use 8 bits to store the intensity, this might be more than we need, thus 
we waste some potential space.
2. **Spatial and Temporal Redundancy**: Since pixels are similar to neighboring 
pixels, and those pixels might not vary that much from frame to frame, we might 
be replicating the values of many pixels that might be similar at the same time.
3. **Irrelevant Information**: If our visual system ignores certain pieces of 
information, then it would be unnecessary to store all of them.

### Coding Redundancy

