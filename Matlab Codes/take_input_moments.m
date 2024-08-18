function [ xm, m ] = take_input_moments( nm, addPrompt )
%TAKE_INPUT_MOMENTS Takes input of moments with coordinates and
%magnitudes depending on the number of moments given as input

%Taking input: x coordinate of point forces applied
disp('Specifying coordinates of moments applied externally');
disp('Origin is the beginning of the beam, as mentioned before.');

xm = []; %stores x coordinates of moments applied
m = []; %stores magnitudes of moments applied externally

for i=1:nm
    
    prompt = 'Enter coordinate of moment ';
    prompt = strcat(prompt,num2str(i)); %To add moment number to the prompt
    x = input( strcat(prompt,addPrompt) );
    x = ensure_input_number(x,prompt,addPrompt);
    
    xm = [xm, x];  %Appending number to the array
    
    prompt = 'Enter moment ';
    prompt = strcat(prompt,num2str(i)); %To add moment number to the prompt
    x = input( strcat(prompt,addPrompt) );
    x = ensure_input_number(x,prompt,addPrompt);
    
    m = [m, x];  %Appending number to the array
    
end


end

