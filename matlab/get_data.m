function get_data(dataFile, subjnum)
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
	
	dataFile = [dataFile filename];
	
	X = spm_read_vols(spm_vol(dataFile));
	xx = X(:,:,brainSlice);
	alldata = [alldata xx(:)];
end

save([