function send2cluster(fn,queue)

brutusCMD = ['bsub -q vip.' sprintf('%d',queue) 'h "matlab -nodisplay -nojvm -singleCompThread -r ' sprintf('%s',fn) '"'];
system(brutusCMD);
