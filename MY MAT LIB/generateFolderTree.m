function [folders] = generateFolderTree(root, depth, exclude_folder)
%%
if nargin < 3
    exclude_folder = [];
end

if (depth-1 == 0)
    folders = [];
    return 
end

path = root;
files = dir(root);

folders = {};
for i = 3 : length(files)
    if ~isdir([root '\' files(i).name]) || ~isempty(strfind(exclude_folder, files(i).name))
       continue;
    else
        sub_folder = [root '\' files(i).name];
        folders{end+1} = sub_folder;
    end
    
    new_folders = generateFolderTree(sub_folder, depth-1, exclude_folder);
    if isempty(new_folders)
        continue;
    end
    folders = [folders, new_folders];    
end

end