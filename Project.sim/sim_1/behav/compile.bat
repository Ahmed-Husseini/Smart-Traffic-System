@echo off
set xv_path=D:\\Xillinx_Vivado\\Vivado\\2016.4\\bin
echo "xvhdl -m64 --relax -prj Main_Testbench_vhdl.prj"
call %xv_path%/xvhdl  -m64 --relax -prj Main_Testbench_vhdl.prj -log xvhdl.log
call type xvhdl.log > compile.log
if "%errorlevel%"=="1" goto END
if "%errorlevel%"=="0" goto SUCCESS
:END
exit 1
:SUCCESS
exit 0
