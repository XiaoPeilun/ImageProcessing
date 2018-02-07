function im_conv = rect(im, size)

filter  = (1/(size^2)) * ones(size,size);
im_conv = imfilter(im,filter);

end