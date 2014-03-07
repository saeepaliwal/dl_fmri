function get_contrast_files

[agbpSubjects antbpSubjects] = sandra_subjects;
keyboard

pathPrefix = '/cluster/scratch_xl/shareholder/klaas/igsandra/ag_bp/MRI/scans/';
pathImgPostfix = '/spm_glm/sslbin9/fixom_bin9/con_0021.img';
pathHdrPostfix = '/spm_glm/sslbin9/fixom_bin9/con_0021.hdr';

% Pull the ag img contrast files
homePath = '/cluster/home03/itet/paliwals/Saee/dl_fmri/scans/ag_bp/';
for i = 1:length(agbpSubjects)
    fullImgPath = [pathPrefix agbpSubjects{i} pathImgPostfix];
	fullHdrPath = [pathPrefix agbpSubjects{i} pathHdrPostfix];
	
	subjPath = [homePath agbpSubjects{i}];
	mkdir(subjPath);
	copyfile(fullImgPath,subjPath);
	copyfile(fullHdrPath,subjPath);
end

% Pull the ant img contrast files
pathPrefix = '/cluster/scratch_xl/shareholder/klaas/igsandra/ant_bp/MRI/scans/';
homePath = '/cluster/home03/itet/paliwals/Saee/dl_fmri/scans/ant_bp/';
for i = 1:length(antbpSubjects)
	fullImgPath = [pathPrefix antbpSubjects{i} pathImgPostfix];
	fullHdrPath = [pathPrefix antbpSubjects{i} pathHdrPostfix];

	subjPath = [homePath antbpSubjects{i}];
	mkdir(subjPath);
	copyfile(fullImgPath,subjPath);
	copyfile(fullHdrPath,subjPath);
end