waitfor 0 /t 6 2>NUL
%1\dfu-util-bin.exe -l -d %2 -a %3 -s %4 -D %5
%1\dfu-util-bin.exe -l -d %2 -a %3 --reset-stm32
