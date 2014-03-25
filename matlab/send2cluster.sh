#!/bin/bash                                                                                                                                                
module load matlab

BCMD="bsub -q vip.$1h \"matlab -nodisplay -nojvm -singleCompThread -r $2\""
#echo ${BCMD}
eval ${BCMD}


