%{
% Select a brain slice:
brainSlice = 52; % see ../figures/brainslice_ex.png
idx1 = 121*145*brainSlice;
idx2 = (121*145) + idx1 - 1;

agonists = agonists(idx1:idx2,:)
antagonists = antagonists(idx1:idx2,:);
%}

addpath(genpath('../../'));

% Load slice 52
load agonists_52
load antagonists_52

validationSet = 7;

% Rectify to [0,1]
agonists = agonists - repmat(min(agonists),size(agonists,1),1);
agonists = agonists./repmat(max(agonists),size(agonists,1),1);

antagonists = antagonists - repmat(min(antagonists),size(antagonists,1),1);
antagonists = antagonists./repmat(max(antagonists),size(antagonists,1),1);

% Kill NaNs
agonists(isnan(agonists)) = 0;
antagonists(isnan(antagonists)) = 0;

% Split, training and val;
agTrain = agonists(:,1:end-validationSet);
antTrain = antagonists(:,1:end-validationSet);
train_x = [agTrain antTrain]';

agTest = agonists(:,end-validationSet+1:end);
antTest = antagonists(:,end-validationSet+1:end);

test_x = [agTest antTest]';

train_y = zeros(size(train_x,1),2);
train_y(1:size(agTrain,2),1) = 1;
train_y(end-size(antTrain,2)+1:end,2) = 1;


test_y = zeros(size(test_x,1),2);
test_y(1:size(agTest,2),1) = 1;
test_y(end-size(antTest,2)+1:end,2) = 1;


%%  ex1 train a 100 hidden unit RBM and visualize its weights
rand('state',0)
dbn.sizes = [500];
opts.numepochs =   50;
opts.batchsize =   2;
opts.momentum  =   0.3;
opts.alpha     =   0.3;
dbn = dbnsetup(dbn, train_x, opts);
dbn = dbntrain(dbn, train_x, opts)

%% Visualise goodies
rbmvis(dbn.rbm{1}, train_x, opts)

%% unfold dbn to nn
nn = dbnunfoldtonn(dbn, 2);
nn.activation_function = 'sigm';

%train nn
opts.numepochs =  50;
opts.batchsize = 2;
opts.alpha = 0.05;
nn = nntrain(nn, train_x, train_y, opts);

%%
[er, bad] = nntest(nn, test_x, test_y);

accuracy = 100*(1-er);







