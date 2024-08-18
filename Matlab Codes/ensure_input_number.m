function [ n ] = ensure_input_number( p, prompt, addPrompt )
%CHECK_INPUT_NUMBER This function ensures that the value of the parameter
%passed becomes a number. If input parameter is not a number, the function keeps prompting till a number is entered. Returns a number.
while (isa(p,'string') || isa(p,'char'))
    disp('Wrong input. Please enter a number.');
    p = input(strcat(prompt,addPrompt));
end

n = p;


end

