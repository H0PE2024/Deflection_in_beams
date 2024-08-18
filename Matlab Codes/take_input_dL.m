function [ xsw, xew, w ] = take_input_dL( nw, addPrompt )
%TAKE_INPUT_DISTRIBUTEDLOADS Takes input of distributed loads with start and end coordinates and
%magnitudes of force/length depending on the number of loads given as input

xsw = []; %stores start coordinates of each different distributed load range
xew = []; %stores end coordinates of each different distributed load range
w = []; %stores magnitudes of distributed loads

%Taking input: x coordinate of point forces applied
disp('Specifying ranges of distributed loads');
disp('Origin is the beginning of the beam, as mentioned before.');

for i=1:nw
    
    prompt = 'Enter START coordinate of range of distributed load ';
    prompt = strcat(prompt,num2str(i)); %To add load number to the prompt
    x = input( strcat(prompt,addPrompt) );
    x = ensure_input_number(x,prompt,addPrompt);
    
    xsw = [xsw, x];  %Appending number to the array
    
    prompt = 'Enter END coordinate of range of distributed load ';
    prompt = strcat(prompt,num2str(i)); %To add load number to the prompt
    x = input( strcat(prompt,addPrompt) );
    x = ensure_input_number(x,prompt,addPrompt);
    
    xew = [xew, x];  %Appending number to the array
    
    prompt = 'Enter force per length of load ';
    prompt = strcat(prompt,num2str(i)); %To add load number to the prompt
    x = input( strcat(prompt,addPrompt) );
    x = ensure_input_number(x,prompt,addPrompt);
    
    w = [w, x];  %Appending number to the array
    
end


end

