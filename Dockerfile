
FROM ghdl/vunit:gcc

LABEL maintainer="Rafael do Nascimento Pereira <rnp@25ghz.net>"
LABEL description="FGPA development and verification environment"
LABEL version="0.1"


# Disable Prompt During Packages Installation
ENV DEBIAN_FRONTEND=noninteractive
ENV YOSYS_SRC /usr/src/yosys
ENV SBY_SRC /usr/src/symbiyosys
ENV GHDL_YOSYS_SRC /usr/src/ghdl-yosys-plugin
ENV YICES2_SRC /usr/src/yices2


# install dependencies
RUN apt-get update && \
apt-get install -y --no-install-recommends \
build-essential \
clang \
bison \
flex \
libreadline-dev \
gawk \
tcl-dev \
libffi-dev \
git \
mercurial \
graphviz \
xdot \
pkg-config \
python \
python3 \
libftdi-dev \
gperf \
libboost-program-options-dev \
autoconf \
libgmp-dev \
cmake \
wget \
curl \
libpython2.7

# yosys
RUN git clone https://github.com/YosysHQ/yosys.git ${YOSYS_SRC}
WORKDIR ${YOSYS_SRC}
RUN make -j$(nproc) && \
make install && \
make clean

# symbiyosys
RUN git clone https://github.com/YosysHQ/SymbiYosys.git ${SBY_SRC}
WORKDIR ${SBY_SRC}
RUN make install

RUN git clone https://github.com/SRI-CSL/yices2.git ${YICES2_SRC}
WORKDIR ${YICES2_SRC}
RUN autoconf && \
./configure && \
make -j$(nproc) && \
make install && \
make clean

# ghdl-yosys-plugin
RUN git clone https://github.com/ghdl/ghdl-yosys-plugin ${GHDL_YOSYS_SRC}
WORKDIR ${GHDL_YOSYS_SRC}
RUN make && \
make install && \
make clean


# cleanup
RUN apt-get autoclean && \
apt-get autoremove && \
apt-get clean && \
rm -fr /var/lib/apt/lists/*

ENTRYPOINT ["/bin/bash"]