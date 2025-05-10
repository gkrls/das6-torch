### Install Anaconda

You need to install Anaconda on `/var/scratch/<YOUR_USERNAME>/` because `$HOME` has a small quota (~4GB), not enough for Anaconda. Run the following

```bash
cd /var/scratch/<YOUR_USERNAME>
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x Miniconda3-latest-Linux-x86_64.sh
./Miniconda3-latest-Linux-x86_64.sh
```

Pay attention during the installation. At some point you will be asked for a directory to install Anaconda. The default option **is not** what
you want because it points to your `$HOME` dir. You should change it to `/var/scratch/<YOUR_USERNAME>/miniconda3`

At some point you will also be asked if you want the conda env to be activated each time you open a shell. I think you should say no here.

Once the installation finished `logout` and back in.

When back in run 
```
eval "$(/var/scratch/<YOUR_USERNAME>/miniconda3/bin/conda shell.bash hook)"
conda init
```

The above will activate the `base` environment and also make the `conda,deactivate,etc...` commands available by modifying your `.bashrc`

From now on you can create new environments if you want (read the docs or ask a robot about it), or just work on the base env. You can deactivate it with `deactivate`

### Install Pytorch

One you have a conda environment run the following to install PyTorch:

```bash
pip3 install torch torchvision torchaudio

```

### Validate Torch installation

```
sbatch ./test-torch.sh
```

Once the job finishes you and `.err` and an `.out` file is created. The `.out` file should look like this:

```
Job ID: 1169340
Node List: node[009,011-013,022-023]
Number of Nodes: 6
Tasks: 6
Node: 4, Task ID: 4, Host: node022, CUDA: True
GPU: NVIDIA RTX A4000
Node: 2, Task ID: 2, Host: node012, CUDA: True
GPU: NVIDIA RTX A4000
Node: 5, Task ID: 5, Host: node023, CUDA: True
GPU: NVIDIA RTX A4000
Node: 0, Task ID: 0, Host: node009, CUDA: True
GPU: NVIDIA RTX A4000
Node: 1, Task ID: 1, Host: node011, CUDA: True
GPU: NVIDIA RTX A4000
Node: 3, Task ID: 3, Host: node013, CUDA: True
GPU: NVIDIA RTX A4000

```