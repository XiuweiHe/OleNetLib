function [folders, images] = getDataInfo(opts)
% root is the block path, opts is the choice of the type of the data

[folders, images] = init();
[folders, images] = getMeta(opts, folders, images);


%--------------------------------------------------------------------------
function [folders, images] = getMeta(opts, folders, images)
%--------------------------------------------------------------------------
mosfile_path = fullfile(opts.baseDir, opts.mos_name);
[filename_list, score] = read_mos_text(mosfile_path);
folders.folder_name = arrayfun(@(x) getFoldername(x), filename_list, 'UniformOutput',false);
folders.folderfullpath = arrayfun(@(x) [opts.blocksDir filesep cell2mat(x{:})], folders.folder_name, 'UniformOutput',false);
folders.folder_id = single(1:length(folders.folder_name));
classes = cellfun(@(x) getLabel(x, opts.classes), folders.folder_name, 'UniformOutput',false);
folders.class = single(cell2mat(classes));

nf = length(folders.folder_id);
folderind = randperm(nf);
images.set = zeros(1, length(folders.folder_id), 'single');
images.set(folderind(1:ceil(nf*opts.setpartion(1))))=1;
images.set(folderind(ceil(nf*opts.setpartion(1))+1 : ceil(nf*(opts.setpartion(1)+opts.setpartion(2))))) =2;
images.set(folderind(ceil(nf*(opts.setpartion(1)+opts.setpartion(2)))+1 : nf))=3;

files = cellfun(@(x) dir(x), folders.folderfullpath, 'UniformOutput',false);
files = cellfun(@(x)  getfield(x, 'name'), files, 'UniformOutput',false); 
% files = cellfun(@(x) struct2cell(x), files, 'UniformOutput',false);
% files = cellfun(@(x) x(1,3:end), files, 'UniformOutput',false);
nname = cellfun(@(x) numel(x), files);

if ~isempty(score) 
    images.score = score;
    images.score = arrayfun(@(x, y) repmat(x, [1 y]), images.score, nname, 'UniformOutput', false);
    images.score = horzcat(images.score{:});
end

images.names = horzcat(files{:});
images.classes = arrayfun(@(x, y) repmat(x, [1 y]), folders.class, nname, 'UniformOutput', false);
images.classes = horzcat(images.classes{:});
images.folderid = arrayfun(@(x, y) repmat(x, [1 y]), folders.folder_id, nname, 'UniformOutput', false);
images.folderid = horzcat(images.folderid{:});
images.superfolder = arrayfun(@(x, y) repmat(x, [1 y]), folders.folder_name, nname, 'UniformOutput', false);
images.superfolder = horzcat(images.superfolder{:});
images.imagesid = 1:length(images.names);

images.fullpath = cellfun( @(x,y) [x '/' y],...
    images.superfolder, images.names, 'UniformOutput', false);         

images.set = arrayfun(@(x, y) repmat(x, [1 y]), images.set, nname, 'UniformOutput', false);
images.set = horzcat(images.set{:});

if CHECK_SCORE %display for assert
    indassert = randperm(length(images.names), 10);
    sprintf('%s\n', 'FOLLOWING INFOMATION HELP YOU TO CHECK THE SCORE');
    for i = 1 : length(indassert)
        if iscell(images.superfolder{indassert(i)})
            fprintf('%s%s,score: \t%f\n', images.superfolder{indassert(i)}{:}, images.names{indassert(i)},  images.score(indassert(i)));
        else
            fprintf('%s%s,score: \t%f\n', images.superfolder{indassert(i)}, images.names{indassert(i)},  images.score(indassert(i)));
        end
    end
end


%--------------------------------------------------------------------------
function folder = getFoldername(path)
%--------------------------------------------------------------------------
strtemp = strsplit(path{:}, {'/', '\'});
folder = {[strtemp{end-1} '/' strtemp{end}(1:end-4) '/']};


%--------------------------------------------------------------------------
function label = getLabel(foldername, classes)
%--------------------------------------------------------------------------
a = cellfun(@(x) strfind(foldername, x),  classes, 'UniformOutput' ,false);
a = cellfun(@(x) cell2mat(x), a,  'UniformOutput' ,false);
a = cellfun(@(x) isempty(x), a);
label = find(a == 0);

%--------------------------------------------------------------------------
function [filelist, score] = read_mos_text(mosfile_path)
%--------------------------------------------------------------------------
CHECK_SCORE = true;
fileID = fopen(mosfile_path);
C = textscan(fileID,'%f %s');
fclose(fileID);
mos = C{:,1}';
filelist = C{:,2}';
score = mos;
%         
% switch(opts.datasetType)
%     case 'tid',
%         % mosfile_path = fullfile(opts.baseDir, 'mos_with_names.txt');
%         
%         fileID = fopen(mosfile_path);
%         C = textscan(fileID,'%f %s');
%         fclose(fileID);
%         mos = C{:,1}';
%         filename_list = C{:,2}';
%         score = mos;
%  
% %         switch opts.classType
% %             case 'byType',
% %                 C = cellfun(@(x) strsplit(x, '_'), folders.folder_name, 'UniformOutput', false);       
% %                 folders.class = cell2mat(cellfun(@(x) str2double(x{2}), C, 'UniformOutput', false));
% %                 images.meta.classes = opts.classess(unique(folders.class));
% %             case 'byScore',
% %                 
% %                 folders.class = ceil(score);
% %         end
%     case 'qa',
%         CHECK_SCORE = false;
%         images.meta.classes  = opts.classes;       
%         fileID = fopen(opts.infoPath);
%         C = textscan(fileID, '%[^\n]');
%         fclose(fileID);
%         filename_list = C{:}';
%         score = [];
%    
%     case 'live',

% end

%--------------------------------------------------------------------------
function [folders, images] =  init()
%--------------------------------------------------------------------------
folders.folderfullpath = {};
folders.folder_name = {};
folders.folder_id = [];
folders.classe = [];

images.names = {};
images.classes = {};
images.imagesid = [];
images.folderid = [];
images.superfolder = {};
images.fullpath = {};
images.score = [];
images.meta.classes = {};