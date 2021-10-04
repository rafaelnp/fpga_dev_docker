
#FROM ghdl/vunit:gcc
FROM archlinux:base-devel

LABEL maintainer="Rafael do Nascimento Pereira <rnp@25ghz.net>"
LABEL description="FGPA development and verification environment"
LABEL version="0.3"


# Disable Prompt During Packages Installation
#ENV DEBIAN_FRONTEND=noninteractive
ENV YOSYS_SRC /usr/src/yosys
ENV SBY_SRC /usr/src/symbiyosys
ENV GHDL_YOSYS_SRC /usr/src/ghdl-yosys-plugin
ENV YICES2_SRC /usr/src/yices2


# install dependencies
RUN pacman -Syu --noconfirm  && \
pacman -S --noconfirm git \
iverilog \
python \
python-pip \
ghdl-llvm


## install python based tootls: vunit, cocotb and pytest
RUN pip install vunit_hdl cocotb cocotb-test

# cleanup
WORKDIR /root
RUN rm -fr .cache && \
pacman -Scc --noconfirm

## yosys
#RUN git clone https://github.com/YosysHQ/yosys.git --depth=1 ${YOSYS_SRC}
#WORKDIR ${YOSYS_SRC}
#RUN make -j$(nproc) && \
#make install && \
#cd .. && \
#rm -fr yosys
#
## symbiyosys
#RUN git clone https://github.com/YosysHQ/SymbiYosys.git --depth=1 ${SBY_SRC}
#WORKDIR ${SBY_SRC}
#RUN make install && \
#cd .. && \
#rm -fr SymbiYosys
#
#RUN git clone https://github.com/SRI-CSL/yices2.git --depth=1 ${YICES2_SRC}
#WORKDIR ${YICES2_SRC}
#RUN autoconf && \
#./configure && \
#make -j$(nproc) && \
#make install && \
#cd .. && \
#rm -fr yices2
#
## ghdl-yosys-plugin
#RUN git clone https://github.com/ghdl/ghdl-yosys-plugin --depth=1 ${GHDL_YOSYS_SRC}
#WORKDIR ${GHDL_YOSYS_SRC}
#RUN make && \
#make install && \
#cd .. && \
#rm -fr ghdl-yosys-plugin
#
