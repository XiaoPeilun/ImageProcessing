function im_sub = subsample(im,v_factor,h_factor)

[m,n] = size(im);

k = 1;
l = 1;

for i = 1:v_factor:m
    for j = 1:h_factor:n
        im_sub(k,l) = im(i,j);
        l = l+1;
    end
    l = 1;
    k = k+1;
end 

end