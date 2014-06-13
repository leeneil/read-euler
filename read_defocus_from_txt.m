% written by Po-Nan Li @Academia Sinica
% v.1 2014/06/13

function [file_no, defocus, c] = read_defocus_from_txt(filename)

fid = fopen(filename);


pattern = '%d_dn.shrink-1	%f,%s';


c = textscan(fid, pattern,...
    'Delimiter', '\n', ...
    'CommentStyle', '#',...
    'CollectOutput', false);

fclose(fid);

file_no = c{1};
defocus = c{2};

end
