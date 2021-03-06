%% Clear all
clc; close all; clc;
%% Add path
addpath('KeypointDetect');
%% Load image
%img1 = imread('/Users/haichao/Desktop/ImageProcessing/data/campus_01.jpg');
%img2 = imread('/Users/haichao/Desktop/ImageProcessing/data/campus_02.jpg');
%img1 = imread('/Users/haichao/Desktop/ImageProcessing/data/building_01.jpg');
%img2 = imread('/Users/haichao/Desktop/ImageProcessing/data/building_02.jpg');
%img1 = imread('/Users/haichao/Desktop/ImageProcessing/data/yosemite1.jpg');
%img2 = imread('/Users/haichao/Desktop/ImageProcessing/data/yosemite2.jpg');

%img1 = imread('/Users/haichao/Desktop/ImageProcessing/data/yard1.jpg');
%img2 = imread('/Users/haichao/Desktop/ImageProcessing/data/yard2.jpg');

img1 = imread('/Users/haichao/Desktop/ImageProcessing/data/uttower1.jpg');
img2 = imread('/Users/haichao/Desktop/ImageProcessing/data/uttower2.jpg');
%%
%% Feature detection
[feature1, pyr1, imp1] = detect_features_Harris_Laplace(img1);
pt1disp = feature1(:,1:2);
pt1 = feature1(:, 8:9);
desc1 = SIFTDescriptor(imp1, pt1, feature1(:,3));

[feature2, pyr2, imp2] = detect_features_Harris_Laplace(img2);
pt2disp = feature2(:,1:2);
pt2 = feature2(:, 8:9);
desc2 = SIFTDescriptor(imp2, pt2, feature2(:,3));

%% Test Matcher
M = SIFTSimpleMatcher(desc1, desc2);

%% Visualize match
PlotMatch(im2double(img1), im2double(img2), pt1disp', pt2disp', M');
