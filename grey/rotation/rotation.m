function  rot_im = rotation(im, theta)

[m,n] = size(im); 

switch mod(theta, 360)
    case 0
        rot_im = im;
    case 90
        rot_im = rot90(im(end:-1:1, end:-1:1));
    case 180
        rot_im = im(end:-1:1, end:-1:1);
    case 270
        rot_im = rot90(im);
    otherwise
        theta = theta/180*pi;
        rot = [cos(theta),-sin(theta),0;sin(theta),cos(theta),0;0,0,1]; 
        left_up    = [1 1 1] * rot;
        right_up   = [1 n 1] * rot;
        left_down  = [m 1 1] * rot;
        right_down = [m n 1] * rot;

        height  = round(max([abs(left_up(1)-right_down(1))+0.5 abs(right_up(1)-left_down(1))+0.5])); 
        width   = round(max([abs(left_up(2)-right_down(2))+0.5 abs(right_up(2)-left_down(2))+0.5]));
        rot_im  = zeros(height,width);

        delta_y = abs(min([left_up(1) right_up(1) left_down(1) right_down(1)]));
        delta_x = abs(min([left_up(2) right_up(2) left_down(2) right_down(2)]));

        for i = 1-delta_y:height-delta_y
            for j = 1-delta_x:width-delta_x
                pix = [i j 1]/rot;                
                                                               
                float_Y = pix(1) - floor(pix(1)); 
                float_X = pix(2) - floor(pix(2));    

                if pix(1)>=1 && pix(2)>=1 && pix(1) <= m && pix(2) <= n
                    pix_up_left    = [floor(pix(1)) floor(pix(2))]; 
                    pix_up_right   = [floor(pix(1)) ceil(pix(2))];
                    pix_down_left  = [ceil(pix(1)) floor(pix(2))];
                    pix_down_right = [ceil(pix(1)) ceil(pix(2))]; 

                    value_up_left    = (1-float_X) * (1-float_Y);        
                    value_up_right   = float_X * (1-float_Y);
                    value_down_left  = (1-float_X) * float_Y;
                    value_down_right = float_X * float_Y;

                    rot_im(i+delta_y,j+delta_x) = value_up_left    * im(pix_up_left(1),pix_up_left(2))+ ...
                                                  value_up_right   * im(pix_up_right(1),pix_up_right(2))+ ...
                                                  value_down_left  * im(pix_down_left(1),pix_down_left(2))+ ...
                                                  value_down_right * im(pix_down_right(1),pix_down_right(2));
                end
            end
        end
        rot_im = uint8(rot_im);
end
end