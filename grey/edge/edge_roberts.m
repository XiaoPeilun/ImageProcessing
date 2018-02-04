function edge_im = edge_roberts(im)
% zero padding

[m,n] = size(im); 
im = [im;zeros(1,n)]; 
im = [im zeros(m+1,1)];

for i = 1:m
    for j = 1:n
        edge_im(i,j) = uint8(abs(im(i,j) - im(i+1,j+1)) + abs(im(i,j+1) - im(i+1,j)));                         
    end
end

end