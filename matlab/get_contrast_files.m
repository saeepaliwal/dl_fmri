function get_contrast_files

[agbpSubjects antbpSubjects] = sandra_subjects_contrast;

pathPrefix = '/cluster/scratch_xl/shareholder/klaas/igsandra/ag_bp/MRI/scans/';
pathImgPostfix = '/spm_glm/sslbin9/fixom_bin9/con_0021.img';
pathHdrPostfix = '/spm_glm/sslbin9/fixom_bin9/con_0021.hdr';

% Pull the ag img contrast files
homePath = '/cluster/home03/itet/paliwals/Saee/dl_fmri/scans/ag_bp/';
for i = 1:length(agbpSubjects)
    subjPath = [homePath agbpSubjects{i}];
    %mkdir(subjPath);
    for j = [23]
        
        pathImgPostfix = ['/spm_glm/sslbin9/fixom_bin9/con_00' sprintf('%d',j) '.img'];
        pathHdrPostfix = ['/spm_glm/sslbin9/fixom_bin9/con_00' sprintf('%d',j) '.hdr'];
        
        fullImgPath = [pathPrefix agbpSubjects{i} pathImgPostfix];
        fullHdrPath = [pathPrefix agbpSubjects{i} pathHdrPostfix];
        
        copyfile(fullImgPath,subjPath);
        copyfile(fullHdrPath,subjPath);
    end
end

% Pull the ant img contrast files
pathPrefix = '/cluster/scratch_xl/shareholder/klaas/igsandra/ant_bp/MRI/scans/';
homePath = '/cluster/home03/itet/paliwals/Saee/dl_fmri/scans/ant_bp/';

for i = 1:length(antbpSubjects)
    subjPath = [homePath antbpSubjects{i}];
    %mkdir(subjPath);
    for j = [23]
        pathImgPostfix = ['/spm_glm/sslbin9/fixom_bin9/con_00' sprintf('%d',j) '.img'];
        pathHdrPostfix = ['/spm_glm/sslbin9/fixom_bin9/con_00' sprintf('%d',j) '.hdr'];
        
        fullImgPath = [pathPrefix antbpSubjects{i} pathImgPostfix];
        fullHdrPath = [pathPrefix antbpSubjects{i} pathHdrPostfix];
        
        copyfile(fullImgPath,subjPath);
        copyfile(fullHdrPath,subjPath);
    end
end