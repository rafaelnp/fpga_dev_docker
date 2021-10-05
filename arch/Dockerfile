
FROM archlinux:base-devel

LABEL maintainer="Rafael do Nascimento Pereira <rnp@25ghz.net>"
LABEL description="FGPA development and verification environment"
LABEL version="0.3"

ENV SBY_SRC /usr/src/symbiyosys
ENV GHDL_YOSYS_SRC /usr/src/ghdl-yosys-plugin

# install dependencies
RUN pacman -Syu --noconfirm  && \
pacman -S --noconfirm git \
iverilog \
python \
python-pip \
ghdl-llvm \
yosys \
yices

## install python based tootls: vunit, cocotb and pytest
RUN pip install vunit_hdl cocotb cocotb-test

# symbiyosys
RUN git clone https://github.com/YosysHQ/SymbiYosys.git --depth=1 ${SBY_SRC}
WORKDIR ${SBY_SRC}
RUN make install && \
cd .. && \
rm -fr SymbiYosys

# ghdl-yosys-plugin
# workaround for compilation
RUN mkdir /usr/include/ghdl && \
ln -s /usr/include/ghdlsynth.h /usr/include/ghdl/synth.h

RUN git clone https://github.com/ghdl/ghdl-yosys-plugin --depth=1 ${GHDL_YOSYS_SRC}
WORKDIR ${GHDL_YOSYS_SRC}
RUN make && \
make install && \
cd .. && \
rm -fr ghdl-yosys-plugin

# cleanup
WORKDIR /root
RUN rm -fr .cache && \
pacman -Scc --noconfirm

