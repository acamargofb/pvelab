function printeasy(arg1)
%
%
%  Modified 150500 cmm
%
% added support for printing on Linux
%    
%  Modified 20010907 willend
% 
% added support for printing on RedHat linux 7.1
% 

% is the function a callback??
if nargin>0
  if ischar(arg1)
    if strcmp(arg1,'print')
      fig=get(gcbf,'UserData');
      if ishandle(fig)
        hf=findobj(gcbf,'Tag','outputformat');
        formatno=get(hf,'Value');
        d=get(hf,'UserData');
        s=get(hf,'String');
        hs=findobj(gcbf,'Tag','printerbutton');
        if get(hs,'Value')   % Send to printer 
          hn=findobj(gcbf,'Tag','printername');
          name=get(hn,'String');
          name=name{get(hn,'Value')};
          cmd=sprintf('print -P%s %s -f%d',name,d{formatno,1},fig);
        else                 % Save in file
          [nam,pat]=uiputfile(['*.' d{formatno,2}], ['Save as ' s{formatno}]);
          if ~ischar(nam)
            return;
          end
          name=fullfile(pat,nam);
          cmd=sprintf('print %s -f%d %s',d{formatno,1},fig,name);
        end
      else
        cmd='';
      end
      close(gcbf);
      disp(cmd)
      eval(cmd);
    end
    return;
  else
    if ~ishandle(arg1)
      disp('Argument must be a figure handle!');
      return;
    end
    fig=arg1;
  end
else
  fig=gcf;
end

MakePrintDialog(fig);


%*********************

function MakePrintDialog(fig)

str={'PostScript for color printers', '-dpsc', 'ps'; ...
     'PostScript for b&w printers', '-dps', 'ps'; ...
     'Level 2 PostScript for color printers', '-dpsc2', 'ps'; ...
     'Level 2 PostScript for b&w printers', '-dps2', 'ps'; ...
     'HP LaserJet III', '-dljet3', 'prn'; ...
     'HP DeskJet 500C color', '-dcdjcolor', 'prn'; ...
     'HPGL (HP 7475A compatible plotter)', '-dhpgl', 'hpg'; ...
     'Encapsulated PostScript', '-deps -tiff', 'eps'; ...
     'Encapsulated Color PostScript', '-depsc -tiff', 'eps'; ...
     'Encapsulated Level 2 PostScript', '-deps2 -tiff', 'eps'; ...
     'Encapsulated Level 2 Color PostScript', '-depsc2 -tiff', 'eps'; ...
     'Matlab M-file', '-dmfile', 'm'; ...
     'JPEG image', '-djpeg', 'jpg'; ...
     'TIFF color file format', '-dtiff', 'tif'; ...
     '8-bit (256-color) .BMP file format', '-dbmp256', 'bmp'; ...
     '24-bit color .BMP file format', '-dbmp16m', 'bmp'; ...
     'Monochrome .PCX file format', '-dpcxmono', 'pcx'; ...
     '8-bit (256-color) .PCX file format', '-dpcx256', 'pcx'; ...
     '24-bit color .PCX file format', '-dpcx24b', 'pcx'; ...
     };
 
if strcmp(getenv('OSTYPE'), 'linux') % RedHat 6.1
  [a b] = unix('/usr/sbin/lpc status | grep -e :');
  s = size(b);
  printers = {};
  while ~isempty(b)
    [a b] = strtok(b,':');
    if ~isempty(b)
      printers = [printers {a}];
    end;
    b(1) = '';
    b(1) = '';
  end;
  defaultprinter=1;
elseif strcmp(getenv('OSTYPE'), 'linux-gnu') % RedHat 7.1
  [a b] = unix('/usr/sbin/lpc status all | grep -e @');
  s = size(b);
  printers = {};
  b=unroll(b);
  while ~isempty(b)
    [a b] = strtok(b,'@');
    if ~isempty(b)
      printers = [printers {a}];
    end;
    % find next newline char:
    nlidx=1:length(b);
    nlidx=nlidx(b-0==10);
    b=b(nlidx+1:length(b));
  end;
  defaultprinter=1;
elseif strcmp(getenv('OSTYPE'), 'hpux') 
  [a b]=unix('lpstat -s');
  if a == 0
    i=strfind(b,'system default destination:');
    def=strtok(b(i+27:end));
    i=strfind(b,'device for');
    printers={};
    x=1;
    for n=i;
      printers=[printers {strtok(b(n+10:end),' :')}];
      if strcmp(printers{end}, def)
	defaultprinter=x;
      end
      x=x+1;
    end
  end;
end;
h0 = figure('Color',[0.8 0.8 0.8], ...
	'MenuBar','none', ...
	'Name',sprintf('Print: Figure %d',fig), ...
	'NumberTitle','off', ...
	'Position',[901 750 320 180], ...
	'Resize','off', ...
	'UserData',fig, ...
	'Tag','Fig1');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.701960784313725 0.701960784313725 0.701960784313725], ...
	'ListboxTop',0, ...
	'Position',[0 121 322 109], ...
	'Style','frame', ...
	'Tag','Frame3');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.701960784313725 0.701960784313725 0.701960784313725], ...
	'ListboxTop',0, ...
	'Position',[0 48 322 75], ...
	'Style','frame', ...
	'Tag','Frame2');
h1 = uicontrol('Parent',h0, ...
	'BackgroundColor',[0.701960784313725 0.701960784313725 0.701960784313725], ...
	'ListboxTop',0, ...
	'Position',[0 0 322 50], ...
	'Style','frame', ...
	'Tag','Frame1');
h1 = uicontrol('Parent',h0, ...
	'Units','pixels', ...
	'BackgroundColor',[0.701960784313725 0.701960784313725 0.701960784313725], ...
	'CallBack','set(findobj(gcbf,''Tag'',''filebutton''),''Value'',0); set(findobj(gcbf,''Tag'',''printername''),''Enable'',''on''); set(gcbo,''Value'',1);set(findobj(gcbf,''Tag'',''Printbutton''),''String'',''Print'');', ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Position',[112.3865034448819 87.41172490157481 83.56945127952757 19.21136811023622], ...
	'String','Printer', ...
	'Style','radiobutton', ...
	'Tag','printerbutton', ...
	'Value',1);
h1 = uicontrol('Parent',h0, ...
	'Units','pixels', ...
	'BackgroundColor',[0.701960784313725 0.701960784313725 0.701960784313725], ...
	'CallBack','set(findobj(gcbf,''Tag'',''printerbutton''),''Value'',0); set(findobj(gcbf,''Tag'',''printername''),''Enable'',''off''); set(gcbo,''Value'',1);set(findobj(gcbf,''Tag'',''Printbutton''),''String'',''Save'');', ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Position',[205.5616387795276 87.41172490157481 83.56945127952757 19.21136811023622], ...
	'String','File', ...
	'Style','radiobutton', ...
	'Tag','filebutton');
h1 = uicontrol('Parent',h0, ...
	'Units','pixels', ...
	'BackgroundColor',[0.701960784313725 0.701960784313725 0.701960784313725], ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Min',1, ...
	'Position',[90 140 220 20], ...
	'String',str(:,1), ...
	'Style','popupmenu', ...
	'Tag','outputformat', ...
	'UserData',str(:,2:end), ...
	'Value',1);
h1 = uicontrol('Parent',h0, ...
	'Units','pixels', ...
	'BackgroundColor',[0.701960784313725 0.701960784313725 0.701960784313725], ...
	'CallBack','close(gcbf)', ...
	'ListboxTop',0, ...
	'Position',[14 12 88 24], ...
	'String','Cancel', ...
	'Tag','Pushbutton1');
h1 = uicontrol('Parent',h0, ...
	'Units','pixels', ...
	'BackgroundColor',[0.701960784313725 0.701960784313725 0.701960784313725], ...
	'CallBack','pagedlg(get(gcbf,''UserData''))', ...
	'ListboxTop',0, ...
	'Position',[14+88+14 12 88 24], ...
	'String','Page setup', ...
	'Tag','Pushbutton1');
h1 = uicontrol('Parent',h0, ...
	'Units','pixels', ...
	'BackgroundColor',[0.701960784313725 0.701960784313725 0.701960784313725], ...
	'CallBack','printeasy(''print'')', ...
	'ListboxTop',0, ...
	'Position',[14+88+14+88+14 12 88 24], ...
	'String','Print', ...
	'Tag','Printbutton');

h1 = uicontrol('Parent',h0, ...
	'Units','pixels', ...
	'BackgroundColor',[0.701960784313725 0.701960784313725 0.701960784313725], ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Min',1, ...
	'Position',[90 60 220 20], ...
	'String',printers, ...
	'Style','popupmenu', ...
	'Tag','printername', ...
	'UserData',str(:,2:end), ...
	'Value',defaultprinter);

%h1 = uicontrol('Parent',h0, ...
%	'Units','pixels', ...
%	'BackgroundColor',[1 1 1], ...
%	'FontName','system', ...
%	'HorizontalAlignment','left', ...
%	'ListboxTop',0, ...
%	'Position',[90 60 220 20], ...
%	'String','', ...
%	'Style','edit', ...
%	'Tag','printername');

h1 = uicontrol('Parent',h0, ...
	'Units','pixels', ...
	'FontUnits','pixels', ...
	'BackgroundColor',[0.702 0.702 0.702], ...
	'FontSize',11, ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Position',[7 140 80 17], ...
	'String','Output format:', ...
	'Style','text', ...
	'Tag','StaticText1');
h1 = uicontrol('Parent',h0, ...
	'FontUnits','pixels', ...
	'BackgroundColor',[0.702 0.702 0.702], ...
	'FontSize',11, ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Position',[7 90 100 17], ...
	'String','Send to:', ...
	'Style','text', ...
	'Tag','StaticText1');
h1 = uicontrol('Parent',h0, ...
	'Units','pixels', ...
	'FontUnits','pixels', ...
	'BackgroundColor',[0.702 0.702 0.702], ...
	'FontSize',11, ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Position',[7 60 74 17], ...
	'String','Printer name:', ...
	'Style','text', ...
	'Tag','');












