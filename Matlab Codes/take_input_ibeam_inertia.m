function [ b1,h1,b2,h2,b3,h3 ] = take_input_ibeam_inertia( addPrompt )
%TAKE_INPUT_IBEAM_INERTIA Takes input of the parameters required to find
%the inertia of ibeam
%   

prompt = 'Enter b1';
b1 = input(strcat(prompt,addPrompt));
b1 = ensure_input_number(b1,prompt,addPrompt);

prompt = 'Enter h1';
h1 = input(strcat(prompt,addPrompt));
h1 = ensure_input_number(h1,prompt,addPrompt);

prompt = 'Enter b2';
b2 = input(strcat(prompt,addPrompt));
b2 = ensure_input_number(b2,prompt,addPrompt);

prompt = 'Enter h2';
h2 = input(strcat(prompt,addPrompt));
h2 = ensure_input_number(h2,prompt,addPrompt);

prompt = 'Enter b3';
b3 = input(strcat(prompt,addPrompt));
b3 = ensure_input_number(b3,prompt,addPrompt);

prompt = 'Enter h3';
h3 = input(strcat(prompt,addPrompt));
h3 = ensure_input_number(h3,prompt,addPrompt);



end

