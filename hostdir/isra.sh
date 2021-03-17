#!/bin/bash

apt-get update
apt-get -y upgrade
apt-get -y install vim gcc g++ llvm wget git make cmake tmux
cd /opt
wget https://repo.anaconda.com/archive/Anaconda3-2020.11-Linux-x86_64.sh
chmod +x Anaconda3-2020.11-Linux-x86_64.sh
./Anaconda3-2020.11-Linux-x86_64.sh -b -p /opt/conda3
rm -rf Anaconda3-2020.11-Linux-x86_64.sh
## >>> conda initialize >>>
## !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/conda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/conda3/etc/profile.d/conda.sh" ]; then
        . "/opt/conda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/conda3/bin:$PATH"
    fi
fi
unset __conda_setup
## <<< conda initialize <<<
cd /opt
conda env create -f hostdir/isra.yml
conda activate hcl_isra
mkdir -pv /opt/tools
cd /opt/tools
git clone https://github.com/cornell-zhang/heterocl.git
cd heterocl
git reset --hard 9dd6c5e7787f159231c209acc7bfa425c1a20ebc
make -j16
cd ..
git clone --recursive https://github.com/pasqoc/incubator-tvm.git -b bsim_fpga
cd incubator-tvm
mkdir -pv build
cp cmake/config.cmake build
cd build
cmake ..
make -j8
cd /opt/tools/incubator-tvm
export TVM_HOME=`pwd`
export PYTHONPATH=$TVM_HOME/python:${PYTHONPATH}
echo "Printing TVM version from incubator-tvm"
python -c "import tvm; print(tvm.__version__)"
echo "Checking TVM + HeteroCL compatibility"
python -c "import heterocl as hcl; import tvm; from tvm import te"
