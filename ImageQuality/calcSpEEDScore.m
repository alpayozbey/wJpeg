function [sspeed] = calcSpEEDScore(yr, yd)

blk = 5;
sigma_nsq = 0.1;
window = fspecial('gaussian', 7, 7/6);
window = window/sum(sum(window));

[rows, colms] = size(yr);

  % read successful, can then reshape
        yr=double(reshape(yr, [colms rows])');
        yd=double(reshape(yd, [colms rows])');
        
        
            [sspeed, ~, tspeed, ~] = ...
                Single_Scale_Video_SPEED(yr, yr, yd, yd, 0, window, blk, sigma_nsq);
end