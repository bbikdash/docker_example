

sudo docker run --interactive --tty -ti --gpus all --name bassam_test --rm --shm-size 16G -v /home/user/bbikdash/:/bbikdash bbikdash/ml_training:0.9 /bin/bash
