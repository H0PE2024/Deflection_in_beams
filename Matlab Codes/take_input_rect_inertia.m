function [ b, d ] = take_input_rect_inertia( addPrompt )
%TAKE_INPUT_RECT_INERTIA Takes input for finding inertia of rectangle
% 
prompt = 'Enter b';
b = input( strcat(prompt,addPrompt) );
b = ensure_input_number(b,prompt,addPrompt);

prompt = 'Enter d';
d = input( strcat(prompt,addPrompt) );
d = ensure_input_number(d,prompt,addPrompt);


end

