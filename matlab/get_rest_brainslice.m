function get_rest_brainslice(brainSlice)
% This file pulls in the specified brain slice for each time point of
% resting state for all subjects;

% Get all subject names
[agbpSubjects antbpSubjects] = sandra_subjects;

datasrcAG = '/cluster/scratch_xl/shareholder/klaas/igsandra/ag_bp/MRI/scans/';
dataPostfix = '/spm_pre/rest/';
agonists = [];
for i = 1:length(agbpSubjects)
	dataFile = [datasrcAG agbpSubjects{i} dataPostfix];
	brutusCMD = ['!bsub -q vip.1h "matlab -nodisplay -nojvm -singleCompThread -r get_data\(' dataFile '\)\"'];
	eval(brutusCMD);
end


datasrcAG = '/cluster/scratch_xl/shareholder/klaas/igsandra/ant_bp/MRI/scans/';
dataPostfix = '/spm_pre/rest/';

for i = 1:length(antbpSubjects)
	dataFile = [datasrcANT antbpSubjects{i} dataPostfix];
	brutusCMD = ['!bsub -q vip.1h "matlab -nodisplay -nojvm -singleCompThread -r get_data\(' dataFile '\)\"'];
	eval(brutusCMD);
end
	