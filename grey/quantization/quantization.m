function quan_im = quantization(im, factor)

level = log2(factor);
lower_bits = uint8(2 ^ (8 - level) - 1);
high_bits  = uint8(2 ^ 8 - double(lower_bits) - 1);
quan_im = uint8(bitand(im, high_bits));

end
