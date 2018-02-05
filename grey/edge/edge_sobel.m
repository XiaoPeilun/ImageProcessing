function edge_im = edge_sobel(im)
% zero padding

[m,n] = size(im); 
im = [zeros(1,n);im;zeros(1,n)]; 
im = [zeros(m+2,1) im zeros(m+2,1)];

gx = [-1, -2, -1; 0, 0, 0; 1, 2, 1];
gy = gx';

for i = 2 : m+1
    for j = 2 : n+1

        sub = double(im(i-1 : i+1, j-1 : j+1));
        g1 = abs(sum(sum(sub .* gx)));
        g2 = abs(sum(sum(sub .* gy)));
        
        edge_im(i, j) = uint8(g1+g2);
    end
end
edge_im(1,:) = [];
edge_im(:,1) = [];

end