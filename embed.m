clc;
close all;
clear all;
%% generate random binary map watermark information capacity with 2%
N = 199*199;
blackbit = 792;
v = ones(N,1);
v(1:blackbit,1) = 0;
A = reshape(v(randperm(N)),199,199);
imwrite(mat2gray(A), 'a.bmp');
% figure
% imshow('a.bmp')
% title('watermark with info capacity 2%');

%% generate random binary map watermark information capacity with 1%
N = 199*199;
blackbit = 396;
v = ones(N,1);
v(1:blackbit,1) = 0;
A = reshape(v(randperm(N)),199,199);
imwrite(mat2gray(A), 'b.bmp');
% figure
% imshow('b.bmp')
% title('watermark with info capacity 1%');

%% generate random binary map watermark information capacity with 0.5%
N = 199*199;
blackbit = 198;
v = ones(N,1);
v(1:blackbit,1) = 0;
A = reshape(v(randperm(N)),199,199);
imwrite(mat2gray(A), 'c.bmp');
% figure
% imshow('c.bmp');
% title('Message','fontsize',16);


% embed 
A=imread('woman_199x199.bmp');
orig=rgb2gray(A);
figure
imshow(orig);
title('Cover Image in Grayscale','fontsize',20);
% A=double(rgb2gray(A));
% % figure
% % subplot(2,4,1);
% % [h w]=size(A);
% % for k=1:8
% %     for i=1:h
% %         for j=1:w
% %             tmp(i,j)=bitget(A(i,j),k);
% %         end
% %         subplot(2,4,k);
% %         imshow(tmp,[]);
% %         title([' bitplane',num2str(k)],'fontsize',16);
% %     end
% % end
% 
% 
% [C,map]=imread('woman_199x199.bmp'); % original image
% [w,map]=imread('c.bmp'); % a watermark
% %column and row info of cover image
% % row_C=size(C,1);
% % col_C=size(C,2);
% row_A=size(A,1);
% col_A=size(A,2);
% %column and row info of watermark
% row_wm=size(w,1);
% col_wm=size(w,2);
% %w_i=C;
% w_i=A;
% for ii = 1:row_A;
%     for jj = 1:col_A;
%         w_i(ii,jj)=bitset(w_i(ii,jj),1,w(ii,jj)); % 1 means we substitute the LSB of cover image with watermark image pixel by pixel
%     end
% end
% imwrite(w_i,'watermarked_image.bmp')
% figure
% subplot(1,2,1)
% imshow(w_i,[])
% title('Encoded Image','fontsize',20)
% 
% subplot(1,2,2)
% imshow(A,[])
% title('Cover Image','fontsize',20)
% figure
% imshow(w,[]);
% title('watermark')
% w_i=rgb2gray(C);
% %% gaussian noise attack
% distImg=imnoise(im2double(w_i),'gaussian',0,10^2/255^2);
% figure
% subplot(1,2,1);
% imshow(w_i);
% title('Encoded Image','fontsize',20);
% subplot(1,2,2);
% imshow(distImg);
% title('Noised Image','fontsize',20);
% imwrite(distImg,'afternoiseattack.bmp')
% %% extract
% clear all;
% file_name = 'afternoiseattack.bmp';
% watermark_image=imread(file_name);
% 
% R_wmimage=size(watermark_image,1);
% C_wmimage=size(watermark_image,2);
% 
% file_name ='c.bmp';
% orig_watermark=imread(file_name);
% Rwm=size(orig_watermark,1);
% Cwm=size(orig_watermark,2);
% 
% for ii=1:R_wmimage
%     for jj=1:C_wmimage
%         watermark(ii,jj)=bitget(watermark_image(ii,jj),1);
%     end
% end
% 
% watermark=double(watermark);
% for ii =1:Rwm-1
%     for jj=1:Cwm-1
%         watermarka(ii+1,jj+1)=watermark(ii,jj);
%     end
% end
% 
% watermarka(1,1)=watermark(Rwm,Cwm);
% 
% 
% figure
% subplot(1,2,1);
% imshow(watermarka)
% title('Decoded Message','fontsize',16);
% subplot(1,2,2);
% imshow(orig_watermark);
% title('original watermark','fontsize',16);
% 
% %% calculate watermark similarity
% extract_watermark=im2bw(watermarka);
% orig_watermark=im2bw(orig_watermark);
% [h,w]=size(orig_watermark);
% sum=0;
% for i=1:h
%     for j=1:w
%         if extract_watermark(i,j)==orig_watermark(i,j)
%             sum =sum+1;
%         end
%     end
% end
% sim=double(sum/(w*h))*100;
% disp(['the similarity of watermark is ' num2str(sim) '%']);

