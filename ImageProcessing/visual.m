function main
    clc
    close all
    clear all

    myDogDetector_1;
end

function myDogDetector_1
    src_old = imread('/Users/haichao/Desktop/ImageProcessing/data/yard1.jpg');
    src = rgb2gray(src_old);
    src = double(src);  % missing double handle

%     h1 = fspecial('gaussian', 5, 0.5);
%     h2 = fspecial('gaussian', 5, 1);
%     h3 = fspecial('gaussian', 5, 2);
%     h4 = fspecial('gaussian', 5, 3);
    h1 = fspecial('gaussian', 5, 0.3);
    h2 = fspecial('gaussian', 5, 0.5);
    %h3 = fspecial('gaussian', 5, 0.5);
    %h4 = fspecial('gaussian', 5, 0.6);

    src1 = imfilter(src, h1);
    src2 = imfilter(src, h2);
    %src3 = imfilter(src, h3);
    %src4 = imfilter(src, h4);

    % ----------------------------【DoG detector】----------------------
    src12 = src1 - src2;
    %src23 = src3 - src2;
    %src34 = src4 - src3;

    src_DoG(:,:,1) = src12;
    %src_DoG(:,:,2) = src23;
    %src_DoG(:,:,3) = src34;

    figure,imshow(src12);
    %figure,imshow(src23);
    %figure,imshow(src34);

    result = zeros(size(src_DoG, 1), size(src_DoG, 2));

    % -------------- 【查找DoG 焦点】-------------------
    level = 5;

    around = zeros(1,9);
    for i = 2:size(src_DoG, 1)-1
        for j = 2:size(src_DoG, 2)-1

            % -------------- 【查找周围26 个像素值 并放入数组中】-------------------
            around_id = 1;
            for ii = i-1:i+1
                for jj = j-1:j+1
                    for layer = 1:3
                        if (ii == i) && (jj == j) && layer == 2
                            continue;
                        end

                        around(around_id) = src_DoG(ii, jj, layer);
                        around_id = around_id + 1;
                    end                    
                end
            end

            around_max = max(around);
            around_min = min(around);

            if (around_max < src_DoG(i, j, 2)) ...
                    || (around_min > src_DoG(i, j, 2))
                if around_max > level || around_min < -level   % missing level judge
                    result(i, j) = 2;
                end
            end

        end
    end

    % -----------------------【绘图】-------------------------
    [posy, posx] = find(result == 1);
    %figure, imshow(src_old)
    hold on
    %plot(posx, posy, '.');

    %saveas(gcf, 'res2', 'bmp')

end