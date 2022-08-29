% function for framing 

function Frame_No=framing(y, window_length, num_frames)
 
Frame_No = zeros(window_length, num_frames);%The frame number


for i = 1:num_frames
    a = y( ((i-1)*window_length)+1 : i*window_length );
    Frame_No(:, i)= a;    
end

end