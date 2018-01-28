function eq_image = equalization(im)

[m,n] = size(im);
hist  = histogram(im);
histn = hist/numel(im); % normalization

cumu = zeros(1,256);
for i = 1:256
    if i == 1  
        cumu(i) = histn(i);  
    else  
        cumu(i) = cumu(i - 1) + histn(i);  
    end  
end  
cumu = uint8(255 .* cumu + 0.5);  

for i = 1:m  
    for j = 1: n  
        eq_image(i,j) = cumu(im(i,j)+1);  
    end  
end

histogram(eq_image);
end