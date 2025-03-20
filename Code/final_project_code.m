%%% Accessing webcam, taking photo, saving photo
camera = webcam;
preview(camera);
disp('Press any key to take a picture...');
I = snapshot(camera);
imwrite(I, 'test.jpg');
closePreview(camera);


%%% Facial detection using Computer Vision Toolbox 
faceDetector = vision.CascadeObjectDetector();
myFaceBox = step(faceDetector, I);
numFaces = size(myFaceBox, 1);
disp(['Number of faces detected: ', num2str(numFaces)]);


%%% Image bluring with lowpass, anti-aliasing gaussian filter
g1 = imresize(I, 0.5);
g2 = imresize(g1, 0.5);
g3 = imresize(g2, 0.5);
g4 = imresize(g3, 0.5);
G = imresize(g4, 0.5);


%%% K-means clustering method to segment image
k = 5;
[L,centers]=imsegkmeans(I,k);
J = label2rgb(L,im2double(centers));


%%% Apply a thermal-like color map
grayImage = rgb2gray(I);
T = ind2rgb(gray2ind(grayImage, 256), parula(256)); 


%%% Flip half the image to create mirror effect
M = I;
halfWidth = floor(size(I,2) / 2);
leftHalf = I(:, 1:halfWidth, :); 
flippedLeft = fliplr(leftHalf); 
M(:, halfWidth+1:end, :) = flippedLeft;


%%% Coloured outline with eroding and dilation 
h_colour = imcomplement(I); 
level = graythresh(I); 
BW_colour = imbinarize(I, level); 
se3 = ones(3,3);
se6 = ones(6,6);
eroded = imerode(BW_colour, se3);
dilated = imdilate(eroded, se6);
boundary_colour = dilated - eroded;


%%% Greyscale effect
I_gray = rgb2gray(I);
se5 = ones(5,5);
eroded_bw = imerode(I_gray, se5);


%%% Line Detection using Hough Transform
f_gray = rgb2gray(I);
f_edge = edge(f_gray, 'Canny'); 
[H, theta, rho] = hough(f_edge);
peaks = houghpeaks(H, 5);
lines = houghlines(f_edge, theta, rho, peaks, 'FillGap', 5, 'MinLength', 7);
f_lines_with_detection = I;
for k = 1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    f_lines_with_detection = insertShape(f_lines_with_detection, 'Line', ...
        [xy(1,1), xy(1,2), xy(2,1), xy(2,2)], 'LineWidth', 7, 'color', 'green');
end


%%% Image padding for photobooth effect
I_border = padarray(I, [150 75], 0, 'pre');
I_border = padarray(I_border, [100 75], 0, 'post');
G_border = padarray(G, [0 2], 0, 'pre');
G_border = padarray(G_border, [0 2], 0, 'post');
J_border = padarray(J, [150 75], 0, 'pre');
J_border = padarray(J_border, [100 75], 0, 'post');
T_border = padarray(T, [75 75], 0, 'pre');
T_border = padarray(T_border, [175 75], 0, 'post');
M_border = padarray(M, [150 75], 0, 'pre'); 
M_border = padarray(M_border, [100 75], 0, 'post');
B_border = padarray(boundary_colour, [75 75], 0, 'pre');
B_border = padarray(B_border, [100 75], 0, 'post'); 
E_border = padarray(eroded_bw, [75 75], 0, 'pre'); 
E_border = padarray(E_border, [100 75], 0, 'post');
F_border = padarray(f_lines_with_detection, [75 75], 0, 'pre');
F_border = padarray(F_border, [175 75], 0, 'post'); 


%%% Choose text message based on number of faces
if numFaces == 1
    message = 'Looking cool!';
elseif numFaces == 2
    message = 'Two peas in a pod!';
elseif numFaces > 2
    message = 'What a happy bunch!';
else
    message = 'No faces detected. Try again!';
end


%%% Add text overlay
I_text = insertText(I_border, [50, 50], message, 'FontSize', 80, 'BoxColor', 'red', 'TextColor', 'white');
I_text = insertText(I_text, [560, 900], 'Cool original', 'FontSize', 50, 'BoxColor', 'black', 'TextColor', 'white');                          
J_text = insertText(J_border, [600, 0], 'Pixel Pop', 'FontSize', 50, 'BoxColor', 'black', 'TextColor', 'white');
J_text = insertText(J_text, [660, 900], 'Artsy', 'FontSize', 50, 'BoxColor', 'black', 'TextColor', 'white');
T_text = insertText(T_border, [600, 825], 'Heat Vision', 'FontSize', 50, 'BoxColor', 'black', 'TextColor', 'white');
M_text = insertText(M_border, [570, 900], 'Alien Invasion', 'FontSize', 50, 'BoxColor', 'black', 'TextColor', 'white');
D_text = insertText(B_border, [590, 825], 'Neon Sketch', 'FontSize', 50, 'BoxColor', 'black', 'TextColor', 'white');
E_text = insertText(E_border, [600, 825], 'Retro Noir', 'FontSize', 50, 'BoxColor', 'black', 'TextColor', 'white');
F_text = insertText(F_border, [610, 825], 'Cyber grid', 'FontSize', 50, 'BoxColor', 'black', 'TextColor', 'white');


%%% Print photo strips
fig1 = figure;
montage({I_text,G_border,J_text,T_text}, "size", [4,1]);
title('Photo Booth Strip 1');
drawnow;

fig2 = figure;
montage({M_text,D_text,E_text,F_text}, 'Size', [4, 1]);
title('Photo Booth Strip 2');
drawnow;
