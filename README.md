# Instruction to reproduce the incompatibility of HeteroCL and TVM contained in incubator-TVM!

 - `git clone https://github.com/paldebjit/isra_ufl.git ISRA`
 - `cd ISRA`
 - `sh build_docker.sh app Ubuntu`

Once the Docker container is built, it will enter at `/opt/hostdir`. From that location run the following command:
 - `sh isra.sh`

The output will show two things.

 1. The TVM version from `incubator-tvm/bsim_fpga` branch
 2. Then it will show a segfault showing the incompatibility of the HeteroCL and this TVM version.
 3. If we fgall back to TVM version tag v0.6.0, the incompatibility with HeteroCL goes away but the incubator-tvm code does not work as it cannot find `te`, `tir` within tvm.

