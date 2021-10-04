#!/bin/bash

docker build --cache-from rnprnp/fpga_dev_arch:0.3 -t rnprnp/fpga_dev_arch:0.3 .
