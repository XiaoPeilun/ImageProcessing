function conv_im = edge_log(im,sigma)

fsize = double(uint8(3*sigma)*2+1);
mid = (fsize+1)/2;

for i=1:fsize
    for j=1:fsize
        hg(i,j) = exp(-((mid-i)^2+(mid-j)^2) / (2*sigma^2));
    end
end

hg_sum = sum(sum(hg));

for i=1:fsize
    for j=1:fsize
        h(i,j)=((((mid-i)^2+(mid-j)^2)-(2*sigma^2)) * hg(i,j)) / (2*pi * (sigma^6) * hg_sum);
    end
end

hn = h - sum(sum(h)) / (fsize^2); % make the sum of matrix to 0
conv_im = imfilter(im,hn); 

end


