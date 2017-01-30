#!/bin/bash

list="dfu-util-0.8 dfu-util-0.9 libusb-1.0.9 libusb-1.0.20 libusb-1.0.21 eudev-3.1.5 hidapi OpenOCD"

for i in $list
do
    cd $i
    make distclean
    cd ..
done

git clean -f -d
