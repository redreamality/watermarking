function varargout = watermarking_gui(varargin)
% WATERMARKING_GUI MATLAB code for watermarking_gui.fig
%      WATERMARKING_GUI, by itself, creates a new WATERMARKING_GUI or raises the existing
%      singleton*.
%
%      H = WATERMARKING_GUI returns the handle to a new WATERMARKING_GUI or the handle to
%      the existing singleton*.
%
%      WATERMARKING_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WATERMARKING_GUI.M with the given input arguments.
%
%      WATERMARKING_GUI('Property','Value',...) creates a new WATERMARKING_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before watermarking_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to watermarking_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help watermarking_gui

% Last Modified by GUIDE v2.5 01-Jan-2009 16:46:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @watermarking_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @watermarking_gui_OutputFcn, ...
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


% --- Executes just before watermarking_gui is made visible.
function watermarking_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to watermarking_gui (see VARARGIN)

% Choose default command line output for watermarking_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes watermarking_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = watermarking_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in embed.
function embed_Callback(hObject, eventdata, handles)
global source_image;
watermark_txt = get(handles.watermark,'string');
set(handles.status,'string','embedding');
output_image = embed_watermark(source_image,watermark_txt);
axes(handles.axes2);
imshow(output_image);
set(handles.status,'string','embed success');




% hObject    handle to embed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in choose_image.
function choose_image_Callback(hObject, eventdata, handles)
global source_image;
[filename, pathname] = uigetfile({'*.jpg';'*.bmp'},'choose image');
if isequal(filename,0)
    set(handles.status,'string','User cancelled,select again');
else
    fullpath = [pathname,filename];
    source_image = imread(fullpath);
    axes(handles.axes1);
    imshow(source_image);
    set(handles.status,'string','enter the text you want to embed, press embed when finished');
end
    


% hObject    handle to choose_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function watermark_Callback(hObject, eventdata, handles)

% hObject    handle to watermark (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of watermark as text
%        str2double(get(hObject,'String')) returns contents of watermark as a double


% --- Executes during object creation, after setting all properties.
function watermark_CreateFcn(hObject, eventdata, handles)
% hObject    handle to watermark (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in save_and_quit.
function save_and_quit_Callback(hObject, eventdata, handles)
% hObject    handle to save_and_quit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on watermark and none of its controls.
function watermark_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to watermark (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
