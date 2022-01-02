#!/bin/sh 
### General options 
### -- specify queue -- 
#BSUB -q gpuv100
### -- set the job Name -- 
#BSUB -J Timing_input_MNIST
#BSUB -gpu "num=1:mode=exclusive_process"
### -- ask for number of cores (default: 1) -- 
#BSUB -n 1
### -- specify that the cores must be on the same host -- 
#BSUB -R "span[hosts=1]"
### -- specify that we need 2GB of memory per core/slot -- 
#BSUB -R "rusage[mem=8GB]"
### -- specify that we want the job to get killed if it exceeds 3 GB per core/slot -- 
#BSUB -M 8GB
### -- set walltime limit: hh:mm -- 
#BSUB -W 10:00
### -- set the email address -- 
# please uncomment the following line and put in your e-mail address,
# if you want to receive e-mail notifications on a non-default address
#BSUB -u s153057@student.dtu.dk
### -- send notification at start -- 
#BSUB -B 
### -- send notification at completion -- 
#BSUB -N 
### -- Specify the output and error file. %J is the job-id -- 
### -- -o and -e mean append, -oo and -eo mean overwrite -- 
#BSUB -oo Outputs/Output_%J.out 
#BSUB -eo Outputs/Error_%J.err 

# here follow the commands you want to execute
module load python3/3.8.2
module load cuda/10.2
cd Master-Thesis-2020/Classifying\ MNIST/
python3 input_pic_timing.py
