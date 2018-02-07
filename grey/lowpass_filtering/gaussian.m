function conv_im = gaussian(im,sigma)
% separale filters 

fsize = double(uint8(3*sigma)*2+1);
step = round(fsize/2);
for i = 1:fsize
    x = i-step;
    filter(1,x+step) = exp(-x*x*(1.0/(2*sigma*sigma))) / (sigma*sqrt(2*pi));
end
filter = filter/sum(filter);

ret = imfilter(im,filter,'replicate');  
conv_im = imfilter(ret,filter','replicate'); 

end
