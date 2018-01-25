function up_im = upsample_nearest(im, v_factor, h_factor)

[m,n] = size(im);

for i=1:v_factor*m
    for j=1:h_factor*n
        x = round(i/v_factor);
        y = round(j/h_factor);
        if x==0 x=1;end
        if y==0 y=1;end
        if x>m  x=m;end
        if y>n  y=n;end
        up_im(i,j) = im(x,y);
    end
end 

end