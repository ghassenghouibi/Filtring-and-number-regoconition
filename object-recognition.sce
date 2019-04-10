/*
* Object recognition with scilab
*@author ghouibi ghassen
*@date April 2019
*/
//Figure
f=figure('figure_position',[100,0],...
'figure_size',[1050,650],...
'auto_resize','on',...
'background',[1],...
'figure_name','Object recognition',...
'dockable','off',...
'infobar_visible','off',...
'toolbar_visible','off',...
'menubar_visible','off',...
'default_axes','on',...
'visible','off');


handles.dummy = 0;

//Loading Image Button
handles.Load=uicontrol(f,...
'unit','normalized',...
'BackgroundColor',[-1,-1,-1],...
'Enable','on',...
'FontAngle','normal',...
'FontName','Tahoma',...
'FontSize',[15],...
'FontUnits','points',...
'FontWeight','normal',...
'ForegroundColor',[-1,-1,-1],...
'HorizontalAlignment','center',...
'ListboxTop',[],...
'Max',[1],...
'Min',[0],...
'Position',[0.76,0.68,0.20,0.07],...
'Relief','default',...
'SliderStep',[0.01,0.01],...
'String','Load Image',...
'Style','pushbutton',...
'Value',[0],...
'VerticalAlignment','middle',...
'Visible','on',...
'Tag','Load',...
'Callback','LoadIMG(handles)')

//CNN init Button
handles.InitCNN=uicontrol(f,...
'unit','normalized',...
'BackgroundColor',[-1,-1,-1],...
'Enable','on',...
'FontAngle','normal',...
'FontName','Tahoma',...
'FontSize',[15],...
'FontUnits','points',...
'FontWeight','normal',...
'ForegroundColor',[-1,-1,-1],...
'HorizontalAlignment','center',...
'ListboxTop',[],...
'Max',[1],...
'Min',[0],...
'Position',[0.76,0.58,0.20,0.07],...
'Relief','default',...
'SliderStep',[0.01,0.01],...
'String','CNN Init',...
'Style','pushbutton',...
'Value',[0],...
'VerticalAlignment','middle',...
'Visible','on',...
'Tag','CNN',...
'Callback','InitCNN(handles)')

//WebCam Button
handles.WebCam=uicontrol(f,...
'unit','normalized',...
'BackgroundColor',[-1,-1,-1],...
'Enable','on',...
'FontAngle','normal',...
'FontName','Tahoma',...
'FontSize',[15],...
'FontUnits','points',...
'FontWeight','normal',...
'ForegroundColor',[-1,-1,-1],...
'HorizontalAlignment','center',...
'ListboxTop',[],...
'Max',[1],...
'Min',[0],...
'Position',[0.76,0.48,0.20,0.07],...
'Relief','default',...
'SliderStep',[0.01,0.01],...
'String','WebCam Load',...
'Style','pushbutton',...
'Value',[0],...
'VerticalAlignment','middle',...
'Visible','on',...
'Tag','Webcam',...
'Callback','Webcam(handles)')

//Help Button
handles.Help=uicontrol(f,...
'unit','normalized',...
'BackgroundColor',[-1,-1,-1],...
'Enable','on',...
'FontAngle','normal',...
'FontName','Tahoma',...
'FontSize',[15],...
'FontUnits','points',...
'FontWeight','normal',...
'ForegroundColor',[-1,-1,-1],...
'HorizontalAlignment','center',...
'ListboxTop',[],...
'Max',[1],...
'Min',[0],...
'Position',[0.76,0.38,0.20,0.07],...
'Relief','default',...
'SliderStep',[0.01,0.01],...
'String','Help',...
'Style','pushbutton',...
'Value',[0],...
'VerticalAlignment','middle',...
'Visible','on',...
'Tag','Help',...
'Callback','Help(handles)')

//Clear Webcam Button
handles.clear=uicontrol(f,...
'unit','normalized',...
'BackgroundColor',[-1,-1,-1],...
'Enable','on',...
'FontAngle','normal',...
'FontName','Tahoma',...
'FontSize',[15],...
'FontUnits','points',...
'FontWeight','normal',...
'ForegroundColor',[-1,-1,-1],...
'HorizontalAlignment','center',...
'ListboxTop',[],...
'Max',[1],...
'Min',[0],...
'Position',[0.76,0.28,0.20,0.07],...
'Relief','default',...
'SliderStep',[0.01,0.01],...
'String','ClearWebcam',...
'Style','pushbutton',...
'Value',[0],...
'VerticalAlignment','middle',...
'Visible','on',...
'Tag','Clear',...
'Callback','ClearWebcam(handles)')


//Close Button
handles.close=uicontrol(f,...
'unit','normalized',...
'BackgroundColor',[-1,-1,-1],...
'Enable','on',...
'FontAngle','normal',...
'FontName','Tahoma',...
'FontSize',[15],...
'FontUnits','points',...
'FontWeight','normal',...
'ForegroundColor',[-1,-1,-1],...
'HorizontalAlignment','center',...
'ListboxTop',[],...
'Max',[1],...
'Min',[0],...
'Position',[0.76,0.18,0.20,0.07],...
'Relief','default',...
'SliderStep',[0.01,0.01],...
'String','Close',...
'Style','pushbutton',...
'Value',[0],...
'VerticalAlignment','middle',...
'Visible','on',...
'Tag','Close',...
'Callback','Close(handles)')

handles.Axes1= newaxes();
handles.Axes1.margins = [ 0 0 0 0];
handles.Axes1.axes_bounds = [0.0352564,0.0590909,0.7163462,0.8431818];
handles.Axes1.auto_clear = 'on';
f.visible = "on";

/*
* This function load a new image and display it
*/
function LoadIMG(handles)
    disp("LoadIMG"); 
    fn = uigetfile('*'); 
    disp(fn);
    S = imread(fn);
    imshow(S);
    handles.S = S;
    handles = resume(handles);
endfunction

/*
* This function quit the program
*/
function Close(handles)
    close(f)
endfunction

/*
* This function display how this program work
*/
function Help(handles) 
    x=figure('figure_position',[200,150],...
    'figure_size',[500,350],...
    'auto_resize','on',...
    'background',[1],...
    'figure_name','Help',...
    'dockable','off',...
    'infobar_visible','off',...
    'toolbar_visible','off',...
    'menubar_visible','off',...
    'default_axes','on',...
    'visible','off');
    x.visible='on';
endfunction

/*
*This function juste load an white image background
* //TODO
*/
function ClearWebcam(handles)
    S=imread('C:\Users\XYZ\Desktop\Object-recognition\reset.jpg');
    imshow(S);
    handles.S=S;
    handles=resume(handles);
endfunction

/*
*This function allow to user to manipule and use his webcam
*/
function Webcam(handles)
    n = camopen(0);
    im = camread(n); //get a frame
    imshow(im);
    avicloseall(n);
endfunction