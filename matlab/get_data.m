function get_data(dataFile, subjnum, brainSlice)
addpath('../../spm8')
alldata = [];
for j = 1:250
	if j<10
		filename = ['swrest_0000' sprintf('%d',j) '.nii'];
	elseif j <100
		filename = ['swrest_000' sprintf('%d',j) '.nii'];
	else
		filename = ['swrest_00' sprintf('%d',j) '.nii'];
	end
	
	fulldataFile = [dataFile filename]
	
	X = spm_read_vols(spm_vol(fulldataFile));
	xx = X(:,:,brainSlice);
	alldata = [alldata xx(:)];
end
if strfind(dataFile,'ag')
filename = [ 'ag' sprintf('%d',subjnum) 'rest_' sprintf('%d',brainSlice)]
elseif strfind(dataFile,'ant')
filename = [ 'ant' sprintf('%d',subjnum) 'rest_' sprintf('%d',brainSlice)]
end
save(filename,'alldata');