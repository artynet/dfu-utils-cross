#!/bin/bash

for i in libusb-1.0.20 dfu-util-0.9 libusb-1.0.21 eudev-3.1.5 hidapi
do
    cd $i
    make distclean
    cd ..
done
