# ImageProcessing


## Grey Image Opeartion

### a. sub-sampling

Implement a function that sub-samples grey level images by a factor n, with n a multiple of 2. The function is able to sub-sample independently in the horizontal and in the vertical direction or in both directions at the same time.

Result of using the following factors: 2 horizontal, 2 vertical, 2 vertical and 8 horizontal, 4 vertical and 4 horizontal:

![subsample](images//subsampling_images.jpg)

### b. up-sapmling

Scaling-up an image (up-sampling) requires the filling of the new positions given the original pixels. This filling can be obtained by interpolation. Different interpolation techniques can be used. The choice depends on the quality we want to achieve and on the computation resources we have available.

The **nearest-neighbour** interpolation is the simplest and fastest technique, but it is also a technique achieving low quality results. **Bilinear** interpolation is computationally more intensive, but it achieves higher quality results.

The function is able to up-sample independently in the horizontal and in the vertical direction or in both directions simultaneously.


## Colour Image Opeartion


### a. negative

Create the negative of the image (grey or colour):

![negative](images//negative_lena.png)












