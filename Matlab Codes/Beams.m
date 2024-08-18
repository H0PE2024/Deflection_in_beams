function varargout = Beams(varargin)
% BEAMS MATLAB code for Beams.fig
%      BEAMS, by itself, creates a new BEAMS or raises the existing
%      singleton*.
%
%      H = BEAMS returns the handle to a new BEAMS or the handle to
%      the existing singleton*.
%
%      BEAMS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BEAMS.M with the given input arguments.
%
%      BEAMS('Property','Value',...) creates a new BEAMS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Beams_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Beams_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Beams

% Last Modified by GUIDE v2.5 09-Nov-2017 15:02:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Beams_OpeningFcn, ...
                   'gui_OutputFcn',  @Beams_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Beams is made visible.
function Beams_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Beams (see VARARGIN)

% Choose default command line output for Beams
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

set(handles.uitable1,'Data',cell(7,2));
set(handles.uitable3,'Data',cell(7,3));
set(handles.uitable4,'Data',cell(7,2));
set(handles.uitable5,'Data',cell(7,2));

% UIWAIT makes Beams wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Beams_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in xyz.
function xyz_Callback(hObject, eventdata, handles)
cont=cellstr(get(hObject,'String'));
shape=cont(get(hObject,'Value'));
shapeval = 0;
if(strcmp(shape,'square'))
    shapeval=1;
elseif(strcmp(shape,'circle'))
    shapeval=2;
elseif (strcmp(shape,'rectangle'))
    shapeval=3;
end
assignin('base','shape',shapeval) ;
handles.shapeval = shapeval;
guidata(hObject,handles);

% hObject    handle to xyz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns xyz contents as cell array
%        contents{get(hObject,'Value')} returns selected item from xyz



% --- Executes during object creation, after setting all properties.
function xyz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xyz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function p1_Callback(hObject, eventdata, handles)
% hObject    handle to p1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p1 as text
%        str2double(get(hObject,'String')) returns contents of p1 as a double


% --- Executes during object creation, after setting all properties.
function p1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function p2_Callback(hObject, eventdata, handles)
% hObject    handle to p2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p2 as text
%        str2double(get(hObject,'String')) returns contents of p2 as a double


% --- Executes during object creation, after setting all properties.
function p2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function l_Callback(hObject, eventdata, handles)
% hObject    handle to l (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of l as text
%        str2double(get(hObject,'String')) returns contents of l as a double


% --- Executes during object creation, after setting all properties.
function l_CreateFcn(hObject, eventdata, handles)
% hObject    handle to l (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function e_Callback(hObject, eventdata, handles)
% hObject    handle to e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e as text
%        str2double(get(hObject,'String')) returns contents of e as a double


% --- Executes during object creation, after setting all properties.
function e_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    
    P1=str2double(get(handles.p1,'string')); %principle value 1
    P2=str2double(get(handles.p2,'string')); %principle value 2
    l=str2double(get(handles.l,'string')); %length of beam
    e = l/250;
    E=str2double(get(handles.e,'string')); %modulus of elasticity
    
    %%% Calculating inertia
    I = 0;
    shapeval = 1;
    if shapeval == 1
        I = find_rect_inertia(P1,P1);
    elseif shapeval == 2
        I = find_rect_inertia(P1,P2);
    elseif shapeval == 3
        I = find_circle_inertia(P1);
    end
    Supports_data=get(handles.uitable1,'Data')
    xs=Supports_data(:,2) %support x coordinated
    S_type=Supports_data(:,1) %supports pin roller or fixed ends
    
    xs(cellfun('isempty',xs)) = [];
    xs=str2double(xs)
        
    S_type(cellfun('isempty',S_type)) = []
    
    UDl_data=get(handles.uitable3,'Data');
    w=UDl_data(:,1); %udl value
    xsw=UDl_data(:,2); %starting point of udl
    xew=UDl_data(:,3); %ending point of udl
    
    w(cellfun('isempty',w)) = [];
    w=str2double(w)
    
    xsw(cellfun('isempty',xsw)) = [];
    xsw=str2double(xsw)
    
    
    xew(cellfun('isempty',xew)) = [];
    xew=str2double(xew)
    
    PF_data=get(handles.uitable4,'Data');
    
    pf=PF_data(:,1); %point force values
    pf(cellfun('isempty',pf)) = [];
    pf=str2double(pf)
    
    xpf=PF_data(:,2); %x coordinates of point forces
    xpf(cellfun('isempty',xpf)) = [];
    xpf=str2double(xpf)
    
    PM_data=get(handles.uitable5,'Data');
    
    m=PM_data(:,1); %values of point moments
    m(cellfun('isempty',m)) = [];
    m=str2double(m)
    
    xm=PM_data(:,2); %x coordinates of moments
    xm(cellfun('isempty',xm)) = [];
    xm=str2double(xm)
    
    ns = length(xs)
    nw = length(w)
    np = length(pf)
    nm = length(m)
    wnet = [];
    xwnet = [];
    
    %Converting to row vector
    disp('vectors to be passed on');
    xsw = xsw'
    xew = xew'
    xs = xs'
    xm = xm'
    xpf = xpf'
    
    pf = pf';
    m = m';
    w = w';
    
    V_func = [];
    M_func = [];
    def_func = [];
    slope_func = [];
    xchanges_def = [];
    xchanges_V = [];
    xchanges_M = [];
    xchanges_slope = [];
%     %%%%%%%%%%%%%%%% TODO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     
    %if allpins
    if (strcmp(S_type(1),'P') || strcmp(S_type(1),'p')) && (strcmp(S_type(length(S_type)),'P') || strcmp(S_type(length(S_type)),'p'))
        syms a;
        syms b;
        %%%%%%%%%%%%%% CALCULATING SUPPORT FORCES %%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%% CALCULATING NET DISTRIBUTED FORCES AND NET POINT OF APPLICATION %%%%%%%%%%%%%
            for i=1:nw
                wnet = [wnet nForce_dL(w(i),xsw(i),xew(i))]; %appends the new w to the array
                xwnet = [xwnet nPoint_dL(w(i),xsw(i),xew(i))]; %appends the new  x-ccordinate to the array
            end
        disp('After loop')
        wnet
        xwnet

        %%%%%%%%%%% FOR PIN JOINT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        m_net_applied = sum(m); %calculating net sum of the external moments applied
        [sf] = sf_all_pins(ns,np,nw,xs,xpf,xwnet,pf,w,wnet,m_net_applied); %calculates support forces
        disp('Place 1')
        sf
        %%%%%%%%%%%%%% FINDING SHEAR FORCE EXPRESSIONS %%%%%%%%%%%%%%%%%%%%%%%
        [V_func, xchanges_V] = find_shear_func( l,ns,np,nw,xs,xpf,xsw,xew,sf,pf,w ); %finds the expressions and the values of x where shear force changes

        %%%%%%%%%%%%%% FINDING BENDING MOMENT EXPRESSIONS %%%%%%%%%%%%%%%%%%%%
        [ M_func, xchanges_M ] = find_moment_func( l,nm,xm,m,V_func,xchanges_V ); %finds the expressions and the values of x where bending moment changes
        
        %%%%%%%%%%%%%% FINDING SlOPE AND DEFlECTION EXPRESSIONS %%%%%%%%%%%%%%%%%%
        [ xchanges_def, def_func,xchanges_slope, slope_func ] = find_deflection_func( ns,xs,M_func,xchanges_M, E, I ); %finds the expressions and the values of x where function of deflection changes
        
        %end of all pins
    % if both fixed
    elseif (strcmp(S_type(1),'C') || strcmp(S_type(1),'c')) && (strcmp(S_type(length(S_type)),'C') || strcmp(S_type(length(S_type)),'c'))
                    syms a;
                    syms b;
                            %%%%%%%%%%%%%% CALCULATING NET DISTRIBUTED FORCES AND NET POINT OF APPLICATION %%%%%%%%%%%%%
                    for i=1:nw
                        wnet = [wnet nForce_dL(w(i),xsw(i),xew(i))]; %appends the new w to the array
                        xwnet = [xwnet nPoint_dL(w(i),xsw(i),xew(i))]; %appends the new  x-ccordinate to the array
                    end


                    %%%%%%%%%%%%%% CALCULATING SUPPORT FORCES %%%%%%%%%%%%%%%%%%%%%%%%%%%%

                    %%%%%%%%%%% FOR fixed JOINT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    m_net_applied = sum(m)-a+b; %calculating net sum of the external moments applied
                    m = [-a m b];
                    xm = [0 xm l];
                    nm = nm+2;
                    [sf] = sf_fixed(ns,np,nw,xs,xpf,xwnet,pf,w,wnet,m_net_applied); %calculates support forces

                    %%%%%%%%%%%%%% FINDING SHEAR FORCE EXPRESSIONS %%%%%%%%%%%%%%%%%%%%%%%
                    [V_func, xchanges_V] = find_shear_func( l,ns,np,nw,xs,xpf,xsw,xew,sf,pf,w ) %finds the expressions and the values of x where shear force changes

                    %%%%%%%%%%%%%% FINDING BENDING MOMENT EXPRESSIONS %%%%%%%%%%%%%%%%%%%%
                    [ M_func, xchanges_M ] = find_moment_func( l,nm,xm,m,V_func,xchanges_V ) %finds the expressions and the values of x where bending moment changes

                    %%%%%%%%%%%%%% FINDING SLOPE AND DEFLECTION EXPRESSIONS %%%%%%%%%%%%%%%%%%
                    [ xchanges_def, def_func,xchanges_slope, slope_func ] = find_deflection_func( ns,xs,M_func,xchanges_M, E, I ) %finds the expressions and the values of x where function of deflection changes

                    %%%%%%%%%%%%%%%%%%%%%%%%% DONE IN TERMS OF VARIABLES a and b %%%%%%%%%%%%%

                    %%%%%%%%%%%%%%%%%%%%%%%%%% INVOLVING VARIABLES %%%%%%%%%%%%%%%%%%%%%%

                    %Finding variables
                    [a, b] = find_fixedends_moments( slope_func, xchanges_slope, def_func, xchanges_def )

                    %substitute variables in arrays of expressions
                    sf = find_expressions_from_symbols(a, b, sf);
                    m = find_expressions_from_symbols(a, b, m);
                    V_func = find_expressions_from_symbols(a, b, V_func);
                    M_func = find_expressions_from_symbols(a, b, M_func);
                    slope_func = find_expressions_from_symbols(a, b, slope_func);
                    def_func = find_expressions_from_symbols(a, b, def_func);
                            %end of both fixed joints end
    %if fixed-pin    
    elseif (strcmp(S_type(1),'C') || strcmp(S_type(1),'c')) && (strcmp(S_type(length(S_type)),'P') || strcmp(S_type(length(S_type)),'p'))  
                       syms a;
                       syms b;
                            %%%%%%%%%%%%%% CALCULATING NET DISTRIBUTED FORCES AND NET POINT OF APPLICATION %%%%%%%%%%%%%
                    for i=1:nw
                        wnet = [wnet nForce_dL(w(i),xsw(i),xew(i))]; %appends the new w to the array
                        xwnet = [xwnet nPoint_dL(w(i),xsw(i),xew(i))]; %appends the new  x-ccordinate to the array
                    end


                    %%%%%%%%%%%%%% CALCULATING SUPPORT FORCES %%%%%%%%%%%%%%%%%%%%%%%%%%%%

                    %%%%%%%%%%% FOR fixed JOINT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    m_net_applied = sum(m)-a; %calculating net sum of the external moments applied
                    m = [-a m];
                    xm = [0 xm];
                    nm = nm+1;
                    [sf] = sf_fixed(ns,np,nw,xs,xpf,xwnet,pf,w,wnet,m_net_applied); %calculates support forces

                    %%%%%%%%%%%%%% FINDING SHEAR FORCE EXPRESSIONS %%%%%%%%%%%%%%%%%%%%%%%
                    [V_func, xchanges_V] = find_shear_func( l,ns,np,nw,xs,xpf,xsw,xew,sf,pf,w ); %finds the expressions and the values of x where shear force changes

                    %%%%%%%%%%%%%% FINDING BENDING MOMENT EXPRESSIONS %%%%%%%%%%%%%%%%%%%%
                    [ M_func, xchanges_M ] = find_moment_func( l,nm,xm,m,V_func,xchanges_V ); %finds the expressions and the values of x where bending moment changes

                    %%%%%%%%%%%%%% FINDING SLOPE AND DEFLECTION EXPRESSIONS %%%%%%%%%%%%%%%%%%
                    [ xchanges_def, def_func,xchanges_slope, slope_func ] = find_deflection_func( ns,xs,M_func,xchanges_M, E, I ); %finds the expressions and the values of x where function of deflection changes

                    %%%%%%%%%%%%%%%%%%%%%%%%% DONE IN TERMS OF VARIABLES a and b %%%%%%%%%%%%%

                    %%%%%%%%%%%%%%%%%%%%%%%%%% INVOLVING VARIABLES %%%%%%%%%%%%%%%%%%%%%%

                    %Finding variables
                    [a] = find_fixed_pin_moments( slope_func, xchanges_slope, def_func, xchanges_def );
                    b = 0;
                    %substitute variables in arrays of expressions
                    sf = find_expressions_from_symbols(a, b, sf);
                    m = find_expressions_from_symbols(a, b, m);
                    V_func = find_expressions_from_symbols(a, b, V_func);
                    M_func = find_expressions_from_symbols(a, b, M_func);
                    slope_func = find_expressions_from_symbols(a, b, slope_func);
                    def_func = find_expressions_from_symbols(a, b, def_func);

    end
    
                    %Making arrays for making plots
%                     syms t;
%                     x = [];
%                     def = []; %array in which deflection is stored
%                     n = length(xchanges_def);
% 
%                     for i=1:n
%                         if i < n
%                             x1 = [xchanges_def(i):e:xchanges_def(i+1)];
%                         else
%                             x1 = [xchanges_def(i)];
%                         end
%                         x = [x x1];
%                         n2 = length(x1);
%                         for j=1:n2
%                             syms t;
%                             t = x1(j);
%                             def = [def subs(def_func(i))];
%                         end
%                     end
%                     
%                     def = unique(def);
                syms t;
                x = [0:e:l];
                x
                def = [];
                ichanges = 1;
                def_func
                for i=1:length(x)
                    syms t;
                    if ichanges < length(xchanges_def)

                        if xchanges_def(ichanges) <= x(i)  && x(i) < xchanges_def(ichanges + 1)
                            func = def_func(ichanges);
                            t = x(i);
                            val = subs(func);
                            def= [def val];
                        else
                            ichanges = ichanges + 1;
                            if ichanges <= length(xchanges_def)
                                syms t;
                                func = def_func(ichanges);
                                t = x(i);
                                val = subs(func);
                                def = [def val];

                            end
                        end
                    end
                    %clc
                end

    
            %undeformed
            n = length(S_type);
            S_x = []; %pinned xcoordinates
            C_x = []; %clamped xcoordinates
            for i=1:n
                if strcmp(S_type(i),'p') || strcmp(S_type(i),'P')
                    S_x = [S_x xs(i)];
                elseif strcmp(S_type(i),'c') || strcmp(S_type(i),'C')
                    C_x = [C_x xs(i)];
                end
            end
S_x=S_x/l% define normalized support pinned
C_x=C_x/l;% x cordinates for clamped loads
 figure('name','initial beam','units','normalized','outerposition',[0 0 1 1]);
% % 
 h=rectangle('Position',[0 0.2 1 0.1])
 h.FaceColor=[0 0 0];
 hold
 plot(1,5,'^');
 plot(1,-5,'^');
 plot(S_x,0.05*ones(1,length(S_x)),'^','MarkerSize',12,'MarkerEdgeColor',[0 0 0]);
 if strcmp(S_type(1),'c') || strcmp(S_type(1),'C')
     Sh=rectangle('Position',[C_x(1) 0 0.02 0.5]);
 end
 if strcmp(S_type(length(S_type)),'c') || strcmp(S_type(length(S_type)),'C')
     Sh=rectangle('Position',[C_x(length(C_x)) 0 0.02 0.5]);
 end
% % 
% 
% % %write for clamped
 hold
% done=6
%deformed
figure('name','final shape','units','normalized','outerposition',[0 0 1 1])
x=[0:0.004:1];
def
%v = def(2:length(def)-1);
v = def;

vmax = max(abs(v));
vmax
max(v)
min(v)
v = v/vmax+0.2;
plot(1,5,'^');
%v=def;%enter deflection function instead

plot(x,v,'-s','MarkerSize',4,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor',[0 0 0]);
hold
plot(1,5,'^');
plot(1,-5,'^');
plot(S_x,0.05*ones(1,length(S_x)),'^','MarkerSize',12,'MarkerEdgeColor',[0 0 0]);
double=7
if strcmp(S_type(1),'c') || strcmp(S_type(1),'C')
    Sh=rectangle('Position',[C_x(1) 0 0.02 0.5]);
end
if strcmp(S_type(length(S_type)),'c') || strcmp(S_type(length(S_type)),'C')
    Sh=rectangle('Position',[C_x(length(C_x)) 0 0.02 0.5]);
end
done=5
% 
% hold
% figure('name','Bending moment','units','normalized','outerposition',[0 0 1 1])
% plot(x,BM);
% figure('name','shear force','units','normalized','outerposition',[0 0 1 1]);
% plot(x,SF);


% --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to u

%itable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
   


% --- Executes when selected cell(s) is changed in uitable1.
function uitable1_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
     %data=get(hObject,'data');
     %v=data;
     %retreivedata(2,1)
     
     
     


% --- Executes when entered data in editable cell(s) in uitable3.
function uitable3_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable3 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when entered data in editable cell(s) in uitable4.
function uitable4_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable4 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when entered data in editable cell(s) in uitable5.
function uitable5_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable5 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
Beams.m
Open with
