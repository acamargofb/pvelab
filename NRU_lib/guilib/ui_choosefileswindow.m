function ui_choosefileswindow()
% This is the machine-generated representation of a Handle Graphics object
% and its children.  Note that handle values may change when these objects
% are re-created. This may cause problems with any callbacks written to
% depend on the value of the handle at the time the object was saved.
%
% To reopen this object, just type the name of the M-file at the MATLAB
% prompt. The M-file and its associated MAT-file must be on your path.

load ui_choosefileswindow              

a = figure('Clipping','off', ...
	'Color',[0.8 0.8 0.8], ...
	'Colormap',mat0, ...
	'MenuBar','none', ...
	'NumberTitle','off', ...
	'Units','pixels', ...
	'Position',[300 200 565 460], ...
	'Tag','ChooseFigure');
b = uicontrol('Parent',a, ...
	'Units','normalized', ...
	'BackgroundColor',[0.4 0.6 0.66], ...
	'Position',[0 0 1 1], ...
	'Style','frame', ...
	'Tag','Frame2');
b = uicontrol('Parent',a, ...
	'Units','normalized', ...
	'BackgroundColor',[0.4 0.6 0.66], ...
	'Position',[0 0 1 0.145], ...
	'Style','frame', ...
	'Tag','Frame1');
b = uicontrol('Parent',a, ...
	'Units','normalized', ...
	'BackgroundColor',[0.5 0.5 0.54], ...
	'Callback','ui_choosefiles_real(''CBDir'');', ...
	'FontUnits','pixels', ...
	'FontSize',12, ...
	'FontName','application', ...
	'ForegroundColor',[1 1 1], ...
	'Position',[0.0752688 0.290203 0.408602 0.637708], ...
	'String',mat1, ...
	'Style','listbox', ...
	'Tag','ListboxDir', ...
	'Value',7);
b = uicontrol('Parent',a, ...
	'Units','normalized', ...
	'BackgroundColor',[0.5 0.5 0.54], ...
	'ButtonDownFcn','ui_choosefiles_real(''BDEditFilter'');', ...
	'Callback','ui_choosefiles_real(''CBEditFilter'');', ...
	'FontUnits','pixels', ...
	'FontSize',12, ...
	'FontName','application', ...
	'ForegroundColor',[1 1 1], ...
	'HorizontalAlignment','left', ...
	'Position',[0.172043 0.173752 0.752688 0.0554529], ...
	'String','*.*', ...
	'Style','edit', ...
	'Tag','EditFilter');
b = uicontrol('Parent',a, ...
	'Units','normalized', ...
	'BackgroundColor',[0.4 0.6 0.66], ...
	'FontUnits','pixels', ...
	'FontSize',12, ...
	'FontName','application', ...
	'ForegroundColor',[1 1 1], ...
	'HorizontalAlignment','left', ...
	'Position',[0.0731183 0.184843 0.0967742 0.0351201], ...
	'String','Filter:', ...
	'Style','text', ...
	'Tag','StaticText1');
b = uicontrol('Parent',a, ...
	'Units','normalized', ...
	'BackgroundColor',[0.4 0.6 0.66], ...
	'ButtonDownFcn','ui_choosefiles_real(''Ok'');', ...
	'Callback','ui_choosefiles_real(''Ok'');', ...
	'FontUnits','pixels', ...
	'FontSize',12, ...
	'FontName','application', ...
	'FontWeight','demi', ...
	'ForegroundColor',[1 1 1], ...
	'Position',[0.2 0.035 0.2 0.075], ...
	'String','Ok', ...
	'Tag','Pushbutton1');
b = uicontrol('Parent',a, ...
	'Units','normalized', ...
	'BackgroundColor',[0.4 0.6 0.66], ...
	'ButtonDownFcn','ui_choosefiles_real(''Cancel'');', ...
	'Callback','ui_choosefiles_real(''Cancel'');', ...
	'FontUnits','pixels', ...
	'FontSize',12, ...
	'FontName','application', ...
	'FontWeight','demi', ...
	'ForegroundColor',[1 1 1], ...
	'Position',[0.6 0.035 0.2 0.075], ...
	'String','Cancel', ...
	'Tag','Pushbutton1');
b = uicontrol('Parent',a, ...
	'Units','normalized', ...
	'BackgroundColor',[0.4 0.6 0.66], ...
	'FontUnits','pixels', ...
	'FontSize',12, ...
	'FontName','application', ...
	'ForegroundColor',[1 1 1], ...
	'HorizontalAlignment','left', ...
	'Position',[0.51828 0.933456 0.116129 0.0332717], ...
	'String','File(s):', ...
	'Style','text', ...
	'Tag','StaticText2');
b = uicontrol('Parent',a, ...
	'Units','normalized', ...
	'BackgroundColor',[0.4 0.6 0.66], ...
	'FontUnits','pixels', ...
	'FontSize',12, ...
	'FontName','application', ...
	'ForegroundColor',[1 1 1], ...
	'HorizontalAlignment','left', ...
	'Position',[0.0752688 0.933456 0.20 0.0351201], ...
	'String','Directories:', ...
	'Style','text', ...
	'Tag','StaticDir');
b = uicontrol('Parent',a, ...
	'Units','normalized', ...
	'BackgroundColor',[0.5 0.5 0.54], ...
	'FontUnits','pixels', ...
	'FontSize',12, ...
	'FontName','application', ...
	'ForegroundColor',[1 1 1], ...
	'Max',10000, ...
	'Position',[0.51828 0.290203 0.408602 0.637708], ...
	'String',mat2, ...
	'Style','listbox', ...
	'Tag','ListboxFiles', ...
	'Value',1);
b = uicontrol('Parent',a, ...
	'Units','normalized', ...
	'BackgroundColor',[0.4 0.6 0.66], ...
	'FontUnits','pixels', ...
	'FontSize',12, ...
	'FontName','application', ...
	'ForegroundColor',[1 1 1], ...
	'HorizontalAlignment','left', ...
	'Position',[0.0752688 0.238447 0.84086 0.0351201], ...
	'String','/users/dl', ...
	'Style','text', ...
	'Tag','Path');
