function get_nifti_files

agbpSubjects = {'S_LI_535';}

%'S_LU_181';  'S_MD_964';  'S_MR_623';  'S_NN_525';  'S_NW_323';  'S_OF_781';  'S_OQ_844';  'S_OZ_704';  'S_PL_831';  
%	'S_PX_494'; 'X_OG_165'; 'S_LB_509';  'S_LK_456';  'S_LV_592';  'S_ME_203';  'S_MW_684';  'S_NO_141';  'S_NY_738';  'S_OH_620';  'S_OR_418'; 
%	'S_PB_136'; 'S_PM_769'; 'S_PY_169';  'S_LC_352';  'S_LL_871'; 'S_LW_543';  'S_MF_553'; 'S_NA_883';  'S_NP_949';  'S_NZ_771';  'S_OJ_652';
%	'S_OS_171'; 'S_PC_705';  'S_PN_998';  'S_PZ_961'; 'S_LD_348';  'S_LM_932';  'S_LY_308';  'S_MH_926';  'S_NC_340';  'S_NQ_724';  'S_OA_649';
%	'S_OL_689'; 'S_OT_965';  'S_PG_863';  'S_PO_779'; 'S_LE_772';  'S_LO_832';  'S_LZ_360'; 'S_ML_696'; 'S_NF_642'; 'S_NS_923'; 'S_OB_432';
%	'S_OM_740'; 'S_OV_777';  'S_PH_276';  'S_PP_770';  'S_LF_672';  'S_LQ_599';  'S_MA_860';  'S_MM_578'; 'S_NI_794'; 'S_NT_698'; 'S_OC_302';  
%	'S_ON_319'; 'S_OW_667';  'S_PJ_549'; 'S_PR_690';  'S_LG_646';  'S_LR_194';  'S_MC_161';  'S_MO_644'; 'S_NJ_663'; 'S_NV_492'; 'S_OD_206';
%	'S_OO_573'; 'S_OX_419';  'S_PK_561'; 'S_PW_780';  'X_MJ_673'};

antbpSubjects = {'S_HJ_432'; 'S_HV_507';  'S_II_745';  'S_IU_269';  'S_JH_993';  'S_JT_897';  'S_KK_199'; 'S_HK_734'; 'S_HW_139';  'S_IJ_251';
	'S_IV_424';  'S_JI_218'; 'S_JV_691';  'S_KL_746';  'S_HL_655';  'S_HX_121';  'S_IK_895';  'S_IX_855'; 'S_JJ_862'; 'S_JW_522';  'S_KM_174';
	'S_HM_495';  'S_HY_559'; 'S_IY_781';  'S_JK_289';  'S_JX_574';  'S_KN_333';  'S_HA_708';  'S_HN_798'; 'S_HZ_959'; 'S_IM_442';  'S_IZ_619';
	'S_JL_771';  'S_JY_937'; 'S_KR_556';  'S_HB_551';  'S_HO_393';  'S_IB_402';  'S_JA_539';  'S_JM_418'; 'S_JZ_970'; 'S_KS_271';  'S_HC_222';                      
	'S_HQ_380';  'S_IC_752'; 'S_IN_843';  'S_JB_508';  'S_JN_724';  'S_KA_848';  'S_KT_396';  'S_HD_547'; 'S_HR_791'; 'S_ID_274';  'S_IO_191';
	'S_JC_403';  'S_JP_226'; 'S_KB_631';  'S_KU_541';  'S_HE_971';  'S_HS_131';  'S_IE_644';  'S_IQ_699'; 'S_JD_841'; 'S_JQ_340';  'S_KC_501';
	'S_KW_154';  'S_HH_845'; 'S_HT_742';  'S_IF_133';  'S_IR_822';  'S_JE_896';  'S_JR_915';  'S_KE_609'; 'S_HI_273'; 'S_HU_460';  'S_IG_857';
	'S_IT_400';  'S_JG_245'; 'S_JS_923';  'S_KH_44'};


pathPrefix = '/cluster/scratch_xl/shareholder/klaas/igsandra/ag_bp/MRI/scans/';
pathPostfix = 'spm_glm/sslbin9/fixom_bin9/con_0021*';

homePath = '/cluster/home03/itet/paliwals/Saee/scans/ag_bp';
keyboard

% Pull the ag img contrast files
for i = 1:length(agbpSubjects)
	fullPath = [pathPrefix agbpSubjkects{i} pathPostfix];
	keyboard
	copyfile(fullPath,homePath);
end