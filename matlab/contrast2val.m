% This file pulls in vectorized versions of all the subjects, contrast
% 0021.

% Get all subject names
[agbpSubjects antbpSubjects] = sandra_subjects;

% Pull in agonist data
agonists = [];
datasrcAG = '../../scans/ag_bp/';
for i = 1:length(agbpSubjects)
	dataFile = [datasrcAG agbpSubjects{i} '/con_0021.img'];
	X = spm_read_vols(spm_vol(dataFile));
	agonists = [agonists X(:)];
end

antagonists = [];
datasrcANT = '../../scans/ant_bp/';
for i = 1:length(antbpSubjects)
	dataFile = [datasrcANT antbpSubjects{i} '/con_0021.img'];
	X = spm_read_vols(spm_vol(dataFile));
	antagonists = [antagonists X(:)];
end
	

