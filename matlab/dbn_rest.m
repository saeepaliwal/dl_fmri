addpath(genpath('../../'));

% Load slice 52
load agonists_rest62
load antagonists_rest62


% Rectify to [0,1]
agonists = agonists - repmat(min(agonists),size(agonists,1),1);
agonists = agonists./repmat(max(agonists),size(agonists,1),1);

antagonists = antagonists - repmat(min(antagonists),size(antagonists,1),1);
antagonists = antagonists./repmat(max(antagonists),size(antagonists,1),1);

% Kill NaNs
agonists(isnan(agonists)) = 0;
antagonists(isnan(antagonists)) = 0;

% Split, training and val;
train_x = [agonists(:,1:end-1) antagonists(:,1:end-1)]';
test_x = [agonists(:,end) antagonists(:,end)]';

%train_y = antagonists(:,1:5)';
%test_y = antagonists(:,6)';

%%  ex1 train a 100 hidden unit RBM and visualize its weights
rand('state',0)
dbn.sizes = [100];
opts.numepochs =   40;
opts.batchsize =   6;
opts.momentum  =   0.3;
opts.alpha     =   0.1;
dbn = dbnsetup(dbn, train_x, opts);
dbn = dbntrain(dbn, train_x, opts)

%% Visualise goodies
rbmvis(dbn.rbm{1}, train_x, opts)
keyboard
%%  ex2 train a 100-100 hidden unit DBN and use its weights to initialize a NN
rand('state',0)
%train dbn
dbn.sizes = [100 100];
opts.numepochs =   1;
opts.batchsize = 1;
opts.momentum  =   0;
opts.alpha     =   1;
dbn = dbnsetup(dbn, train_x, opts);
dbn = dbntrain(dbn, train_x, opts);

%unfold dbn to nn
nn = dbnunfoldtonn(dbn, 10);
nn.activation_function = 'sigm';

%train nn
opts.numepochs =  1;
opts.batchsize = 100;
nn = nntrain(nn, train_x, train_y, opts);
[er, bad] = nntest(nn, test_x, test_y);

assert(er < 0.10, 'Too big error');