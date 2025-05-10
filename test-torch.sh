#!/bin/bash
#SBATCH --job-name=test-torch
#SBATCH --output=test-torch_%j_%t.out
#SBATCH --error=test-torch_%j_%t.err
#SBATCH --time=72:00:00
#SBATCH -N 6
#SBATCH -C A4000
#SBATCH --ntasks=6
#SBATCH --ntasks-per-node=1
#SBATCH --gres=gpu:1
#SBATCH --partition=defq

echo "Job ID: $SLURM_JOB_ID"
echo "Node List: $SLURM_JOB_NODELIST"
echo "Number of Nodes: $SLURM_NNODES"
echo "Tasks: $SLURM_NTASKS"

module load cuda12.6/toolkit
module load cuDNN/cuda12.6

source $HOME/.bashrc
conda activate base

srun python <<'EOF'
import os
import torch
print(f"Node: {os.environ.get('SLURM_NODEID')}, Task ID: {os.environ.get('SLURM_PROCID')}, Host: {os.uname().nodename}, CUDA: {torch.cuda.is_available()}")
if torch.cuda.is_available():
    print(f"GPU: {torch.cuda.get_device_name(0)}")
EOF
