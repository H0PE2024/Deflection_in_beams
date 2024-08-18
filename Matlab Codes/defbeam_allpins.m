syms t; %Need symbolic toolbox for function to work

addPrompt = ' :  '; %For changing characters added in front of prompts for taking input
e = 0.05; %For changing the least value of x while plotting graphs
E = 0; %stores the modulus of elasticity of the beam
I = 0; %stores the calculated value of inertia

l = 0; %length of beam

ns = 0; %number of supports
np = 0; %number of point forces supplied externally
nw = 0; %number of different magnitudes of distributed loads
nm = 0; %number of moments supplied externally

m_net_applied = 0; %stores net sum of the external moments applied

xs = []; %stores x coordinates of supports with respect to origin
xs_new = []; %stores new coordinates after including the boundary condition
xpf = []; %stores x coordinate of point forces externally applied with respect to origin
xm = []; %stores x coordinates of moments applied

xsw = []; %stores start coordinates of each different distributed load range
xew = []; %stores end coordinates of each different distributed load range

xwnet = []; %stores the net x coordinate at which the force can be considered to act

X_pf = []; %difference of every point from every other consecutive point, for point forces
X_w = []; %difference of every point from every other consecutive point, for distributes forces
X_s = []; %difference of every point from every other consecutive point, for distributes forces


pf = []; %stores magnitudes of point forces acting
m = []; %stores magnitudes of moments applied externally
w = []; %stores magnitudes of distributed loads 
wnet = []; %stores values of effective loads acting because of the distributed loads

sf = []; %stores the forces acting at the supports after being calculated

V_func = []; %stores the expression form of shear force (variable used is t)
M_func = []; %stores the expression form of bending moment (variable used is t)
slope_func = []; %stores the expression form of slope of deflection (variable used is t)
def_func = []; %stores the expression form of slope of deflection (variable used is t)

xchanges_V = []; %coordinates where shear function changes its definition x(i)<= x < x(i+1)
xchanges_M = []; %coordinates where bending moment function changes its definition
xchanges_slope = []; %coordinates where slope of deflection function changes its definition
xchanges_def = []; %coordinates where deflection function changes its definition

ch = 0; %for taking choice of the input

disp('Hello, welcome to DefBeam input');
disp('Please enter the parameters as asked in SI units for a SYMMETRICAL beam');

%Taking input modulus of elasticity of the beam
prompt = 'Enter modulus of elasticity of beam';
E = input(strcat(prompt,addPrompt));
E = ensure_input_number(E,prompt, addPrompt);

%Taking input inertia of the beam
prompt = 'Enter I of beam';
I = input(strcat(prompt,addPrompt));
I = ensure_input_number(I,prompt, addPrompt);

% Taking input length of beam
prompt = 'Length of beam';
l = input(strcat(prompt,addPrompt));
l = ensure_input_number(l,prompt, addPrompt);


%Taking input: number of supports
%These supports will be pin joints (different from end points)
disp('All supports are pin joints');
prompt = 'Number of supports';
ns = input(strcat(prompt,addPrompt));
ns = ensure_input_number(ns,prompt,addPrompt);


%Taking input: x coordinate of joints
disp('Specifying coordinates of points, that is, pin joints');
disp('Origin is the beginning of the beam');

for i=1:ns
    prompt = 'Enter coordinate of support ';
    prompt = strcat(prompt,num2str(i)); %To add support number to the prompt
    x = input( strcat(prompt,addPrompt) );
    x = ensure_input_number(x,prompt,addPrompt);
    
    xs = [xs, x];  %Appending number to the array 
    
end

%%%%%%%%%%%%% POINT FORCES %%%%%%%%%%%%%%%%%%%%%%%
disp('Time to enter point Forces!');
%Taking input: number of point forces
%These forces are applied externally
disp('Point forces are applied externally, upward direction being positive');
prompt = 'Number of point forces';
np = input(strcat(prompt,addPrompt));
np = ensure_input_number(np,prompt,addPrompt);

[xpf, pf] = take_input_pL(np,addPrompt); 

%%%%%%%%%%%%%%%  DISTRIBUTED LOAD  %%%%%%%%%%%%%%%%%%%%%%%
disp('Describe the distributed loads!');
%Taking input: number of different distributed loads
disp('Distributed loads, upward direction being positive');
prompt = 'Number of distributed loads';
nw = input(strcat(prompt,addPrompt));
nw = ensure_input_number(nw,prompt,addPrompt);

[xsw, xew, w] = take_input_dL(nw,addPrompt);

%%%%%%%%%%%%%   MOMENTS   %%%%%%%%%%%%%%%%%%%%%%
disp('Time to enter Moments supplied!');
%Taking input: number of moments supplied
%These moments are applied externally
disp('Moments are applied externally');
prompt = 'Number of moments supplied';
nm = input(strcat(prompt,addPrompt));
nm = ensure_input_number(nm,prompt,addPrompt);

[ xm, m ] = take_input_moments(nm,addPrompt);


%%%%%%%%%%%%%% CALCULATING NET DISTRIBUTED FORCES AND NET POINT OF APPLICATION %%%%%%%%%%%%%
for i=1:nw
    wnet = [wnet nForce_dL(w(i),xsw(i),xew(i))]; %appends the new w to the array
    xwnet = [xwnet nPoint_dL(w(i),xsw(i),xew(i))]; %appends the new  x-ccordinate to the array
end


%%%%%%%%%%%%%% CALCULATING SUPPORT FORCES %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Everything is in terms of variables a,b
%%%%%%%%%%% FOR PIN JOINT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m_net_applied = sum(m); %calculating net sum of the external moments applied
[sf] = sf_all_pins(ns,np,nw,xs,xpf,xwnet,pf,w,wnet,m_net_applied); %calculates support forces

%%%%%%%%%%%%%% FINDING SHEAR FORCE EXPRESSIONS %%%%%%%%%%%%%%%%%%%%%%%
[V_func, xchanges_V] = find_shear_func( l,ns,np,nw,xs,xpf,xsw,xew,sf,pf,w ); %finds the expressions and the values of x where shear force changes

%%%%%%%%%%%%%% FINDING BENDING MOMENT EXPRESSIONS %%%%%%%%%%%%%%%%%%%%
[ M_func, xchanges_M ] = find_moment_func( l,nm,xm,m,V_func,xchanges_V ); %finds the expressions and the values of x where bending moment changes

%%%%%%%%%%%%%% FINDING SLOPE AND DEFLECTION EXPRESSIONS %%%%%%%%%%%%%%%%%%
[ xchanges_def, def_func,xchanges_slope, slope_func ] = find_deflection_func( ns,xs,M_func,xchanges_M, E, I ); %finds the expressions and the values of x where function of deflection changes
    
%%%%%%%%%%%%%% PLOTTING GRAPHS %%%%%%%%%%%%%%%%
sfd_from_func( l,e,V_func,xchanges_V );
figure;
bmd_from_func( l,e,M_func,xchanges_M );
figure;
slope_d_from_func( l,e,slope_func,xchanges_slope );
figure;
def_d_from_func( l,e,def_func,xchanges_def );
