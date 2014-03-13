function get_rest_brainslice(brainSlice)
% This file pulls in the specified brain slice for each time point of
% resting state for all subjects;

% Get all subject names
[agbpSubjects, antbpSubjects] = sandra_subjects_restingstate;

datasrcAG = '/cluster/scratch_xl/shareholder/klaas/igsandra/ag_bp/MRI/scans/';
dataPostfix = '/spm_pre/rest/';
agonists = [];
for i = 2:length(agbpSubjects)
	dataFile = [datasrcAG agbpSubjects{i} dataPostfix];
	brutusCMD = ['bsub -q vip.1h "matlab -nodisplay -nojvm -singleCompThread -r get_data\(\''' dataFile '\'',' sprintf('%d',i) ',' sprintf('%d',brainSlice) '\)"'];
	system(brutusCMD);
end


datasrcANT = '/cluster/scratch_xl/shareholder/klaas/igsandra/ant_bp/MRI/scans/';
dataPostfix = '/spm_pre/rest/';

for i = 2:length(antbpSubjects)
	dataFile = [datasrcANT antbpSubjects{i} dataPostfix];
	brutusCMD = ['bsub -q vip.1h "matlab -nodisplay -nojvm -singleCompThread -r get_data\(\''' dataFile '\'',' sprintf('%d',i) ',' sprintf('%d',brainSlice) '\)"'];
	system(brutusCMD);
end