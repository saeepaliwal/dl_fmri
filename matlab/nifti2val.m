% This file pulls in vectorized versions of all the subjects, contrast
% 0021.

% Get all subject names
[agbpSubjects antbpSubjects] = sandra_subjects;

brainSlice = 62;
datasrcAG = '/cluster/scratch_xl/shareholder/klaas/igsandra/ag_bp/MRI/scans/';
dataPostfix = '/spm_pre/rest/';
agonists = [];
for i = 1:length(agbpSubjects)
	dataFile = [datasrcAG agbpSubjects{i} dataPostfix];
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
		agonists = [agonists xx(:)];
	end
end

save agonists_rest62 agonists

antagonists = [];
datasrcAG = '/cluster/scratch_xl/shareholder/klaas/igsandra/ant_bp/MRI/scans/';
dataPostfix = '/spm_pre/rest/';

for i = 1:length(antbpSubjects)
	dataFile = [datasrcANT antbpSubjects{i} dataPostfix];
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
		xx = X(:,:,brainSlice);;
		antagonists = [antagonists xx(:)];
	end
end
	
save antagonists_rest62 antagonists