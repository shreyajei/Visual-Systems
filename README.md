# Visual Systems
Spring Term Final Project  
Serena Sebastian, Shreya Jei

# Description



# Filter 1: Neon Sketch
## Aim
The goal of this filter is to apply the Otsu method for image thresholding and then use morphological operations to find the boundaries of the face and background in the image into RGB format while preserving the original image's colour information

Otsu Method: This is a nonparametric and unsupervised method of automatic threshold selection for picture segmentation is presented. An optimal threshold is selected by the discriminant criterion, namely, so as to maximize the separability of the resultant classes in grey levels. The procedure uses the zeroth- and the first-order cumulative moments of the gray-level histogram. It is straightforward to extend the method to multi-threshold problems. Several experimental results are also presented to support the validity of the method.

![Alt text](https://github.com/shreyajei/Visual-Systems/blob/main/image%2093.png)

## Code Explaination
![Alt text](https://github.com/shreyajei/Visual-Systems/blob/main/neonfilter_code.png)

# Filter 2: Cyber Grid
## Aim
The goal of this filter is to apply edge detection using the Canny method, and then use the Hough transform to detect and overlay lines on the original image.

Canny Edge Detection: This method detects edges by finding the intensity gradients of the image. It uses a multi-stage algorithm to detect a wide range of edges in images.

Hough Transform: This technique is used to detect simple shapes such as lines, circles, and ellipses within an image. It is particularly useful for line detection in edge-detected images.

![Alt text](https://github.com/shreyajei/Visual-Systems/blob/main/image%2095.png)

## Code Explaination
![Alt text](https://github.com/shreyajei/Visual-Systems/blob/main/houghtrasform_code.png)

# Filter 3: Blur
## Aim 
The goal of this filter is to create a blur effect by progressively resizing the image multiple times using the imresize function. 

Progressive Resizing: The captured image is resized multiple times using the imresize function with a scaling factor of 0.5. Each resizing step reduces the image size by half, which inherently applies a lowpass filter (Gaussian) to remove high-frequency details, creating a blur effect.

![Alt text](https://github.com/shreyajei/Visual-Systems/blob/main/blur.png)

## Code Explaination
![Alt text](https://github.com/shreyajei/Visual-Systems/blob/main/code_blur.png)




