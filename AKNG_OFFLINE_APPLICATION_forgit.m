function SUJIT()

global flag_runname;
global flag_date
flag_runname=0; % initalize 0 as not loaded run name 
flag_date =0;
global raw_path;
function raw_file(hObject, eventdata, handles)
     [namefile,namepath] = uigetfile('*.txt','Select Raw File');
       

    if isequal(namefile, 0) || isequal(namepath, 0)
        set(RAW_FILE_TEXT,'FontWeight','bold','ForegroundColor','red','string','Raw File Not Selected'); 
         return;
    else
        set(RAW_FILE_TEXT,'FontWeight','bold','ForegroundColor',[0 0 1],'string','Raw File Selected');
        R = strcat(namepath, namefile);
        disp(R);  
        raw_path = namepath;
        
    end
end

function file_exe(hObject, eventdata, handles)
        exe_file = 'App.exe';
    if isequal(exe_file, 0)
        set(FILE_TEXT,'FontWeight','bold','ForegroundColor','red','string','.Exe File Not Execute'); 
         return;
    else
        set(FILE_TEXT,'FontWeight','bold','ForegroundColor',[0 0 1],'string','.Exe File Executed Successfully');
        disp(exe_file);
        copyfile(exe_file, raw_path);
        cd(raw_path);
        exe_r=strcat(exe_file,' &');
        system(exe_r);        
    end
end


function plot(hObject, eventdata, handles)
    
     if isequal(raw_path, 0)
         return;
     else
         disp(raw_path);
        Menu(raw_path, runname, date,flag_runname,flag_date);
     end
end     

function file_open(hObject, eventdata, handles)
    [pathname] = uigetdir('D:\','Select Path');
    
     if isequal(pathname, 0)
         set(FILE_TEXT0,'FontWeight','bold','ForegroundColor','red','string','Folder Path Not Selected' );
         return;
     else
         set(FILE_TEXT0,'FontWeight','bold','ForegroundColor',[0 0 1],'string','Folder Path Selected' );
         
         AKNG_Menu(pathname, runname, date,flag_runname,flag_date);
     end
end

input1 = '';
input2 = '';
global runname;
global date;
function enterInput1(~, ~)
        prompt = 'ENTER TESTING NAME';
        dlgtitle = '';
        dims = [1 50];
        definput = {input1};
        input1 = inputdlg(prompt, dlgtitle, dims, definput);
end

function enterInput2(~, ~)
        prompt = 'ENTER TESTING  DATE';
        dlgtitle = '';
        dims = [1 50];
        definput = {input2};
        input2 = inputdlg(prompt, dlgtitle, dims, definput);
end

function showValues(hObject, eventdata, handles)
        runname= input1;
        date = input2;
        
         disp(['Run Name=>',runname]);
         disp(['Run Date=>',date]);
end
%---------------------------------------------------------------%%-------------------------------------------------------------------------------%
BackgroundColor = [.1 .4 .6];
Bcolor = [.1 .7 .4];
Wcolor = [1 1 1];

%%
First_page = figure('Unit', 'normalized','Position',[.30, .50, .7, .42], 'Color',BackgroundColor,...
    'MenuBar','none','NumberTitle','on','name','Range System Division @Sujit_RSD','Resize','off','Pointer','hand','Visible','on');

PANEL1= uipanel('Parent',First_page,'Title','Extraction & Plotting','FontSize',10,'FontWeight','bold', 'ForegroundColor','w',...
    'Position',[.255 .50 .5 .358],'Backgroundcolor',BackgroundColor);
PANEL2= uipanel('Parent',First_page,'Title','Only Ploting','FontSize',10,'FontWeight','bold', 'ForegroundColor','w',...
    'Position',[.255 .17 .5 .327],'Backgroundcolor',BackgroundColor);

title_text = ' Offline Extraction & Plotting Application' ;
TITLE = uicontrol('style','text','units','normalized','position',[.001, .85, .99, .155],'String',...
    title_text,'FontWeight','bold','FontSize',30,'Backgroundcolor',BackgroundColor,...
    'ForegroundColor',[.9 .9 .6]);

sub_title_text = 'HEADER' ;
TITLE = uicontrol('style','text','units','normalized','position',[.260, .000001, .49, .16],'String',...
   sub_title_text,'FontWeight','normal','FontSize',22,'Backgroundcolor',BackgroundColor,...
    'ForegroundColor',[1 1 1]);

sub_title_text = '@Developed by Sujit From RSD. ' ;
TITLE = uicontrol('style','text','units','normalized','position',[.400, .001, .23, .06],'String',...
   sub_title_text,'FontWeight','bold','FontSize',10,'Backgroundcolor',BackgroundColor,...
    'ForegroundColor',[.9 .9 .6]);

RAW_FILE = uicontrol('style','pushbutton','units','normalized','position',[.270 .687 .22 .130],'visible','on',...
    'FontSize',14,'Backgroundcolor',Bcolor,'FontWeight','bold','String','Select Raw File',...
    'ForegroundColor',[1 1 1], 'Callback',@raw_file);

RAW_FILE_TEXT = uicontrol('style','edit','units','normalized','position',[.270 .59 .22 .085],'visible','on',...
    'FontSize',12,'Backgroundcolor',Wcolor,'FontWeight','Normal','String','Check Status',...
    'ForegroundColor',[.1 .1 .1], 'Callback',@raw_file_text);

FILE_EXE = uicontrol('style','pushbutton','units','normalized','position',[.520 .69 .22 .130],'visible','on',...
    'FontSize',14,'Backgroundcolor',Bcolor,'FontWeight','bold','String',' Execute .exe File',...
    'ForegroundColor',[1 1 1], 'Callback',@file_exe);

FILE_TEXT = uicontrol('style','edit','units','normalized','position',[.520 .59 .22 .085],'visible','on',...
    'FontSize',12,'Backgroundcolor',Wcolor,'FontWeight','Normal','String','Check Status',...
    'ForegroundColor',[.1 .1 .1], 'Callback',@file_text);

PLOT = uicontrol('style','pushbutton','units','normalized','position',[.465 .51 .08 .070],'visible','on',...
    'FontSize',18,'Backgroundcolor',Bcolor,'FontWeight','bold','String','Plot',...
    'ForegroundColor',[1 1 1], 'Callback',@plot);


FILE_OPEN = uicontrol('style','pushbutton','units','normalized','position',[.270 .31 .25 .140],'visible','on',...
    'FontSize',15,'Backgroundcolor',Bcolor,'FontWeight','bold','String','Select Folder for Ploting',...
    'ForegroundColor',[1 1 1], 'Callback',@file_open);

FILE_TEXT0 = uicontrol('style','edit','units','normalized','position',[.270 .20 .25 .085],'visible','on',...
    'FontSize',12,'Backgroundcolor',Wcolor,'FontWeight','Normal','String','Check Status',...
    'ForegroundColor',[.1 .1 .1], 'Callback',@file_text0);

   
btn1 = uicontrol('style','pushbutton','units','normalized','position',[.530 .37 .20 .085],'visible','on',...
    'FontSize',12,'FontWeight','Normal','String','Enter Run Name',...
    'ForegroundColor',[.1 .1 .1], 'Callback',@enterInput1);

btn2 = uicontrol('style','pushbutton','units','normalized','position',[.530 .27 .20 .085],'visible','on',...
    'FontSize',12,'FontWeight','normal','String','Enter Mission Date',...
    'ForegroundColor',[.1 .1 .1], 'Callback',@enterInput2);
showValuesBtn = uicontrol('style','pushbutton','units','normalized','position',[.593 .18 .08 .075],'visible','on',...
    'FontSize',18,'Backgroundcolor',Bcolor,'FontWeight','bold','String','Done',...
    'ForegroundColor',[1 1 1], 'Callback',@showValues);
%%
axes('unit','normalized','position',[0 0.3 0.3 0.5]);
A = imread('demo.png');
imshow(A)
axes('unit','normalized','position',[0.7 0.3 0.3 0.5]);
B = imread('demo.png');
imshow(B)
%%
end