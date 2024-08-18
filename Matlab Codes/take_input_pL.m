function [ xpf, pf ] = take_input_pL( np, addPrompt )
%TAKE_INPUT_POINTLOADS Takes input of point loads with coordinates and
%magnitudes depending on the number of loads given as input

%Taking input: x coordinate of point forces applied
disp('Specifying coordinates of point forces applied externally');
disp('Origin is the beginning of the beam, as mentioned before.');

xpf = []; %stores x coordinate of point forces externally applied with respect to origin
pf = []; %stores magnitudes of point forces acting

for i=1:np
    
    prompt = 'Enter coordinate of point force ';
    prompt = strcat(prompt,num2str(i)); %To add force number to the prompt
    x = input( strcat(prompt,addPrompt) );
    x = ensure_input_number(x,prompt,addPrompt);
    
    xpf = [xpf, x];  %Appending number to the array
    
    prompt = 'Enter force ';
    prompt = strcat(prompt,num2str(i)); %To add force number to the prompt
    x = input( strcat(prompt,addPrompt) );
    x = ensure_input_number(x,prompt,addPrompt);
    
    pf = [pf, x];  %Appending number to the array
    
end


end

