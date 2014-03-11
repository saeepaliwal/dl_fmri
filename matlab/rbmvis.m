function rbmvis(rbm, x, opts)

assert(isfloat(x), 'x must be a float');
assert(all(x(:)>=0) && all(x(:)<=1), 'all data in x must be in [0:1]');
m = size(x, 1);
numbatches = m / opts.batchsize;

assert(rem(numbatches, 1) == 0, 'numbatches not integer');


kk = randperm(m);
err = 0;
for l = 1: numbatches
	
	batch = x(kk((l - 1) * opts.batchsize + 1 : l * opts.batchsize), :);
	
	v1 = batch;
	h1 = sigmrnd(repmat(rbm.c', opts.batchsize, 1) + v1 * rbm.W');
	v2 = sigmrnd(repmat(rbm.b', opts.batchsize, 1) + h1 * rbm.W);
	h2 = sigm(repmat(rbm.c', opts.batchsize, 1) + v2 * rbm.W');
	
	figure(100);
	subplot(2,10,1:5);
	imagesc(reshape(v1(1,:),121,145)); colormap('bone'); colorbar;
	
	subplot(2,10,6:10);
	imagesc(reshape(v2(1,:),121,145)); colormap('bone'); colorbar;
	
	subplot(2,10,11:15);
	imagesc(reshape(h1(1,:),10,10)); colormap('bone'); colorbar;
	
	subplot(2,10,16:20);
	imagesc(reshape(h2(1,:),10,10)); colormap('bone'); colorbar;
	
	%figure(101);
	%visualize(rbm.W',[0 1],121,145);
	
	%figure;
	%plot(rbm.errorRate);
	xlabel('Epochs')
	ylabel('Average reconstruction error');
	
	pause(0.01);
end
