function values = histogram(im)

[m, n] = size(im);
values = zeros(1,256);

for i = 1:m
    for j = 1:n
        values(double(im(i,j))+1) = values(double(im(i,j))+1) + 1;
    end
end

bar(0:255,values);

end