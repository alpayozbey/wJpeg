function srred_now = calcStrredScore_opt(yr, yd)

band = 4;
Nscales = 5;
Nor = 6;
blk = 3;
sigma_nsq = 0.1;

[rows, colms] = size(yr);

  % read successful, can then reshape
        yr=double(reshape(yr, [colms rows])');
        yd=double(reshape(yd, [colms rows])');
        
        [srred_now, ~, trred_now, ~] = extract_info_opt(yr, yr, yd, ...
            yd, band, Nscales, Nor, ...
            blk, sigma_nsq);
    

end