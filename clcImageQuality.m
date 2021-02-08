function [Q] = clcImageQuality(imorg,imdist,metric)

path(path,'./ImageQuality');

switch metric
    
    case 'SSIM'
        
        Q = ssim(imorg,imdist);
        
    case 'PSNR'
        
        Q = psnr(imorg,imdist);
        
    case 'VIF'
        
        Q = real(abs(vifvec(imorg,imdist)));
        
     
    case 'ICID'    
        
        
        [Q, ~] = iCID(imorg,imdist);
        
    case 'SPEED'
        
        Q = calcSpEEDScore(imorg,imdist);
        
    case 'SMAD'
        
        Q = calcSMADScore(imorg,imdist);
        
    case 'SRRED'
        
        Q = calcStrredScore_opt(imorg,imdist);
        
    case 'ALL'
        
        SSIM = ssim(imorg,imdist);
        PSNR = psnr(imorg,imdist);
        VIF = real(abs(vifvec(imorg,imdist)));
        ICID = iCID(imorg,imdist);
        SPEED = calcSpEEDScore(imorg,imdist);
        SMAD = calcSMADScore(imorg,imdist);
        SRRED =  calcStrredScore_opt(imorg,imdist);
        Q = table(SSIM, PSNR, VIF, ICID, SPEED, SMAD, SRRED);
    
        
        
        
end

end

