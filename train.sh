#!/bin/bash

#SBATCH --job-name=remi    # 작업 이름
#SBATCH --partition=P2        
#SBATCH --gres=gpu:1  
#SBATCH --time=0-12:00:00        # 최대 수행 시간 (d-hh:mm:ss 형식)
#SBATCH --mem=16G                # RAM 크기
#SBATCH --cpus-per-task=4        # CPU 개수 (4개 권장)
#SBATCH --output=/home/s1/sewonlee/slurm_log/S-%x.%j.out   # 실행 결과 std output을 저장할 파일

source ${HOME}/.bashrc
source ${HOME}/miniconda3/bin/activate
conda activate remi
cd "/home/s1/sewonlee/projects/REMI"

COMMAND="python src/train.py --model_type ComiRec-SA --gpu 0 --dataset kindle"

srun $COMMAND

