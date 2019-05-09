#######################################################################
#                            Compile Stage                            #
#######################################################################

FROM ubuntu:bionic as builder

#######################
#  Libraries & Utils  #
#######################

RUN apt-get -qq update && apt-get upgrade -y && apt-get install -y \
    cmake g++ \
    libboost-all-dev libopenblas-dev opencl-headers ocl-icd-libopencl1 ocl-icd-opencl-dev zlib1g-dev \
    qt5-default qt5-qmake \
    git wget curl

################
#  Leela Zero  #
################

# get Leela and its submodules
RUN git clone https://github.com/leela-zero/leela-zero.git
WORKDIR /leela-zero/
RUN git submodule update --init --recursive

# compile Leela
RUN mkdir /leela-zero/build
WORKDIR /leela-zero/build/
# CPU build
RUN CXX=g++ CC=gcc cmake -DUSE_CPU_ONLY=1 ..
RUN cmake --build . --target leelaz --config Release -- -j2

# get latest trained weights
RUN mkdir -p /opt/leelaz_weights
RUN curl http://zero.sjeng.org/best-network --output /opt/leelaz_weights/network.gz

##################
#  SGF Analyser  #
##################

WORKDIR /
RUN git clone https://github.com/chermes/sgf-analyzer.git

#######################################################################
#                Worker Stage (i.e. without compilers)                #
#######################################################################

FROM ubuntu:bionic

ENV DEBIAN_FRONTEND=noninteractive

# Dependencies:
# (1) leelaz
# (2) sgf-analyzer
# (3) worker.py script
RUN apt-get -qq update && apt-get upgrade -y && apt-get install -y \
    libboost-program-options1.65.1 libboost-system1.65.1 libboost-filesystem1.65.1 \
    python3 python3-numpy python3-yaml python3-matplotlib \
    python3-requests

# copy compiled leelaz
COPY --from=builder /leela-zero/build/leelaz /bin/

# copy cloned sgf-analyzer
COPY --from=builder /sgf-analyzer /opt/sgf-analyzer
# update sgf-analyzer config
COPY ./configs/sgf_analyser_config.yaml /opt/sgf-analyzer/config.yaml

# copy latest trained weights
RUN mkdir -p /opt/leelaz_weights
COPY --from=builder /opt/leelaz_weights/network.gz /opt/leelaz_weights/

# install the worker script
RUN mkdir -p /opt/lz_worker
WORKDIR /opt/lz_worker
ENV API_SERVER localhost
ENV API_PORT 5000

COPY src /opt/lz_worker

CMD ["python3", "worker.py"]
