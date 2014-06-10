% written by Po-Nan Li @Academia Sinica
% v.1 2014/06/10 

function [particle_no, file_no, euler, c] = read_euler_function(filename)

fid = fopen(filename);

firstline = textscan(fid, '%s', 1);
firstline = firstline{1};
fclose(fid);
fid = fopen(filename);

if strcmp(firstline, '#LSX')
    pattern = '%d	../particles/%d_dn.shrink-1.hdf	euler=%f,%f,%f %s';
    lsx = true;
else
    if strcmp(firstline, '#LST')
        pattern = '%d	../sets/a.lst	euler=%f,%f,%f %s';
        lsx = false;
    else
        error('cannot recognize this file');
    end
end

c = textscan(fid, pattern,...
    'Delimiter', '\n', ...
    'CommentStyle', '#',...
    'CollectOutput', false);

fclose(fid);

particle_no = c{1};
if lsx
    file_no = c{2};
    euler = [c{3} c{4} c{5}];
else
    file_no = [];
    euler = [c{2} c{3} c{4}];
end
