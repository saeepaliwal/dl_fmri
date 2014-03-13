% This file pulls in vectorized versions of all the subjects, all resting state scans, slice specified

addpath('../../spm8')
% Get all subject names
[agbpSubjects antbpSubjects] = sandra_subjects_restingstate;

brainSlice = 50;

datasrcAG = '/cluster/scratch_xl/shareholder/klaas/igsandra/ag_bp/MRI/scans/';
dataPostfix = '/spm_pre/rest/';
agonists = [];
for i = 1:length(agbpSubjects)
      	i
	for j = 1:250
	      	j  
		dataFile = [datasrcAG agbpSubjects{i} dataPostfix];
        
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
		agonists(:,250*(i-1) + j) = xx(:);
	end
	save agonists_rest50 agonists
end


antagonists = [];
datasrcANT = '/cluster/scratch_xl/shareholder/klaas/igsandra/ant_bp/MRI/scans/';
dataPostfix = '/spm_pre/rest/';

for i = 1:length(antbpSubjects)
      	i
	for j = 1:250
    	      	j
		dataFile = [datasrcANT antbpSubjects{i} dataPostfix];
		if j<10
			filename = ['swrest_0000' sprintf('%d',j) '.nii'];
		elseif j <100
			filename = ['swrest_000' sprintf('%d',j) '.nii'];
		else
			filename = ['swrest_00' sprintf('%d',j) '.nii'];
		end
		dataFile = [dataFile filename];
		
		X = spm_read_vols(spm_vol(dataFile));
		xx = X(:,:,brainSlice);;
		antagonists(:,250*(i-1) + j) = xx(:);
	end
	save antagonists_rest50 antagonist
end
	
