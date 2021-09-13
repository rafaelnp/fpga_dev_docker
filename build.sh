#!/bin/bash

docker build --cache-from rnprnp/fpga_dev:0.2 -t rnprnp/fpga_dev:0.2 .
