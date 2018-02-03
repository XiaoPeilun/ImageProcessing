function skew_im = skewing(im, theta)

[m,n] = size(im); 
a = theta*pi/180;

m_new = round(m);
n_new = round(n + m * tan(a));
skew_im = zeros(m_new, n_new, 'uint8'); 

if theta < 0
    for i=1:m
        for j=1:n
            new_i = round(i);
            new_j = round(j-i*tan(a));
            skew_im(new_i,new_j) = im(i,j);
        end
    end
elseif theta > 0
    for i=1:m
        for j=1:n
            new_i = round(i);
            new_j = round(j-i*tan(a)+m*tan(a));
            skew_im(new_i,new_j) = im(i,j);
        end
    end    
end
end