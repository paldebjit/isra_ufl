#!/bin/bash

mkdir -pv /opt/tools
export TOOL_HOME=/opt/tools
export HOST_HOME=/opt/hostdir

## Upgrading Fedora System
dnf -y update
dnf -y install vim gcc gcc-g++ llvm llvm-devel wget git make cmake tmux python3-devel
ln -s /etc/alternatives/llvm-config /usr/bin/llvm-config-9

## Setting up the tool chain

python3 -m venv $TOOL_HOME/hcl_isra
source $TOOL_HOME/hcl_isra/bin/activate

cd $TOOL_HOME
git clone https://github.com/pasqoc/heterocl.git -b bsim_fpga
cd heterocl
make -j16

cd $TOOL_HOME
git clone --recursive https://github.com/pasqoc/incubator-tvm.git -b bsim_fpga
cd incubator-tvm
mkdir -pv build
cp cmake/config.cmake build
cd build
sed -i 's/USE_LLVM\ OFF/USE_LLVM\ ON/g' config.cmake
cmake ..
make -j16

cd $TOOL_HOME/incubator-tvm
export TVM_HOME=`pwd`
export PYTHONPATH=$TVM_HOME/python:${PYTHONPATH}

echo "Printing TVM version from incubator-tvm"
python -c "import tvm; print(tvm.__version__)"

echo "Checking HeteroCL + TVM compatibility"
python -c "import heterocl as hcl; import tvm;"

echo "Checking TVM + HeteroCL compatibility"
python -c "import tvm; import heterocl as hcl;"

cd $HOST_HOME
