#!/bin/bash
cd /mnt/c/Users/Charan.CharanXPS/systolic_array_pe
iverilog -g2012 -o sim pe_array_tb.sv pe_array.sv pe.sv
vvp sim
