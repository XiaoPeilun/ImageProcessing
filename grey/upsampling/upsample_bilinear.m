function up_im = upsample_bilinear(im, v_factor, h_factor)

[m,n] = size(im);

im = [im;zeros(1,n)]; 
im = [im zeros(m+1,1)];

ini_mf = (m-1)/(m*v_factor-1);
ini_nf = (n-1)/(n*h_factor-1);

for j = 1:h_factor*n
    z_y = floor((j-1)*ini_nf+1);
      y = (j-1)*ini_nf+1 - z_y;
    for i = 1:v_factor*m
        z_x = floor((i-1)*ini_mf+1);
        x = (i-1)*ini_mf+1 - z_x;

        up_im(i,j) = (1 - x)*(1 - y) * im(z_x,     z_y    ) + ...
                     (1 - x)* y      * im(z_x,     z_y + 1) + ...
                      x     *(1 - y) * im(z_x + 1, z_y    ) + ...
                      x     * y      * im(z_x + 1, z_y + 1);
    end
end

end