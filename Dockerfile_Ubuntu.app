#Copyright 2020 Debjit Pal
#
#Permission is hereby granted, free of charge, to any person obtaining a copy of this 
#software and associated documentation files (the "Software"), to deal in the Software 
#without restriction, including without limitation the rights to use, copy, modify, 
#merge, publish, distribute, sublicense, and/or sell copies of the Software, and 
#to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all 
#copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
#INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
#PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE 
#FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
#ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

FROM ubuntu:18.04
MAINTAINER Debjit Pal <work.debjitpal@gmail.com>
RUN apt-get clean all
RUN apt-get update && \
    apt-get -y install wget git
#RUN wget \
#    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
#    --no-check-certificate && \
#    chmod u+x Miniconda3-latest-Linux-x86_64.sh && \
#    /bin/bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda && \
#    rm -rf Miniconda3-latest-Linux-x86_64.sh && \
#    /opt/conda/bin/conda upgrade -y --all && \
#    /opt/conda/bin/conda install -y conda-build conda-verify && \
#    /opt/conda/bin/conda create -y --name srgtut python=3.7 && \
#    /opt/conda/bin/conda install -n srgtut -c conda-forge -y vim emacs tmux && \
#    /opt/conda/bin/conda install -n srgtut -c anaconda -y git && \
#    /opt/conda/bin/conda clean -ya
#
ADD ./hostdir /opt/hostdir
WORKDIR /opt/hostdir
#
#ENV PATH /opt/conda/bin:$PATH
#
#ENTRYPOINT ["conda", "run", "-n", "srgtut", "python", "app/myapp.py"]
