
function [LoIndex] = calcSMADScore(yr,yd)
[rows, colms] = size(yr);

  % read successful, can then reshape
        OrgImg=double(reshape(yr, [colms rows])');
        DstImg=double(reshape(yd, [colms rows])');

    
    HiIndex = hi_index(OrgImg, DstImg);
    LoIndex = lo_index(OrgImg, DstImg);  


end