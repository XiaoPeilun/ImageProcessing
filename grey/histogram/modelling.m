function new_im = modelling(im)

hist     = histogram(im);
ref_hist = zeros(1,256);

% exponential distribution
for i=1:256
      ref_hist(i)=floor(1.03^i);
end

cdf     = cumsum(hist) / numel(im);  
ref_cdf = cumsum(ref_hist) / sum(ref_hist);  

% Compute the mapping 
mapping = zeros(1,256);
for idx = 1 : 256
    [~,ind] = min(abs(cdf(idx) - ref_cdf));
    mapping(idx)  = ind-1;
end

% apply the mapping to get first image
new_im = uint8(mapping(double(im)+1));  

figure(1);
histogram(new_im);
figure(2);
imshow(new_im);

end