function [jpeg_Quality, maxScale] = computeCompression2(Image,Scale,Compression,SSIMorPSNR)

Quality = zeros(length(Compression),length(Scale));
Vpsnr = Quality;
ssimval = Quality;
endComp = Quality;

for i = 1:length(Compression)
    for ii = 1:length(Scale)
        
     [~, Quality(i,ii), Vpsnr(i,ii), ssimval(i,ii), endComp(i,ii)] = findQuality2(Image,Scale(ii), Compression(i));
        
    end
end

switch SSIMorPSNR
    case 'SSIM'
        ValueMax = ssimval;
    case 'PSNR'
        ValueMax = Vpsnr;
end

% indx = strfind(ImageName,'/');
%    imName_pre = ImageName(1,indx(end)+1:end);

for i = 1:length(Compression)
%     imName = [imName_pre(1,1:end-4) '_' num2str(Compression(1,i)) '.png'];
    tempScale = ValueMax(i,:);
    indx = find(tempScale == max(tempScale),1);
    maxScale(1,i) = Scale(1,indx);
    jpeg_Quality(1,i) = Quality(i,indx);
%     
%     directoryIm_Sc = ['OutputImages/' 'Scale/' 'Itself/', num2str(maxScale)];
%     directoryDCT_Sc = ['OutputImages/' 'Scale/' 'DCT/', num2str(maxScale)];
%     
%     directoryIm_Qa = ['OutputImages/' 'Quality/' 'Itself/', num2str(jpeg_Quality)];
%     directoryDCT_Qa = ['OutputImages/' 'Quality/' 'DCT/', num2str(jpeg_Quality)];
%     
%     dctIm = uint8(histeq(dct2(Image-128))*255);
%     
%     Image_write = Image;
%     Image_write(size(Image,1)+1:size(Image,1)+64,:,:) = uint8(ones(64,size(Image,2), size(Image,3)) .* Compression(1,i));
%     
%     DCT_write = dctIm;
%     DCT_write(size(dctIm,1)+1:size(dctIm,1)+64,:,:) = uint8(ones(64,size(dctIm,2), size(dctIm,3)) .* Compression(1,i));
%    
%    
%      if ~exist(directoryIm_Sc, 'dir')
%        mkdir(directoryIm_Sc)
%      end
%      
%      imwrite(Image_write,[directoryIm_Sc '/' imName]);
%     
%      
%      if ~exist(directoryDCT_Sc, 'dir')
%        mkdir(directoryDCT_Sc)
%      end
%      
%      imwrite(DCT_write,[directoryDCT_Sc '/' imName]);
%      
%      
%     
%       if ~exist(directoryIm_Qa, 'dir')
%        mkdir(directoryIm_Qa)
%      end
%      
%      imwrite(Image_write,[directoryIm_Qa '/' imName]);
%     
%      
%      if ~exist(directoryDCT_Qa, 'dir')
%        mkdir(directoryDCT_Qa)
%      end
%      
%      imwrite(DCT_write,[directoryDCT_Qa '/' imName]);
%     
    
end

end


