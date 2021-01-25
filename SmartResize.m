function [OutImage] = SmartResize(Image,OutSize)

SizeIm = size(Image,1,2);
RatioSize = SizeIm./OutSize;
RatioMin = min(RatioSize);
PreSize = round(OutSize.*RatioMin);

SizeDiff = floor((SizeIm-PreSize)/2);

OutImage = Image(SizeDiff(1,1)+1: SizeDiff(1,1)+ PreSize(1,1),...
    SizeDiff(1,2)+1: SizeDiff(1,2)+ PreSize(1,2),:);

OutImage = imresize(OutImage,OutSize);


end

