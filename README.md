# Instruction to reproduce the incompatibility of HeteroCL and TVM contained in incubator-TVM!

 - `git clone https://github.com/paldebjit/isra_ufl.git ISRA`
 - `cd ISRA`
 - `sh build_docker.sh Fedora`

Once the Docker container is built, it will enter at `/opt/hostdir`. From that location run the following command:
 - `sh isra.sh`

The output will show two things.

 1. The TVM version from `incubator-tvm/bsim_fpga` branch
 2. Compatibility check between HeteroCL and TVM 
