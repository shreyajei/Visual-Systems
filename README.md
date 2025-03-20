# Visual Systems: Spring Term Final Project  
**PHOTO BOOTH**

Serena Sebastian; 02081030

Shreya Jei; CID: 02080949

# Description
An interactive photobooth experience using MATLAB was developed, applying eight creative image filters to captured snapshots. These filters include original, blurred, artistic K-means clustering, a thermal imaging like effect, mirrored alien effect, collared outlines, grayscale, and laser-like line detection, each with a playful photobooth-style name. The system integrates facial detection to personalise one line of feedback (overlaid in red), while custom padding adjustments ensure consistent image formatting and the classic photobooth feel. The final output consists of two montage strips displaying four effects each, providing an engaging visual of the user’s image.

# Final Result
![Alt text](https://github.com/shreyajei/Visual-Systems/blob/main/final_result.png)

# Instructions
Before running the code, ensure that MATLAB has the following toolboxes installed:
* [Image Processing Toolbox](https://uk.mathworks.com/help/images/index.html) (for image transformations and colour adjustments)

* [Computer Vision Toolbox](https://uk.mathworks.com/help/vision/index.html) (for facial detection)

For best results:
* Use a well-lit environment for clear image capture

* Ensure the camera is functional and accessible via MATLAB

# Evidence and Explanation of Filters Working
## Filter 1: Neon Sketch
### Aim
The goal of this filter is to apply the Otsu method for image thresholding and then use morphological operations to find the boundaries of the face and background in the image into RGB format while preserving the original image's colour information

**Otsu Method**: This is a nonparametric and unsupervised method of automatic threshold selection for picture segmentation is presented. An optimal threshold is selected by the discriminant criterion, namely, so as to maximize the separability of the resultant classes in grey levels. The procedure uses the zeroth- and the first-order cumulative moments of the gray-level histogram. It is straightforward to extend the method to multi-threshold problems. Several experimental results are also presented to support the validity of the method.

![Alt text](https://github.com/shreyajei/Visual-Systems/blob/main/neon_lines.png)

### Code Explanation
![Alt text](https://github.com/shreyajei/Visual-Systems/blob/main/neonfilter_code.png)

## Filter 2: Cyber Grid
### Aim
The goal of this filter is to apply edge detection using the Canny method, and then use the Hough transform to detect and overlay lines on the original image.

**Canny Edge Detection**: This method detects edges by finding the intensity gradients of the image. It uses a multi-stage algorithm to detect a wide range of edges in images.

**Hough Transform**: This technique is used to detect simple shapes such as lines, circles, and ellipses within an image. It is particularly useful for line detection in edge-detected images.

![Alt text](https://github.com/shreyajei/Visual-Systems/blob/main/edge_detection.png)

### Code Explanation
![Alt text](https://github.com/shreyajei/Visual-Systems/blob/main/houghtrasform_code.png)

## Filter 3: Blur
### Aim 
The goal of this filter is to create a blur effect by progressively resizing the image multiple times using the imresize function. 

**Progressive Resizing**: The captured image is resized multiple times using the imresize function with a scaling factor of 0.5. Each resizing step reduces the image size by half, which inherently applies a lowpass filter (Gaussian) to remove high-frequency details, creating a blur effect.

![Alt text](https://github.com/shreyajei/Visual-Systems/blob/main/blur.png)

### Code Explanation
![Alt text](https://github.com/shreyajei/Visual-Systems/blob/main/code_blur.png)

## Filter 4: Artsy
### Aim
The goal of this filter is to capture an image using a webcam and then apply k-means clustering to segment the image into distinct regions based on colour. 

**k-means Clustering**: This algorithm partitions the image into k clusters by minimising the variance within each cluster. It groups pixels with similar colour values together, effectively segmenting the image.

**label2rgb Function**: This function maps the label matrix L to an RGB image, assigning a unique colour to each cluster for visualisation purposes.

![Alt text](https://github.com/shreyajei/Visual-Systems/blob/main/artsy.png)

### Code Explanation
![Alt text](https://github.com/shreyajei/Visual-Systems/blob/main/artsy_code.png)

## Filter 5: Alien Invasion
### Aim
The goal of this filter is to capture an image using a webcam and then create a mirroring effect of the same.

**Flipping**: The fliplr function is used to flip the left half of the image horizontally and merged with the original right half to produce the final mirrored image.

![Alt text](https://github.com/shreyajei/Visual-Systems/blob/main/mirror.png)

### Code Explanation
![Alt text](https://github.com/shreyajei/Visual-Systems/blob/main/mirror_code.png)

## Filter 6: Retro Noir
### Aim
The goal of this filter is to apply an erosion operation to highlight specific features and reduce noise in the image.

**Grayscale Conversion**: The rgb2gray function converts the RGB image to grayscale, simplifying the image to a single intensity channel.

**Erosion**: The imerode function applies the erosion operation using a structuring element. This operation removes pixels from the boundaries of objects, effectively shrinking them and reducing noise.

![Alt text](https://github.com/shreyajei/Visual-Systems/blob/main/grayscale.png)

### Code Explanation
![Alt text](https://github.com/shreyajei/Visual-Systems/blob/main/grayscale_code.png)

## Filter 7: Heat Vision
### Aim
The goal was to create a thermal-like effect by converting the image to grayscale and applying a false-colour colormap. This simulates heat-map visuals commonly used in thermal imaging.

![Alt text](https://github.com/shreyajei/Visual-Systems/blob/main/thermal.png)

### Code Explanation
![Alt text](https://github.com/shreyajei/Visual-Systems/blob/main/thermalimage_code.png)

# Detecting number of faces
## Aim
To detect faces in the image and display a personalised message based on the number of faces detected.
![Alt text](https://github.com/shreyajei/Visual-Systems/blob/main/number_of_faces.png)

## Code Explanation
![Alt text](https://github.com/shreyajei/Visual-Systems/blob/main/number_of_faces_code.png)

# Evaluation of the Application 
Before settling on the photobooth idea, initial efforts were made to detect objects using AlexNet and GoogleNet. However, due to inaccuracies in these models, this approach was not pursued further. Additionally, the application lacked interactivity and excitement, as it did not engage the user effectively.
![Alt text](https://github.com/shreyajei/Visual-Systems/blob/main/objects_detection.png)

We then shifted our focus to implementing a photobooth, inspired by the Apple's photobooth app. Our goal was to create personalised filters using the knowledge gained from the Labs we did and to add our own elements of fun and customisation. 
The application can print two strips, similar to existing photobooth formats, allowing users to view their photos. The preview camera enables users to pose before the photo is taken, and the results are produced immediately. When testing the program with friends, we found that they enjoyed the experience and often commented on their favourite filters, highlighting the interactives of the application

One feature we attempted to implement but could not complete in time was emotion detection. The idea was to detect the user's emotions before taking the photo to ensure they were in a “happy" emotional state before clicking the photo. Although the code was partially implemented and worked at times, the emotion detection was mostly inaccurate, thus we decided not to include it in the final application. However, this would be a valuable feature to include in the next iteration.
![Alt text](https://github.com/shreyajei/Visual-Systems/blob/main/emotion_detection.png)

# Personal Reflections
## **Serena**
During this project, Shreya and I worked together in the development and refinement of the photobooth, including implementing and testing multiple creative filters such as the thermal imaging effect, edge detection, and artistic clustering. We also worked on integrating facial detection using MATLAB’s Computer Vision Toolbox, ensuring that the feature accurately identified faces and displayed engaging messages based on the number of detected subjects. Additionally, we worked on optimising the code, adjusting padding parameters for better visual consistency, and ensuring the image produced reflected the look and feel of a photo booth.

Through this experience, I have gained a deeper understanding of  image processing capabilities, particularly in manipulating colour spaces, applying transformations, and leveraging built-in machine learning models for facial recognition. One of the most valuable lessons I learned was the importance of balancing creativity with technical feasibility. Some filters looked interesting but required fine tuning to work efficiently across different images. I also became more aware of the importance of clear documentation so Shreya could understand my infinite adjustments.

If I had the chance to do another project like this again, I would look into industry applicable image processing uses. Though a photo booth is fun and provides a surprising and engaging user experience, fit for the context of this project’s outputs and timeframe, I find medical image processing fascinating and would love to apply it in the realm of detecting abnormalities or counting entities to demystify visits to the doctor!

Overall, this project has strengthened my ability to develop interactive image processing applications and troubleshoot technical challenges. It has also reinforced the importance of testing across different inputs to ensure robust and user friendly outputs. I have very much enjoyed the module’s structure and contents and will be looking forward to revising it after a short break!

## **Shreya**
Serena and I collaborated on developing the photobooth idea for our proejct by experimenting with various filters such as boundary line detection, the Otsu method, and edge detection. Initially, we also explored using AlexNet and GoogleNet, and delved into the Computer Vision Toolbox to experiment with facial emotion detection which was very fun to play around with and learn at the same time. We brainstormed ways to present the results of the filters in an engaging format for users, which led us to adopt the idea of displaying the output in strips, similar to traditional photobooths.

While it was fascinating to experiment with machine learning techniques like k-means clustering and facial emotion recognition using large dataset models, our primary goal was to make the application interactive and fun. We achieved this by inviting our friends from Dyson Level 2 to pose for photos while also gathering their feedback to iteratively improve our filters.

Working with Serena was a great experience. We divided tasks equally and regularly collaborated to integrate our work, which allowed us to enjoy the process without the stress of rushing to meet deadlines.

One key takeaway from this project is the importance of flexibility. While we initially were fixated on making the emotion detection feature work, we learned to adapt by implementing a simpler yet fun alternative, such as detecting the number of faces and adding personalised comments based on the number. This approach maintained the interactive and enjoyable nature of the application.

Overall, this project has strengthened my ability to develop interactive image processing applications, troubleshoot technical challenges, and enhance my MATLAB coding skills, which will be valuable in my future career.
