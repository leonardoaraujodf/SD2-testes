@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto c1697ab19a21426fab5631d4ef3021b7 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot testbench_memory_behav xil_defaultlib.testbench_memory -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
