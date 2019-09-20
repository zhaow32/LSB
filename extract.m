clear all;
file_name = 'lsb_watermark.bmp';
watermark_image=imread(file_name);

R_wmimage=size(watermark_image,1);
C_wmimage=size(watermark_image,2);

file_name ='watermarked_image.bmp';
orig_watermark=imread(file_name);
Rwm=size(orig_watermark,1);
Cwm=size(orig_watermark,2);

for ii=1:R_wmimage;
    for jj=1:C_wmimage;
        watermark(ii,jj)=bitget(watermark_image(ii,jj),1);
    end
end

watermark=2*double(watermark); % why double the size??//

for ii =1:Rwm-1
    for jj=1:Cwm-1
        watermarka(ii+1,jj+1)=watermark(ii,jj);
    end
end

watermarka(1,1)=watermark(Rwm,Cwm);


figure(1)
subplot(1,2,1);
imshow(watermarka,[])
title('extracted watermark');

figure(2)
subplot(1,2,2);
imshow(orig_watermark,[]);
title('original watermark');

