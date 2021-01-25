function [compressedImage, Qual, Vpsnr,ssimval, Comp] = findQuality2(Image,Scale, Compression)


Size_Uncomp = numel(Image);
I_d = imresize(Image, round(size(Image,1,2)./Scale));

    for q = 0:10
    
        RealSize = getCompration(I_d,q*10);
        Comp(1,q+1) = round(Size_Uncomp/RealSize);
 
    end 
    temp = abs(Comp-Compression);
    temp2 = find(temp == min(temp));
    Qual = (temp2(end)-1)*10;
    RealSize = getCompration(I_d,Qual);
    Comp = round(Size_Uncomp/RealSize);
    fileName = fullfile('Temp','getComp.jpeg');
    compressedImage = imresize(imread(fileName),size(Image,1,2));
    Vpsnr = psnr(compressedImage,Image);
    ssimval = ssim(compressedImage,Image);
end

