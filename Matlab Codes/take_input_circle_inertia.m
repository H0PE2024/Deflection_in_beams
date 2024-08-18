function [ r ] = take_input_circle_inertia( addPrompt )
%TAKE_INPUT_CIRCLE_INERTIA Takes inputs required to find inertia of a
%circular cross-section
%   
prompt = 'Enter radius';
r = input(strcat(prompt,addPrompt));
r = ensure_input_number(r,prompt,addPrompt);


end

